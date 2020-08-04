<%-- 
    Document   : PayPage
    Created on : 2019-11-29, 17:47:35
    Author     : Administrator
--%>

<%@page import="entity.Item"%>
<%@page import="impl.ItemImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
    </head>
    <body class="Paybody">
        <%
            String item_id = request.getParameter("item_id");
            String item_price = request.getParameter("total");
            session.setAttribute("item_id", item_id);
        %>
        <form action="PayCheck.jsp">
            <div class="payt"> The total cost is: <%=item_price%> <br>
                Please enter the password: </div>
            <input type="password" name="pass" class="paytext">
            <input type="submit" name="pay" value="Pay" class="paybutton">
        </form>
    </body>
</html>
