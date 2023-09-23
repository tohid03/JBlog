<%-- 
    Document   : getPost
    Created on : Sep 28, 2021, 4:11:57 PM
    Author     : SuDo
--%>
<%@page import="com.Jblog.entities.User"%>
<%@page import="com.Jblog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.Jblog.entities.Post"%>
<%@page import="com.Jblog.helper.ConnectionProvider"%>
<%@page import="com.Jblog.dao.Post_dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    User user = (User) session.getAttribute("CurrentUser");
    Post_dao dao = new Post_dao(ConnectionProvider.getConnection());
    List<Post> plist = null;
    String cId = request.getParameter("cid");
    String uId = request.getParameter("userId");
    String q = request.getParameter("q");
    if (cId == null && uId == null && q == null) {
        plist = dao.getAllPost();
    } else if (cId != null) {
        plist = dao.getPostByCategory(Integer.parseInt(cId));
    } else if (uId != null) {
        plist = dao.getPostByUser(Integer.parseInt(uId));
    } else if (q != null) {
        plist = dao.searchPost(q);
    }

    for (Post p : plist) {
%>
<article class="col-12 col-md-6 tm-post">
    <hr class="tm-hr-primary">
    <a href="post.jsp?pId=<%=p.getpId()%>" class="effect-lily tm-post-link tm-pt-60">

        <div class="tm-post-link-inner">
            <img src="image/post/<%=p.getpImage()%>" alt="Image" class="img-fluid">                            
        </div>
        <% java.util.Date today = new java.util.Date();
            java.util.Date postDate = new java.util.Date(p.getpCreatedOn().getTime());
            //java.sql.Date sqlPostDate = new java.sql.Date(postDate.getTime());
            long diff = today.getTime() - postDate.getTime();
            long diffHours = diff / (60 * 60 * 1000);
            if (diffHours < 24) {%>
        <span class="position-absolute tm-new-badge">New</span>
        <%}%>

        <h2 class="tm-color-primary tm-post-title"><%=p.getpTitle()%></h2>
    </a> 
    <p>
        <% String content = p.getpContent().replaceAll("\\<.*?>", "");
                if (content.length() > 60) {%>
        <%= content.substring(0, 60)%>
        <% } else {%>
        <%= content%>
        <% }%>
        Read more....
    </p>

    <div class="d-flex justify-content-between">
        <span class="tm-color-primary h6"><%=p.getpCreatedOn().toLocaleString()%></span>
    </div>
    <hr>
</article>


<%}%> 

