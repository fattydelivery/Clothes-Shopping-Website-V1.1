<%-- 
    Document   : Complaint
    Created on : 2019-11-29, 14:52:51
    Author     : 滕
--%>

<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@page import="impl.*" %>
<%@page import="log.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
        <style>

        </style>
    </head>
    <body class="Bbody">
        <div class="menu">
            <ul class="menubar">
                <li><a href="Login.jsp">login</a></li>
                <li><a href="Register.jsp">register</a></li>
                    <%
                        User u = (User) session.getAttribute("user");
//                        genIp ip = new genIp();
                        Cookie[] coo = request.getCookies();
                        //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "12", coo[0].getName(), coo[1].getName(), "", "");
                        if (u == null) {
                            out.println("<script>alert(\" Please Login First!\")</script>");
                            out.println("<script> window.location.href=\"Login.jsp\"; </script>");
                        }
                        out.println("<li><a href=\"Bought.jsp\">" + u.getUser_id() + " </a></li>");
                        out.println("<li><a href=\"ShopCart.jsp\">shopping cart</a></li>");
                    %> 
            </ul>
        </div>

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
                    <a href="Report.jsp">report management</a>
                </dd>
                <dd>
                    <a href="#">my footprint</a>
                </dd>            
            </dl>
        </div>
        <div class="rightCol">
            <div class="search">
                <input type="text" name="searchbox" value="please" onblur="if (value === '') {
                            value = please;
                        }" onfocus="if (value === 'please') {
                                    value = '';
                                }">
                <a href="#"><button> Search </button></a>
            </div>
            <!--<div class="label">-->
            <div class="good">Complaint number</div>
            <div class="single">Order number</div>
            <div class="number">Store</div>
            <div class="operation">Reasons</div>
            <div class="price">Status</div>
            <div class="status">Time</div>
            <div class="deal"> Operation </div>
            <!--</div>-->

            <%
                List<Trade> bou = TradeImpl.findTradeUser(u.getUser_no());
                for (int i = 0; i < bou.size(); i++) {
                    Item item = ItemImpl.findNoItem(bou.get(i).getItem_no());
            %>
            <div class="order" id="order<%=i%>">
                <div class="top" id="top<%=i%>">
                    <div class="num">  </div><div class="number" id="number<%=i%>">  </div>

                </div>
                <div class="good" id="good<%=i%>">
                    <img src="#">
                    <div class="name" id="name<%=i%>">

                    </div>
                    <div class="sc">  </div>
                    <div class="price">

                    </div>
                </div>
                <div class="unitprice" id="unitprice<%=i%>">
                    <div class="price">  </div>
                </div>
                <div class="amount" id="amount<%=i%>"> 
                    <div class="Amount"> </div>
                </div>
                <div class="operate" id="operate<%=i%>"> 
                    <div class="Operate">

                    </div>
                </div>
                <div class="actualpay" id="actualpay<%=i%>">
                    <div class="Actualpay">  </div>
                </div>
                <div class="status" id="status<%=i%>">
                    <div class="Status"> </div>
                </div>
                <div class="tradeOp" id="tradeOp<%=i%>">
                    <button class="TradeOp">  </tton>
                </div>
            </div>
            <div class="blank"></div>
            <% }%>
        </div>
    </body>
</html>


