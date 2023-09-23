/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Jblog.servlets;

import com.Jblog.dao.Post_dao;
import com.Jblog.entities.Message;
import com.Jblog.entities.Post;
import com.Jblog.entities.User;
import com.Jblog.helper.ConnectionProvider;
import com.Jblog.helper.ImageUploadHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author SuDo
 */
@MultipartConfig
public class doPost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        Part image = request.getPart("image");
        HttpSession s = request.getSession();
        User user = (User) s.getAttribute("CurrentUser");
        Post post = new Post(title,content,image.getSubmittedFileName(),Integer.parseInt(category),user.getId());
        Post_dao dao = new Post_dao(ConnectionProvider.getConnection());
        boolean ack = dao.savePost(post);
        if(ack){
            String path = request.getRealPath("/")+"image"+File.separator+"post"+File.separator+image.getSubmittedFileName();
            ImageUploadHelper.saveFile(image.getInputStream(), path);
             Message msg = new Message("Post upload sucessfully..","success","alert-success");
                s.setAttribute("msg",msg);
              response.sendRedirect("MyPost.jsp");
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
