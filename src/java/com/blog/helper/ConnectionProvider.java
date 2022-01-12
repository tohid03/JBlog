/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.helper;
import java.sql.*;
/**
 *
 * @author SuDo
 */
public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection(){
        if(con==null){
         try{
             Class.forName("com.mysql.jdbc.Driver");
           con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","root");
         }catch(Exception e){
             System.out.println(e);
         }
           
        }
         
        return con;
    }
    
}
