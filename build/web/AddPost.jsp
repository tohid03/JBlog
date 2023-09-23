<%-- 
    Document   : AddPost
    Created on : Dec 14, 2021, 6:52:46 PM
    Author     : SuDo
--%>

<%@page import="java.util.List"%>
<%@page import="com.Jblog.helper.ConnectionProvider"%>
<%@page import="com.Jblog.dao.Post_dao"%>
<%@page import="com.Jblog.entities.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Post</title>
       <%@include file="WEB-INF/Style.jsp" %>
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector: 'textarea',
        height: 500
        });</script>

    </head>
    <body>
        <header>
            <%@include file="user_navbar.jsp" %>
        </header>
        <div class="container-fluid">
            <main class="tm-main">
                <div class="row tm-row tm-mb-45">
                    <div class="col-12">
                        <form action="doPost" method="post" enctype="multipart/form-data" class="mb-5 ml-auto mr-0 tm-contact-form">                        
                            <div class="form-group row mb-4">
                                <label for="title" class="col-form-label text-right tm-color-primary">Title</label>
                                <div class="col-xl-8">
                                    <input class="form-control mr-0 ml-auto" name="title" id="title" type="text" placeholder="Post Title" required>                            
                                </div>
                            </div>
                             <div class="form-group row mb-3">
                               
                                <div class="col-sm-3">
                                    <select class="form-control" name="category" required>
                                        <option selected-disabled>Select Category</option>
                                        <% 
                                            Post_dao p = new Post_dao(ConnectionProvider.getConnection());
                                            List<Category> category = null;
                                            category = p.getAllCategories();
                                            for (Category c : category) {%>
                                        <option value="<%=c.getcId()%>"><%=c.getcName()%></option>
                                        <%}%>
                                    </select>                         
                                </div>
                                 <label for="image" class="col-form-label text-right tm-color-primary">Post Image: </label>
                                <div class="col-sm-3">
                                    <input class="form-control mr-0 ml-auto" name="image" id="name" type="file" required>                            
                                </div>
                                 <div class="col-sm-3">
                                    <input type="submit" class="btn-info btn btn-dark" value="Upload" id="post-btn">                            
                                </div>
                                 
                            </div>
                        <hr class="tm-hr-primary ">
                        <div class="form-group row mb-4">
                            <div class="col-xl-9">
                                <textarea id="content" class="form-control mr-0 ml-auto" name="content" rows="30" placeholder="Write Post Content Here......" required></textarea>
                            </div>
                        </div>
                        </form>
                        

                    </div>
                </div>
            </main>
        </div>

        <%@include file="WEB-INF/Scripts.jsp" %>
    </body>
</html>
