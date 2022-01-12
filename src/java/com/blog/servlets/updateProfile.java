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
import com.blog.helper.ImageUploadHelper;
import java.io.File;
import java.io.IOException;
import static java.lang.System.out;
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
public class updateProfile extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String name = request.getParameter("name");
          String email = request.getParameter("email");
          String password = request.getParameter("pass");
          String about =  request.getParameter("about");
          Part image = request.getPart("image");
          
          HttpSession s = request.getSession();
           User user = (User) s.getAttribute("CurrentUser");
           user.setName(name);
           user.setEmail(email);
           user.setPassword(password);
           user.setAbout(about);
           String oldPic = user.getImage();
           if(image.getSubmittedFileName()!=""){
           user.setImage(image.getSubmittedFileName());
           }else{
               user.setImage(oldPic);
           }
           User_dao dao = new User_dao(ConnectionProvider.getConnection());
           boolean ack = dao.updateUser(user);
           if(ack){
               String path = request.getRealPath("/")+"image"+File.separator;
               //System.out.println(image.getSubmittedFileName());
               if(image.getSubmittedFileName()!= ""){
               ImageUploadHelper.deleteFile(path+oldPic);
               ImageUploadHelper.saveFile(image.getInputStream(), path+user.getImage());
               }
                Message msg = new Message("Profile Update sucessfully..","success","alert-success");
             
                s.setAttribute("msg",msg);
               response.sendRedirect("profile.jsp");
              out.print("done");
           }else{
               out.println("error");
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
