<%-- 
    Document   : ShopCart
    Created on : 2019-11-21, 13:41:05
    Author     : 40710
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="java.util.List"%>
<%@page import="entity.*"%>
<%@page import="impl.*"%>
<%@page import="log.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
    </head>
    <body class="Shopbody">
        <div class="menu">
            <ul class="menubar">
                <li><a href="Login.jsp">login</a></li>
                <li><a href="Register.jsp">register</a></li>
                    <%
                        User u = (User) session.getAttribute("user");
//                        genIp ip = new genIp();
                        Cookie[] coo = request.getCookies();
                        //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "10", coo[0].getName(), coo[1].getName(), "", "");
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
        <%
            List<Cart> c = CartImpl.findCartUser(u.getUser_no());
            for (int i = 0; i < c.size(); i++) {
                Item item = ItemImpl.findNoItem(c.get(i).getItem_no());
        %>
        <div class="cartport" id="cart<%=i%>" style="background: rgb(248, 238, 226) ">
            <div class="cart" style="background: rgb(250,226,185)">
                <div class="imgGet">
                    <% out.println("<a href=\"#\"><img src=" + item.getItem_pic() + "></a>"); %>
                </div>
                <div class="message">
                    <div class="header">
                        <div class="pic"><img src="../picture/5.png" style="width: 15px; height: 15px;"></div>
                        <div class="store"> Store </div>
                        <% out.println("<div class=\"store_name\"> " + item.getStore_no() + " </div>"); %>
                    </div>
                    <div class="middle">
                        <% out.println("<p><a href=\"#\" style=\"color: black;\"> " + item.getItem_id() + " </a></p>");%>
                    </div>
                </div>
                <div class="buy">
                    <button id="b<%=i%>" style="text-align: center">Buy now</button>
                </div>
                <div class="number">
                    <div class="nl"> 
                        <button id="m<%=i%>">-</button>
                    </div>
                    <div class="num">
                        <p id="num<%=i%>"><%=c.get(i).getItem_amount()%></p>
                    </div>
                    <div class="nr"> 
                        <button id="p<%=i%>">+</button>
                    </div>
                </div>
                <div class="price">
                    <p> price: </p>
                </div>
                <div class="size">
                    <div class="tag"> <p style="color: gray">Size</p> </div>
                    <p> black </p>
                </div>
                <div class="color">
                    <div class="tag"> <p style="color: gray">Color</p> </div>
                    <p> Color </p>
                </div> 


            </div>
        </div>

        <div class="blank" id="blank<%=i%>"></div>

        <script language="javascript">
            document.getElementById("m<%=i%>").onclick = minusGet;
            document.getElementById("b<%=i%>").onclick = buyGet;
            document.getElementById("p<%=i%>").onclick = plusGet;
            var num =<%=c.get(i).getItem_amount()%>;
            function minusGet() {
                var value = document.getElementById("num<%=i%>").innerHTML;
                if (value.toString() !== "1") {
                    value--;
                    document.getElementById("num<%=i%>").innerHTML = value;
                    num = value;
                } else if (value.toString() === "1") {
                    document.getElementById("cart<%=i%>").parentNode.removeChild(document.getElementById("cart<%=i%>"));
                    document.getElementById("blank<%=i%>").parentNode.removeChild(document.getElementById("blank<%=i%>"));
                }
            }
            function plusGet() {
                var nums = document.getElementById("num<%=i%>").innerHTML;
                nums++;
                document.getElementById("num<%=i%>").innerHTML = nums;
                num = nums;
            }
            function buyGet() {
//                window.location.href = "#";
            <%
                String store = StoreImpl.findByNo(item.getStore_no());
                //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "07", coo[0].getName(), coo[1].getName(), item.getItem_id(), store);
            %>
                document.getElementById("cart<%=i%>").parentNode.removeChild(document.getElementById("cart<%=i%>"));
                document.getElementById("blank<%=i%>").parentNode.removeChild(document.getElementById("blank<%=i%>"));
                var price = <%= item.getItem_price()%>
                var total = price * num;
                window.location.href = "PayPage.jsp?item_id=<%=item.getItem_no()%>&total=" + total;
            }

        </script>
        <%}%>
        <div class="bblank"></div>
    </body>
</html>
