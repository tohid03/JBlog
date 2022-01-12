/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.User_dao;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.ImageUploadHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            if (request.getParameter("email") != null) {
                String email = request.getParameter("email");

                try {
                    Connection con = ConnectionProvider.getConnection();
                    PreparedStatement pst = con.prepareStatement("select * from user where email =? ");
                    pst.setString(1, email);
                    ResultSet rst = pst.executeQuery();
                    if (rst.next()) {

                        out.println("email already exist");
                    } else {
                        String name = request.getParameter("name");

                        String password = request.getParameter("password");
                        String about = request.getParameter("about");
                        Part image = request.getPart("image");

                        //Set Values.
                        User user = new User(name, email, password, about, image.getSubmittedFileName());

                        //Save Data on database.
                        User_dao dao = new User_dao(ConnectionProvider.getConnection());
                        //dao.saveUser(user);

                        if (dao.saveUser(user)) {
                            String path = request.getRealPath("/")+"image"+File.separator+image.getSubmittedFileName();
                            ImageUploadHelper.saveFile(image.getInputStream(), path );
                            out.println("done");

                        } else {
                            out.print("Something went Wrong...");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
