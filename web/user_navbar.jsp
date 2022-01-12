<%-- 
    Document   : user_navbar
    Created on : Dec 12, 2021, 3:59:57 PM
    Author     : SuDo
--%>
<%@page import="com.blog.entities.Message"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {
        Message msg = new Message("Please Login First.", "error", "alert-danger");
        session.setAttribute("msg", msg);
        response.sendRedirect("login.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="tm-header" id="tm-header">
    <div class="tm-header-wrapper">
        <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="text-center">
            <img src="image/<%=user.getImage()%>" style="height: 200px;width: 200px;border-radius: 50%;"  class="mb-3 mx-auto" alt="Profile Image.."/> 
        </div>            
        <h1 class="text-center"><%=user.getName()%></h1>
   
    <nav class="tm-nav" id="tm-nav">            
        <ul>
            <li class="tm-nav-item"><a href="Home.jsp" class="tm-nav-link">
                    <i class="fas fa-house-user"></i>
                    Home
                </a></li>
            <li class="tm-nav-item"><a href="profile.jsp" class="tm-nav-link">
                    <i class="far fa-address-card"></i>
                    Profile
                </a></li>
            <li class="tm-nav-item"><a href="MyPost.jsp" class="tm-nav-link">
                    <i class="fas fa-clipboard-list"></i>
                    My Posts
                </a></li>
             <li class="tm-nav-item">
                 <a href="AddPost.jsp" class="tm-nav-link">
                    <i class="fas fa-blog"></i>
                    Add Post
                </a></li>
                <li class="tm-nav-item">
                    <a href="logout.jsp" class="tm-nav-link">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a></li>
        </ul>
    </nav>
    <div class="tm-mb-65">
        <a rel="nofollow" href="#" class="tm-social-link">
            <i class="fab fa-facebook tm-social-icon"></i>
        </a>
        <a href="" class="tm-social-link">
            <i class="fab fa-twitter tm-social-icon"></i>
        </a>
        <a href="" class="tm-social-link">
            <i class="fab fa-instagram tm-social-icon"></i>
        </a>
        <a href="" class="tm-social-link">
            <i class="fab fa-linkedin tm-social-icon"></i>
        </a>
    </div>
    <p class="tm-mb-80 pr-5 text-white">
        Tech Blog is a Blogging website where you can uploads and see different type of technical blogs. 
    </p>
</div>
</header>

