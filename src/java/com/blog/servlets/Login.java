/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.User_dao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SuDo
 */
@MultipartConfig
public class Login extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String User_email = request.getParameter("email");
            String User_password = request.getParameter("password");
           //out.print("success");
            User_dao dao = new User_dao(ConnectionProvider.getConnection());
           User u = dao.Login(User_email, User_password);
           HttpSession session = request.getSession();
            if(u != null){
                
                session.setAttribute("CurrentUser", u);
                //out.print("success");
                 response.sendRedirect("Home.jsp");
            }else{
                //out.print("Invalid User Name or Password");
                Message msg = new Message("Invalid Email and Password","error","alert-danger");
                session.setAttribute("msg",msg);
                response.sendRedirect("login.jsp");
               
            }
    }



}
