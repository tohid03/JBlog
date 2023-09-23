/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Jblog.servlets;

import com.Jblog.dao.Post_dao;
import com.Jblog.entities.Post;
import com.Jblog.entities.User;
import com.Jblog.helper.ConnectionProvider;
import com.Jblog.helper.ImageUploadHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Tohid
 */
public class updatePost extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            Part image = request.getPart("Image");
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("CurrentUser");
            Post_dao dao = new Post_dao(ConnectionProvider.getConnection());
            String imageName = null;
            if(image != null){
                imageName = image.getSubmittedFileName();
            }
            String oldPic = null;
            Post post = dao.getPostById(id);

            oldPic = post.getpImage();
            if (imageName != null) {
                post.setpImage(imageName);
            } else {
                post.setpImage(oldPic);
            }

            Post post1 = new Post(id, title, content, imageName, Integer.parseInt(category), user.getId());

            boolean ack = dao.UpdatePost(post);
            if (ack) {
                String path = request.getRealPath("/") + "image" + File.separator + "post" + File.separator;
                if (imageName != null) {
                    ImageUploadHelper.deleteFile(path + oldPic);
                    ImageUploadHelper.saveFile(image.getInputStream(), path + post1.getpImage());

                    out.write("<div class=\"alert alert-success\" id=\"success-alert\">\n"
                            + "   <button type=\"button\" class=\"close\" data-dismiss=\"alert\">x</button>\n"
                            + "   <strong>Update Success!</strong>\n"
                            + "</div>");
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
