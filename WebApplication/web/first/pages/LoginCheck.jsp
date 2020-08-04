<%-- 
    Document   : LoginCheck
    Created on : 2019-11-27, 0:00:00
    Author     : Administrator
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="entity.User"%>
<%@page import="impl.UserImpl"%>
<%@page import="log.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            User u = UserImpl.findIdUser(user);
//            genIp ip = new genIp();
            if (u != null && u.getUser_passwd().equals(pass)) {
                session.setAttribute("user", u);
                //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "01", "", "", "", "");
                out.println("<script> window.location.href=\"HomePage.jsp\"; </script>");
            } else {
                //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "02", "", "", "", "");
                out.println("<script> "
                        + "alert(\"UserName or Password is incorrect.\");"
                        + "window.history.back(-1);"
                        + " </script>");
            }
        %>
    </body>
</html>
