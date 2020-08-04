<%-- 
    Document   : Clothing
    Created on : 2019-11-21, 14:55:49
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
        <script src="../jsFile/Clothing.js"></script>
    </head>
    <body class="Cbody">
        <%
            String item_id = request.getParameter("itemid");
            Item item = ItemImpl.findNoItem(item_id);
            String store = StoreImpl.findByNo(item.getStore_no());
            User u = (User) session.getAttribute("user");
//            genIp ip = new genIp();
            Cookie[] c = request.getCookies();
            genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "0", item.getItem_audienceno(), item.getItem_typeno(), item_id, store);
        %>
        <div class="Ccartport" id="cart">
            <div class="cart">
                <div class="message">
                    <div class="clothes"><%= item_id%></div>
                    <div class="pricetag">Price</div>
                    <div class="price"><%= item.getItem_price()%></div>
                    <div class="sizetag">Size</div>
                    <div class="sizebutton1">
                        <button style="text-align: center" id="size1" value="S">S</button>
                    </div>
                    <div class="sizebutton2">
                        <button style="text-align: center" id="size2" value="XL">XL</button>
                    </div>
                    <div class="sizebutton3">
                        <button style="text-align: center" id="size3" value="L">L</button>
                    </div>
                    <div class="sizebutton4">
                        <button style="text-align: center" id="size4" value="M">M</button>
                    </div>
                    <div class="sizebutton5">
                        <button style="text-align: center" id="size5" value="XXL">XXL</button>
                    </div>
                    <div class="colortag">Color</div>
                    <div class="color1"><button style="text-align: center" id="c1" value="black">black</button></div>
                    <div class="color2"><button style="text-align: center" id="c2" value="white">white</button></div>
                    <div class="color3"><button style="text-align: center" id="c3" value="yellow">yellow</button></div>
                    <div class="color4"><button style="text-align: center" id="c4" value="blue">blue</button></div>
                </div>
<!--                <div class="buy">
                    <button id="b" style="text-align: center" onclick="buynow()">Buy now</button>
                </div>-->
                <div class="add">
                    <button id="b" style="text-align: center" id="addtocart" onclick="addtocart()">Add to cart</button>
                </div>
                <div class="numbertag">number</div>
                <div class="number">
                    <div class="nl"> 
                        <button id="m">-</button>
                    </div>
                    <div class="num">
                        <p id="num">1</p>
                    </div>
                    <div class="nr"> 
                        <button id="p">+</button>
                    </div>
                </div>
            </div>
        </div>
        <script language="javascript">
            document.getElementById("m").onclick = minusGet;
            document.getElementById("p").onclick = plusGet;
            var num = 1;
            function minusGet() {
                var value = document.getElementById("num").innerHTML;
                if (value.toString() !== "1") {
                    value--;
                    document.getElementById("num").innerHTML = value;
                }
                num = value;
                //                else if (value.toString() === "1") {
                //                    document.getElementById("cart").parentNode.removeChild(document.getElementById("cart"));
                //                    document.getElementById("blank").parentNode.removeChild(document.getElementById("blank"));
                //                    }
            }
            function plusGet() {
                var nums = document.getElementById("num").innerHTML;
                nums++;
                document.getElementById("num").innerHTML = nums;
                num = nums;
            }

            var size = "S";
            document.getElementById("size1").onclick = size1;
            document.getElementById("size2").onclick = size2;
            document.getElementById("size3").onclick = size3;
            document.getElementById("size4").onclick = size4;
            document.getElementById("size5").onclick = size5;
            function size1() {
                size = document.getElementById("size1").value;
            }
            function size2() {
                size = document.getElementById("size2").value;
            }
            function size3() {
                size = document.getElementById("size3").value;
            }
            function size4() {
                size = document.getElementById("size4").value;
            }
            function size5() {
                size = document.getElementById("size5").value;
            }

            var color = "black";
            document.getElementById("c1").onclick = c1;
            document.getElementById("c2").onclick = c2;
            document.getElementById("c3").onclick = c3;
            document.getElementById("c4").onclick = c4;
            document.getElementById("c5").onclick = c5;
            function c1() {
                color = document.getElementById("c1").value;
            }
            function c2() {
                color = document.getElementById("c2").value;
            }
            function c3() {
                color = document.getElementById("c3").value;
            }
            function c4() {
                color = document.getElementById("c4").value;
            }

            //                document.getElementById("addtocart").onclick = addtocart;
            function addtocart() {
            <%
                //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "06", "1", "2", item_id, store);
%>
                window.location.href = "ClothingCheck.jsp?item_no=<%= item.getItem_no()%>&item_size=" + size + "&item_color=" + color + "&item_amount=" + num;
            }
            function buynow() {
                var price = <%= item.getItem_price()%>
                var total = price * num;
            <%
                //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "07", "1", "2", item_id, store);
%>
                window.location.href = "PayPage.jsp?item_id=<%=item_id%>&total=" + total;
            }
        </script>
        <img id=cobj src =<%= item.getItem_pic()%> width=400 height=400 border =0 >
    </body>
</html>
