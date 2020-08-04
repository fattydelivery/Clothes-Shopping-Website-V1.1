<%-- 
    Document   : ClothingCheck
    Created on : 2019-11-29, 9:51:53
    Author     : Administrator
--%>

<%@page import="entity.User"%>
<%@page import="java.util.Date"%>
<%@page import="impl.CartImpl"%>
<%@page import="entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String size = request.getParameter("item_size");
            String color = request.getParameter("item_color");
            String item_no = request.getParameter("item_no");
            String item_amount = request.getParameter("item_amount");
            User u = (User) session.getAttribute("user");
            // Cart cc = new Cart(null, item_amount, item_no, u.getUser_no(), size, color);
            // System.out.println(cc.toString());
            CartImpl.add(new Cart(null, item_amount, item_no, u.getUser_no(), size, color));
            out.println("<script>alert(\"Add successfully.\")</script>");
            out.println("<script> window.history.back(-1); </script>");
        %>
    </body>
</html>
