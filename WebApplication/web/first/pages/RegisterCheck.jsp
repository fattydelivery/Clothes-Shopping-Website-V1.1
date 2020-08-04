<%-- 
    Document   : RegisterCheck
    Created on : 2019-11-26, 23:30:04
    Author     : Administrator
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="impl.UserImpl"%>
<%@page import="entity.User"%>
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
            String userno = null;
            String userid = request.getParameter("userid");
            String pass = request.getParameter("pass");
            String phone = request.getParameter("phone");
            String addr = request.getParameter("addr");
//            genIp ip = new genIp();
            if ("".equals(userid) || "".equals(pass)) {
                out.println("<script>alert(\" UserName or Password is empty.\")</script>");
                out.println("<script>window.history.back(-1);</script>");
            } else {
                User u = new User(userno, userid, pass, phone, addr);
                UserImpl.add(u);
                //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "03", "", "", "", "");
                session.setAttribute("user", u);
                out.println("<script>window.location.href=\"Login.jsp\";</script>");
            }
        %>
    </body>
</html>
