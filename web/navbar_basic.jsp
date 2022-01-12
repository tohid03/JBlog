<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.dao.Post_dao"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%     Post_dao pDao = new Post_dao(ConnectionProvider.getConnection());
    ArrayList<Category> list = pDao.getAllCategories();
%>
	<header class="tm-header" id="tm-header">
        <div class="tm-header-wrapper">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2T"></i></div>            
                <h1 class="text-center">Tech Blog</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">            
                <ul>
                    <li class="tm-nav-item"><a href="index.jsp" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a></li>
                    <li class="tm-nav-item"><a href="login.jsp" class="tm-nav-link">
                        <i class="fas fa-pen"></i>
                        Login
                    </a></li>
                    <li class="tm-nav-item"><a href="register.jsp" class="tm-nav-link">
                        <i class="fas fa-sign-in-alt"></i>
                      register
                    </a></li>
                    <li class="tm-nav-item"><a href="about.html" class="tm-nav-link">
                        <i class="far fa-comments"></i>
                        About Us
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
                Xtra Blog is a Blogging website where you can uploads and see different type blogs. 
            </p>
        </div>
    </header>
