<%-- 
    Document   : Logout
    Created on : 2019-11-29, 17:31:21
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.setAttribute("user", null);
            out.println("<script> window.location.href=\"HomePage.jsp\"; </script>");
        %>
    </body>
</html>
