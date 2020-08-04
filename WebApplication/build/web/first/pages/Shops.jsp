<%-- 
    Document   : Shops
    Created on : 2019-11-21, 15:27:36
    Author     : 40710
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="log.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
    </head>
    <body class="Sbody">
        <div class="menu">
            <ul class="menubar">
                <li><a href="Login.jsp">login</a></li>
                <li><a href="Register.jsp">register</a></li>
                    <%
                        User u = (User) session.getAttribute("user");
                        genIp ip = new genIp();
                        Cookie[] coo = request.getCookies();
                        //genLog.Log(u.getUser_id(), ip.getIpAddr(request), "18", coo[0].getName(), coo[1].getName(), "", "");
    //                        out.println(session.getAttribute("user"));
    //                        u = UserImpl.findIdUser("beiyu");
    //                        out.println(u.toString());
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
            int n = 2;
            for (int i = 0; i < n; i++) {%>
        <div class="shop" id="scart<%=i%>" style="background: rgb(248, 238, 226)">
            <div class="cart" style="background: rgb(250,226,185)">
                <div class="imgGet1" id="imgGet1<%=i%>">
                    <a href="#"><img src="../image/shop.jpg"></a>
                </div>
                <div class="imgGet2" id="imgGet2<%=i%>">
                    <a href="#"><img src="../image/clothes.jpg"></a>
                </div>

                <div class="buy">
                    <button id="dr<%=i%>" style="text-align: center">Delete record</button>
                </div>
            </div>
        </div>
        <div class="blank" id="sblank<%=i%>"></div>
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
        <!--<script language ="javascript" src="../jsFile/index.js">-->
<!--//                document.getElementById("dr<%=i%>").onclick = deleteRecord;
//
//            function deleteRecord() {
//                window.location.href = "#";
//                document.getElementById("scart<%=i%>").parentNode.removeChild(document.getElementById("scart<%=i%>"));
//                document.getElementById("sblank<%=i%>").parentNode.removeChild(document.getElementById("sblank<%=i%>"));
//            }-->
        <!--</script>-->
        <%}%>
        <div class="bblank"></div>
    </body>
</html>
