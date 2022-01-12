<%@page import="com.blog.entities.Message"%>
<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
            <%@include file="navbar_basic.jsp" %>
        </header>
        <div class="container-fluid">
            <main class="tm-main">
                <div>
                     <%
                                    Message m = (Message) session.getAttribute("msg");
                                    if (m != null) {
                                %>
                                <div class="alert <%=m.getCssClass()%>  fade show" role="alert">
                                    <%=m.getContent()%>.
                                    
                                </div>
                                <%
                                        session.removeAttribute("msg");
                                    }
                                %>
                    <div class="col-12">
                        <h2 class="tm-color-primary tm-post-title tm-mb-60" style="margin-left: 200px;">Login</h2>
                    </div>
                    <div class="col-lg-7 ">
                        <form method="POST" action="Login" class="login_form mb-5 ml-auto mr-0 tm-form">                        
                            <div class="form-group row mb-4">
                                <label for="name" class="col-sm-3 col-form-label text-right tm-color-primary">Email</label>
                                <div class="col-sm-9">
                                    <input class="form-control mr-0 ml-auto" name="email" id="email" type="email" required>                            
                                </div>
                            </div>
                            <div class="form-group row mb-4">
                                <label for="email" class="col-sm-3 col-form-label text-right tm-color-primary">password</label>
                                <div class="col-sm-9">
                                    <input class="form-control mr-0 ml-auto" name="password"  type="password" required>
                                </div>
                            </div>


                            <div class="form-group row text-center">
                                <div class="col-12">
                                    <button class="tm-btn tm-btn-primary tm-btn-small">Login</button>  

                                </div>                            
                            </div>                                
                        </form>
                    </div>   
                </div>
            </main>
        </div>


       

        <script src="assets/jquery.min1.js"></script>
        <script src="assets/js/propper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/templatemo-script.js"></script>

    </body>

</html>
</body>