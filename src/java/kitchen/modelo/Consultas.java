/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kitchen.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author sotg10
 */
public class Consultas extends Conexion{
    
    public boolean registrarUsuario(String nombreUs, String apellidoUs, String nicknameUs, 
            String emailUs, String passwordUs,String cumpleUs) throws SQLException {
        
        boolean resultado = false;
        int seEjecuto;
        PreparedStatement preparedStatement = null;
        String consulta = "INSERT INTO usuarios (NOMBRE_US, APELLIDO_US, NICKNAME_US, EMAIL_US, PASSWORD_US, BIRTH_US) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            preparedStatement = conection.prepareStatement(consulta);
        
            preparedStatement.setString(1, nombreUs);
            preparedStatement.setString(2, apellidoUs);
            preparedStatement.setString(3, nicknameUs);
            preparedStatement.setString(4, emailUs);
            preparedStatement.setString(5, passwordUs);
            preparedStatement.setString(6, cumpleUs);

            seEjecuto = preparedStatement.executeUpdate();

            if (seEjecuto == 1) {
                resultado = true;
            }
        } catch (SQLException e) {
            System.out.println("kitchen.modelo.Consultas.registrarUsuario()" + e.getMessage());
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }    
        return resultado;
    }
    
    public List getReservaciones(String nickname) throws SQLException {
        List<JSONObject> reservaciones = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        
        ResultSet resultSet = null;
        String consulta = "SELECT * FROM reservacion WHERE NICKNAME_US = ? AND ESTADO_RES = 1";
        
        preparedStatement = conection.prepareStatement(consulta);
        preparedStatement.setString(1, nickname);
        
        resultSet = preparedStatement.executeQuery();
        
        while (resultSet.next()) {
            JSONObject reservacion = new JSONObject();
            reservacion.put("id", resultSet.getString("ID_RES"));
            reservacion.put("noMesa",resultSet.getString("ID_MES"));
            reservacion.put("noPersonas",resultSet.getString("NOPERSONA_RES"));
            reservacion.put("hora",resultSet.getString("HORA_RES"));
            reservacion.put("dia",resultSet.getString("DIA_RES"));
            reservacion.put("estado",resultSet.getString("ESTADO_RES"));
            reservaciones.add(reservacion);
        }
        
        return reservaciones;
    }
    
    public boolean setReservado(String noReservacion) throws SQLException {
        boolean resultado = false;
        
        PreparedStatement preparedStatement = null;
        
        String consulta = "UPDATE reservacion SET ESTADO_RES = 0 WHERE ID_RES = ?";
        
        preparedStatement = conection.prepareStatement(consulta);
        preparedStatement.setString(1, noReservacion);
        
        resultado = preparedStatement.execute();
        
        return resultado;
    }
    
    public List getReservacionesAdmin() throws SQLException {
        List<JSONObject> reservaciones = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        
        ResultSet resultSet = null;
        String consulta = "SELECT * FROM reservacion WHERE ESTADO_RES = 1";
        
        preparedStatement = conection.prepareStatement(consulta);
        
        resultSet = preparedStatement.executeQuery();
        
        while (resultSet.next()) {
            JSONObject reservacion = new JSONObject();
            reservacion.put("id", resultSet.getString("ID_RES"));
            reservacion.put("nombre", resultSet.getString("NICKNAME_US"));
            reservacion.put("noMesa",resultSet.getString("ID_MES"));
            reservacion.put("noPersonas",resultSet.getString("NOPERSONA_RES"));
            reservacion.put("hora",resultSet.getString("HORA_RES"));
            reservacion.put("dia",resultSet.getString("DIA_RES"));
            reservacion.put("estado",resultSet.getString("ESTADO_RES"));
            reservaciones.add(reservacion);
        }
        
        return reservaciones;
    }
    
    public boolean reservarMesa(String nickname, String noMesa, String noPesona, 
            String hora, String dia) throws SQLException {
        
        boolean resultado = false;
        int seEjecuto;
        PreparedStatement preparedStatement = null;
        String consulta = "INSERT INTO reservacion (NICKNAME_US, ID_MES, NOPERSONA_RES, HORA_RES, DIA_RES, ESTADO_RES) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            preparedStatement = conection.prepareStatement(consulta);
        
            preparedStatement.setString(1, nickname);
            preparedStatement.setString(2, noMesa);
            preparedStatement.setString(3, noPesona);
            preparedStatement.setString(4, hora);
            preparedStatement.setString(5, dia);
            preparedStatement.setString(6, "1");

            seEjecuto = preparedStatement.executeUpdate();

            if (seEjecuto == 1) {
                resultado = true;
            }
        } catch (SQLException e) {
            System.out.println("kitchen.modelo.Consultas.registrarUsuario()" + e.getMessage());
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }    
        return resultado;
    }
    
    public List getReservado() throws SQLException {
       List<JSONObject> residentes = new ArrayList<>();
        
        Statement statement = conection.createStatement();
        ResultSet resultSet = null;
        String consulta = "SELECT * FROM reservacion";
        resultSet = statement.executeQuery(consulta);
        
        while (resultSet.next()) {
            JSONObject residente = new JSONObject();
            residente.put("mesaId",resultSet.getString("ID_MES"));
            residente.put("ocupado",resultSet.getString("ESTADO_RES"));
            residentes.add(residente);
        }
        
        return residentes;
        
    }
    
    public boolean ocupado(List<JSONObject> mesas, String noMesa) {
        boolean result = false;
        
        for (int i = 0; i < mesas.size(); i++) {
            JSONObject mesa = mesas.get(i);
       
            if (mesa.get("mesaId").equals(noMesa) && mesa.get("ocupado").equals("1")) {
                result = true;
            }
        }
        
        return result;
    }
    
    public boolean registrarPlatillo(String nombre, String categoria, String subCategoria, 
            String descripcion, String precio) throws SQLException {
        
        boolean resultado = false;
        int seEjecuto;
        PreparedStatement preparedStatement = null;
        String consulta = "INSERT INTO carta (NOMBRE_CA, CATEGORIA_CA, SUBCAT_CA, DESCRIPCION_CA, PRECIO_CA) VALUES (?, ?, ?, ?, ?)";
        
        try {
            preparedStatement = conection.prepareStatement(consulta);
        
            preparedStatement.setString(1, nombre);
            preparedStatement.setString(2, categoria);
            preparedStatement.setString(3, subCategoria);
            preparedStatement.setString(4, descripcion);
            preparedStatement.setString(5, precio);

            seEjecuto = preparedStatement.executeUpdate();

            if (seEjecuto == 1) {
                resultado = true;
            }
        } catch (SQLException e) {
            System.out.println("kitchen.modelo.Consultas.registrarUsuario()" + e.getMessage());
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        }    
        return resultado;
    }
    
    public List getPlatillos() throws SQLException {
        List<JSONObject> platillos = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        
        ResultSet resultSet = null;
        String consulta = "SELECT * FROM carta";
        
        preparedStatement = conection.prepareStatement(consulta);
        
        resultSet = preparedStatement.executeQuery();
        
        while (resultSet.next()) {
            JSONObject platillo = new JSONObject();
            platillo.put("nombre", resultSet.getString("NOMBRE_CA"));
            platillo.put("categoria",resultSet.getString("CATEGORIA_CA"));
            platillo.put("subCategoria",resultSet.getString("SUBCAT_CA"));
            platillo.put("descripcion",resultSet.getString("DESCRIPCION_CA"));
            platillo.put("precio",resultSet.getString("PRECIO_CA"));
            platillos.add(platillo);
        }
        
        return platillos;
    }
    
}
