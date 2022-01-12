<%-- 
    Document   : logout.jsp
    Created on : Oct 23, 2021, 2:49:12 PM
    Author     : SuDo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.getSession(false);
    session.removeAttribute("CurrentUser");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>