/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Jblog.dao;

import com.Jblog.entities.User;
import java.sql.*;
public class User_dao {
    private Connection con;

    public User_dao(Connection con) {
        this.con = con;
    }
    
    //Save user info into database.
    public boolean saveUser(User user){
        boolean f = false;
        try{
           String qry = "insert into user(name,email,password,about,image) values(?,?,?,?,?)";
           PreparedStatement pst = this.con.prepareStatement(qry);
           pst.setString(1, user.getName());
           pst.setString(2, user.getEmail());
           pst.setString(3, user.getPassword());
           pst.setString(4, user.getAbout());
           pst.setString(5, user.getImage());
            pst.executeUpdate();
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    //Login Module.
    public User Login(String email,String password){
        User user = null;
         try{
           String qry = "select * from user where email=? And password =?";
           PreparedStatement pst = this.con.prepareStatement(qry);
           pst.setString(1, email);
           pst.setString(2,password);
           ResultSet rst = pst.executeQuery();
           if(rst.next()){
               user = new User();
               user.setId(rst.getInt("uid"));
               user.setName(rst.getString("name"));
               user.setEmail(rst.getString("email"));
               user.setPassword(rst.getString("password"));
               user.setAbout(rst.getString("about"));
               user.setImage(rst.getString("image"));
               user.setCreatedOn(rst.getTimestamp("createdOn"));
           }
         }catch(Exception e){
             e.printStackTrace();
         }
         return user; 
    }
    //Update User info..
public boolean updateUser(User user){
 boolean f = false;
try{
    String qry = "update user set name=?,email=?,password=?,about=?,image=? where uid=?";
           PreparedStatement pst = this.con.prepareStatement(qry);
           pst.setString(1, user.getName());
           pst.setString(2,user.getEmail());
           pst.setString(3, user.getPassword());
           pst.setString(4,user.getAbout());
           pst.setString(5, user.getImage());
           pst.setInt(6, user.getId());
           pst.executeUpdate();
           f = true;
}catch(Exception e){
    System.out.println(e);
}
        return f;
}

//Get user by user id
public User getUserById(int userId){
        User user = null;
         try{
           String qry = "select * from user where uid =?";
           PreparedStatement pst = this.con.prepareStatement(qry);
           pst.setInt(1, userId);
           ResultSet rst = pst.executeQuery();
           if(rst.next()){
               user = new User();
               user.setId(rst.getInt("uid"));
               user.setName(rst.getString("name"));
               user.setEmail(rst.getString("email"));
               user.setPassword(rst.getString("password"));
               user.setAbout(rst.getString("about"));
               user.setImage(rst.getString("image"));
               user.setCreatedOn(rst.getTimestamp("createdOn"));
           }
         }catch(Exception e){
             e.printStackTrace();
         }
         return user; 
    }
}

