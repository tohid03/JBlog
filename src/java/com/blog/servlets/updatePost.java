/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.Post_dao;
import com.blog.entities.Message;
import com.blog.entities.Post;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.ImageUploadHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author SuDo
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
        int pid  = Integer.parseInt(request.getParameter("pid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        Part image = request.getPart("pImage");
        HttpSession s = request.getSession();
        Post_dao dao = new Post_dao(ConnectionProvider.getConnection());
        List<Post> plist = null;
        String oldPic = null;
        plist = dao.getPostById(pid);
            for (Post p : plist) {
            oldPic = p.getpImage();
           if(image.getSubmittedFileName()!=""){
           p.setpImage(image.getSubmittedFileName());
           }else{
               p.setpImage(oldPic);
           }
            
         
        Post post = new Post(pid,title,content,image.getSubmittedFileName(),Integer.parseInt(category));
        
        boolean ack = dao.UpdatePost(post);
        if(ack){
            String path = request.getRealPath("/")+"image"+File.separator+"post"+File.separator;
            if(image.getSubmittedFileName()!= ""){
               ImageUploadHelper.deleteFile(path+oldPic);
               ImageUploadHelper.saveFile(image.getInputStream(), path+p.getpImage());
               }
            
           
             Message msg = new Message("Post upload sucessfully..","success","alert-success");
              s.setAttribute("msg",msg);
              response.sendRedirect("post.jsp");
        }
        
        }
    }}

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
