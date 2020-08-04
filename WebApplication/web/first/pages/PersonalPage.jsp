<%-- 
    Document   : PersonalPage
    Created on : 2019-11-21, 14:43:00
    Author     : 40710
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
    </head>
    <body class="PPbody">
        <% 
            User u = (User)session.getAttribute("user");
            if(u==null) {
                
            }
        %>
        <div class="column">
            <dl class="classify">
                <dt>All functions</dt>
                <dd>
                    <a href="Bought.jsp">all orders</a>
                </dd>
                <dd>
                    <a href="Payment.jsp">waiting for payment</a>
                </dd>
                <dd>
                    <a href="Delivery.jsp">waiting for delivery</a>
                </dd>
                <dd>
                    <a href="Receiving.jsp">waiting for receiving</a>
                </dd>
                <dd>
                    <a href="#">waiting for evaluation</a>
                </dd>
                <dd>
                    <a href="Shops.jsp">the shops have been purchased</a>
                </dd>
                <dd>
                    <a href="#">evaluation management</a>
                </dd>
                <dd>
                    <a href="Refund.jsp">refund management</a>
                </dd>
                <dd>
                    <a href="Complaint.jsp">complaint management</a>
                </dd>
                <dd>
                    <a href="report.jsp">report management</a>
                </dd>
                <dd>
                    <a href="#">my footprint</a>
                </dd>
            </dl>
        </div>
        <img src ="../image/a.jpg">
    </body>
</html>
