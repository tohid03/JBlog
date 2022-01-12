<%-- 
    Document   : MyPost
    Created on : Dec 13, 2021, 7:29:25 PM
    Author     : SuDo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Pots</title>
        <link rel="stylesheet" href="assets/fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">



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
                <%                     Message m = (Message) session.getAttribute("msg");
                    if (m != null) {
                %>
                <div class="alert <%=m.getCssClass()%>  fade show" role="alert">
                    <%=m.getContent()%>.

                </div>
                <% session.removeAttribute("msg");
                    }
                %>

                <!--Post Area-->
                <div class="row tm-row" id="post-cont">
                    <!--End Post-->




                </div><!-- comment -->
            </main>
        </div>
        <script src="assets/jquery.min1.js"></script>
        <script src="assets/js/propper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/templatemo-script.js"></script>
        <script src="assets/script.js"></script>
        <script>
            $(document).ready(function (e) {
                getPostByUserId(<%=user.getId()%>);

            })
        </script>


    </body>

</html>