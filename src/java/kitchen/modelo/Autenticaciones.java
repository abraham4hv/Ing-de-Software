/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kitchen.modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author sotg10
 */
public class Autenticaciones extends Conexion{
    private final int IS_ADMIN = 1;
    public Autenticaciones() {
        super();
    }
    
    public boolean autenticarAdmin(String nickname, String email, String password) throws SQLException {
        boolean result = false;
        Statement statement = conection.createStatement();
        ResultSet resultSet = null;
        String consulta = "SELECT NICKNAME_US, EMAIL_US, PASSWORD_US, ISADMIN_US FROM usuarios";
        resultSet = statement.executeQuery(consulta);
        
        while (resultSet.next()) {            
            if (nickname.equals(resultSet.getString("NICKNAME_US"))) {
                if (email.equals(resultSet.getString("EMAIL_US")) && 
                    password.equals(resultSet.getString("PASSWORD_US")) &&
                    resultSet.getInt("ISADMIN_US") == IS_ADMIN) {
                    result = true;
                }
            }
        }
        return result;
    }
    
    public boolean autenticarUser(String nickname, String email, String password) throws SQLException {
        boolean result = false;
        Statement statement = conection.createStatement();
        ResultSet resultSet = null;
        String consulta = "SELECT NICKNAME_US, EMAIL_US, PASSWORD_US FROM usuarios";
        
        resultSet = statement.executeQuery(consulta);
        while (resultSet.next()) {            
            if (nickname.equals(resultSet.getString("NICKNAME_US"))) {
                if (email.equals(resultSet.getString("EMAIL_US")) && 
                    password.equals(resultSet.getString("PASSWORD_US"))) {
                    result = true;
                }
            }
        }
        return result;
    }
    
}
