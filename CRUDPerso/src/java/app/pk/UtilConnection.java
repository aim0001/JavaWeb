/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.pk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Lenov
 */
public class UtilConnection {
     public static Connection seConnecter() throws Exception{
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            return (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/bddpersonne", "root", null);
        } catch (ClassNotFoundException ex) {
            throw new Exception("Impossible de changer le driver !");
        }
        catch(SQLException e){
            throw new Exception("Erreur :"+e.getMessage());
        }
    }
}
