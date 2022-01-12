<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.entities.Comments"%>
<%@page import="com.blog.dao.Comments_dao"%>
<%@page import="com.blog.dao.User_dao"%>
<%@page import="com.blog.entities.Message"%>
<%@page import="com.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.Post_dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">

        <% User_dao ud = new User_dao(ConnectionProvider.getConnection());%>
        <%
            Post_dao pDao = new Post_dao(ConnectionProvider.getConnection());
            List<Post> post = null;
            int pid = Integer.parseInt(request.getParameter("pId"));
            post = pDao.getPostById(pid);
            for (Post p : post) {
        %>
        <title><%=p.getpTitle()%></title>
    </head>
    <body>
        <header>
            <%@include file="user_navbar.jsp" %>
        </header>

        <div class="container-fluid">
            <main class="tm-main">
                <!-- Search form -->
                <div class="row tm-row">
                    <div class="col-12">
                        <form method="GET" class="form-inline tm-mb-80 tm-search-form">                
                            <input class="form-control tm-search-input" name="query" type="text" placeholder="Search..." aria-label="Search">
                            <button class="tm-search-button" type="submit">
                                <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                            </button>                                
                        </form>
                    </div>                
                </div>      
                <div class="row tm-row">
                    <div class="col-12">
                        <hr class="tm-hr-primary tm-mb-55">
                        <img src="assets/img/img-01.jpg" class="tm-mb-40" alt="Post Image..."/>
                    </div>
                </div>
                <div class="text-center">
                    <div class="col-lg-8 tm-post-col">
                        <div class="tm-post-full">                    
                            <div class="mb-4">
                                <h2 class="pt-2 tm-color-primary tm-post-title"><%=p.getpTitle()%></h2>
                                <p class="tm-mb-40"><%=ud.getUserById(p.getUserId()).getName()%> Posted On:- &nbsp;<%=p.getpCreatedOn().toLocaleString()%> </p>
                                <p>
                                    <%=p.getpContent()%>
                                </p>

                                <%
                                    Category cat =  pDao.getCategoryByCatId(p.getCatId());
                                    
                                %>
                                <span class="d-block text-right">
                                    
                                    <p class="text-danger">Category: <%=cat.getcName()%></p>
                                </span>
                            </div>
                            <!-- Comments -->
                            <div>
                                <h2 class="tm-color-primary tm-post-title">Comments</h2>
                                <hr class="tm-hr-primary tm-mb-45">

                                <%
                                    Comments_dao comment = new Comments_dao(ConnectionProvider.getConnection());
                                    List<Comments> comnt = comment.getComments(pid);
                                    for (Comments c : comnt) {
                                %>
                                <div class="tm-comment tm-mb-45">
                                    <figure class="tm-comment-figure">
                                        <img src="image/<%=ud.getUserById(c.getUserId()).getImage()%>" style="height: 120px;width: 120px;" alt="Image" class="mb-2 rounded-circle img-thumbnail">
                                        <figcaption class="tm-color-primary text-center"><%=ud.getUserById(c.getUserId()).getName()%></figcaption>
                                    </figure>
                                    <div>
                                        <p>
                                            <%=c.getComment()%>
                                        </p>
                                        <div class="d-flex justify-content-between">

                                            <span ><p class=" tm-color-gray">On: <%=c.getCommentOn().toLocaleString()%></p></span>
                                        </div>                                                 
                                    </div> 
                                </div>
                                <hr>    
                                <% }%>     
                            </div>
                            <!--Add Comment Section-->
                            <%  if (user == null) {%>
                            <h6 class="bg-warning">Please login for post Comment.</h6>
                            <%} else {%>

                            <h2 class="tm-color-primary tm-post-title mb-4">Your comment</h2>
                            <span id="msg" style="color:red;"></span>
                            <div class="mb-4">
                                <textarea class="form-control" id="comment" name="message" placeholder="write comment here.." required rows="6" cols="3"></textarea>
                            </div>
                            <div class="text-right">
                                <button class="tm-btn tm-btn-primary tm-btn-small cmt-btn" onclick="addComment('<%=p.getpId()%>', '<%=user.getId()%>', document.getElementById('comment').value)">Submit</button>

                            </div>                                

                            <%}%>
                        </div>
                    </div>
                </div>

            </main>
        </div>
        <%}%>

        <script src="assets/jquery.min1.js"></script>
        <script src="assets/js/propper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/templatemo-script.js"></script>
        <script>

                                    function addComment(postId, userId, comment) {

                                        if (document.getElementById("comment").value == "") {
                                            document.getElementById("msg").innerHTML = "comment field required."
                                        } else {
                                            $.ajax({
                                                url: "addComment",
                                                data: {postId: postId, userId: userId, comment: comment},
                                                method: "POST",
                                                success: function () {
                                                    location.reload()
                                                }
                                            })
                                        }
                                    }


        </script>    

    </body>

</html>
