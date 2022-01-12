<%-- 
    Document   : getPost
    Created on : Sep 28, 2021, 4:11:57 PM
    Author     : SuDo
--%>
<%@page import="com.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.Post_dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Post_dao dao = new Post_dao(ConnectionProvider.getConnection());
    List<Post> plist = null;
    String cId = request.getParameter("cid");
    String uId = request.getParameter("userId");

    if (cId == null && uId == null) {
        plist = dao.getAllPost();
    } else if (cId != null) {
        plist = dao.getPostByCategory(Integer.parseInt(cId));
    } else if (uId != null) {
        plist = dao.getPostByUser(Integer.parseInt(uId));
    }

    for (Post p : plist) {
%>
<article class="col-12 col-md-6 tm-post">
    <hr class="tm-hr-primary">
    <a href="post.jsp?pId=<%=p.getpId()%>" class="effect-lily tm-post-link tm-pt-60">
        <div class="tm-post-link-inner">
            <img src="image/post/<%=p.getpImage()%>" alt="Image" class="img-fluid">                            
        </div>
        <span class="position-absolute tm-new-badge">New</span>
        <h2 class="tm-pt-30 tm-color-primary tm-post-title"><%=p.getpTitle()%></h2>
    </a> 
    <div style="max-height: 150px;overflow: hidden; text-overflow:ellipsis;">
        <p class="tm-pt-30">
            <%=p.getpContent()%>

    </div>
         Read more....</p>

<div class="d-flex justify-content-between tm-pt-45">
    <span class="tm-color-primary"><%=p.getpCreatedOn().toLocaleString()%></span>
</div>
<hr>
</article>


<%}%> 

