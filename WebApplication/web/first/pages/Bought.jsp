<%-- 
    Document   : Bought
    Created on : 2019-11-21, 15:53:56
    Author     : 40710
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
    </head>
    <body class="Bbody">
        <div class="menu">
            <ul class="menubar">
                <li><a href="Login.jsp">login</a></li>
                <li><a href="Register.jsp">register</a></li>
                    <%
                        User u = (User) session.getAttribute("user");
//                        out.println(session.getAttribute("user"));
//                        u = UserImpl.findIdUser("beiyu");
//                        out.println(u.toString());
                        //genLog log = new genLog();
//                        genIp ip = new genIp();
                        Cookie[] coo = request.getCookies();
                        //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "11", coo[0].getName(), coo[1].getName(), "", "");
                        if (session.getAttribute("user") == null) {
                            out.println("<script>alert(\" Please Login First!\")</script>");
                            out.println("<script> window.location.href=\"Login.jsp\"; </script>");
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
            <div class="good"> Goods </div>
            <div class="single"> Single </div>
            <div class="number"> Number </div>
            <div class="operation"> Operation </div>
            <div class="price"> Price </div>
            <div class="status"> Status </div>
            <div class="deal"> deal </div>
            <!--</div>-->
            <!--            <div class="all">
                            <input type="checkbox" name="all" id="all">
                            <p> All </p>
                        </div>-->
            <%
                List<Trade> bou = TradeImpl.findTradeUser(u.getUser_no());
                for (int i = 0; i < bou.size(); i++) {
                    Item item = ItemImpl.findNoItem(bou.get(i).getItem_no());
                    String store = StoreImpl.findByNo(item.getStore_no());
            %>
            <div class="order" id="order<%=i%>">
                <div class="top" id="top<%=i%>">
                    <!--                    <input type="checkbox" id="single">
                                        <p id="p</%=i%>"> xxxx-xx-xx </p>-->
                    <div class="num"> OrderID: </div><div class="number" id="number<%=i%>"> <%=bou.get(i).getTrade_no()%> </div>
                    <% // out.println(""); %>
                    <% out.println("<div class=\"shop\" id=\"shop<"+i+"\"> "+store+" </div>"); %>
                </div>
                <div class="good" id="good<%=i%>">
                    <img src="<%=item.getItem_pic()%>">
                    <div class="name" id="name<%=i%>">
                        <% out.println("<a href=\"#\"> " + item.getItem_id() + " </a>");%>
                    </div>
                    <div class="sc"> Size&Color: </div>
                    <div class="price"> <%=bou.get(i).getItem_size()%>  <%=bou.get(i).getItem_color()%> </div>
                </div>
                <div class="unitprice" id="unitprice<%=i%>">
                    <div class="price"> <%=item.getItem_price()%> </div>
                </div>
                <div class="amount" id="amount<%=i%>"> 
                    <div class="Amount"> <%=bou.get(i).getItem_amount()%> </div>
                </div>
                <div class="operate" id="operate<%=i%>"> 
                    <div class="Operate">
                        <a>After sale</a>
                        <a>Complain</a>
                    </div>
                </div>
                <div class="actualpay" id="actualpay<%=i%>">
                    <div class="Actualpay"> <%=item.getItem_price()%> </div>
                </div>
                <div class="status" id="status<%=i%>">
                    <div class="Status"> sign for</div>
                </div>
                <div class="tradeOp" id="tradeOp<%=i%>">
                    <button class="TradeOp">Evaluate</tton>
                </div>
            </div>
            <div class="blank"></div>
            <% }%>
        </div>
    </body>
</html>
