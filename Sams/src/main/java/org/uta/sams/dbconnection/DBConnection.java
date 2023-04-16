/*
 * DBConnection.java
 *
 * Created on March 1, 2006, 10:21 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package org.uta.sams.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author sunil bolisetty
 */
public class DBConnection {
    private static DBConnection dbconnection=null;
    
    /** Creates a new instance of DBConnection */
    private DBConnection() {
    }
    
    public static DBConnection getInstance(){
        if(dbconnection==null)dbconnection= new DBConnection();
        return dbconnection;
    }
    
    Connection getConnection() throws ClassNotFoundException, SQLException{
        Statement stmt;
        Connection con=null;
             Class.forName("com.mysql.jdbc.Driver");
             String url = "jdbc:mysql://51.81.160.154:3306/dmp4205_samsdb";
            con = DriverManager.getConnection(url,"dmp4205_user_samsdb", "user_samsdb");
//             con =DriverManager.getConnection(
//                     url,"dmp4205_ASE_Team11", "ASE_Team11");
        return con;
    }
}
