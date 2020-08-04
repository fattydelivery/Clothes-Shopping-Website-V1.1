<%-- 
    Document   : SortPage
    Created on : 2019-11-21, 19:10:37
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
    <body class="SPbody">
        <%
            User u = (User) session.getAttribute("user");
            String first = request.getParameter("firstno");
            String second = request.getParameter("secondno");
            FirstClothesClass fcc = FirstClothesClassImpl.findByNo(first);
            SecondClothesClass scc = SecondClothesClassImpl.findByNo(second);
            Cookie c1 = new Cookie("first", first);
            Cookie c2 = new Cookie("second", second);
//            genIp ip = new genIp();
            response.addCookie(c1);
            response.addCookie(c2);
            //out.println(fcc.toString());
            //out.println(scc.toString());
            //out.println(InetAddress.getLocalHost().getHostAddress());
            //.println(fcc.getFirst_id());
            //out.println(scc.getSecond_secondid());
            //genLog.Log("7888888", "192.168.0.1", "2333", "3", "2", "334", "666");
            //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "0", fcc.getFirst_id(), scc.getSecond_secondid(), "", "");
        %>
        <div class="top">
            <div class="menu">
                <ul class="menubar">
                    <li><a href="Login.jsp">login</a></li>
                    <li><a href="Register.jsp">register</a></li>
                        <%
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
        </div>
        <div class="Outsearch">
            <div class="box">
                <input type="text" name="search" placeholder="Please input the keyword">
                <div class="Insearch">search</div>
            </div>
        </div>
        <div class="result">
            <%
                List<Item> ii = ItemImpl.findSecondItem(second);
                for (int i = 0; i < ii.size(); i++) {
            %>
            <div class="result1" id="result1<%=i%>">
                <% if (i * 4 + 0 < ii.size()) {%>
                <div class="result20" id="result2<%=i * 4 + 0%>">
                    <div class="imgGet" >
                        <img src=<%=ii.get(i * 4 + 0).getItem_pic()%> id="img<%=i * 4 + 0%>">
                    </div>
                    <div class="shop" id="shop<%=i * 4 + 0%>">
                        <div class="nam"></div> 
                        <div id="goodprice<%=i * 4 + 0%>" class="pri"> <%= ii.get(i * 4 + 0).getItem_price()%> </div>
                    </div>
                    <div class="enter" id="enter<%=i * 4 + 0%>"> 
                        <button class="in" id="in<%=i * 4 + 0%>" onclick="window.location.href = 'Clothing.jsp?itemid=<%=ii.get(i * 4 + 0).getItem_no()%>'"> In </button>
                    </div>
                </div>
                <%  }
                    if (i * 4 + 1 < ii.size()) {
                %>
                <div class="result21" id="result2<%=i * 4 + 1%>">
                    <div class="imgGet">
                        <img src=<%=ii.get(i * 4 + 1).getItem_pic()%> id="img<%=i * 4 + 1%>">
                    </div>
                    <div class="shop" id="shop<%=i * 4 + 1%>">
                        <div id="goodprice<%=i * 4 + 1%>" class="pri"> <%= ii.get(i * 4 + 1).getItem_price()%> </div>
                    </div>
                    <div class="enter" id="enter<%=i * 4 + 1%>">
                        <button class="in" id="in<%=i * 4 + 1%>" onclick="window.location.href = 'Clothing.jsp?itemid=<%=ii.get(i * 4 + 1).getItem_no() %>'"> In </button>
                    </div>
                </div>
                <%  }
                    if (i * 4 + 2 < ii.size()) {
                %>
                <div class="result22" id="result2<%=i * 4 + 2%>">
                    <div class="imgGet">
                        <img src=<%=ii.get(i * 4 + 2).getItem_pic()%> id="img<%=i * 4 + 2%>">
                    </div>
                    <div class="shop" id="shop<%=i * 4 + 2%>">
                        <div id="goodprice<%=i * 4 + 2%>" class="pri"> <%= ii.get(i * 4 + 2).getItem_price()%> </div>
                    </div>
                    <div class="enter" id="enter<%=i * 4 + 2%>">
                        <button class="in" id="in<%=i * 4 + 2%>" onclick="window.location.href = 'Clothing.jsp?itemid=<%=ii.get(i * 4 + 2).getItem_no()%>'">In </button>
                    </div>
                </div>
                <%  }
                    if (i * 4 + 3 < ii.size()) {
                %>
                <div class="result23" id="result2<%=i * 4 + 3%>">
                    <div class="imgGet"> 
                        <img src=<%=ii.get(i * 4 + 3).getItem_pic()%> id="img<%=i * 4 + 3%>">
                    </div>
                    <div class="shop" id="shop<%=i * 4 + 3%>">
                        <div id="goodprice<%=i * 4 + 3%>" class="pri"> <%= ii.get(i * 4 + 3).getItem_price()%> </div>
                    </div>
                    <div class="enter" id="enter<%=i * 4 + 3%>">
                        <button class="in" id="in<%=i * 4 + 3%>" onclick="window.location.href = 'Clothing.jsp?itemid=<%=ii.get(i * 4 + 3).getItem_no()%>'"> In </button>
                    </div>
                </div>
                <%   }
                %>
            </div>
            <div class="blank"></div>
            <% }%>
        </div>
    </body>
</html>
<!--?itemid=//=//ii.get(i*4+0).getItem_no()%-->