

<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.Post_dao"%>
<%@page import="com.blog.entities.Message"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="error.jsp" %>



<%     Post_dao pDao = new Post_dao(ConnectionProvider.getConnection());
    ArrayList<Category> list = pDao.getAllCategories();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Xtra Blog</title>
        <link rel="stylesheet" href="assets/fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        

    </head>
    <body>
         <header>
            <%@include file="user_navbar.jsp" %>
        </header>
        
        
       
        
        
     
        
        
        <script src="assets/jquery.min1.js"></script>
        <script src="assets/js/propper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/templatemo-script.js"></script>

        <script>
            $(document).ready(function () {
                let flag = false;
                // show hide profile details..
                $("#edit-profile-btn").click(function () {
                    if (flag === false) {
                        $(".profile-details").hide();
                        $(".Edit-Profile").show();
                        $(this).text("Back");
                        flag = true;
                    } else {
                        $(".profile-details").show();
                        $(".Edit-Profile").hide();
                        $(this).text("Edit");
                        flag = false;
                    }
                })
                //Show hide password
                $("#show-password-btn a").click(function (event) {
                    event.preventDefault()
                    if ($("#show-password-btn input").attr("type") == "password") {
                        $("#show-password-btn input").attr("type", "text");
                    } else {
                        $("#show-password-btn input").attr("type", "password");
                    }
                })


            })
            
            
            
        </script>
        
    </body>
</html>
