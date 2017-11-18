/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kitchen.modelo;

import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author sotg10
 */
public class Conexion {
    
    public static final String USERNAME = "root";
    public static final String PASSWORD = "";
    public static final String HOST = "localhost";
    public static final String PORT = "3307";
    public static final String DATABASE = "kitchendb";
    public static final String CLASSNAME = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
    
    public java.sql.Connection conection;
    
    public Conexion() {
        try {
            Class.forName(CLASSNAME);
            conection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException ex) {
            System.out.println("Error en clase para conexion");
        } catch (SQLException exception) {
            System.out.println("Error en Conexion a base de datos");
        }
    }
}
