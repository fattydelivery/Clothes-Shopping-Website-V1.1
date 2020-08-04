<%-- 
    Document   : HomePage
    Created on : 2019-11-21, 13:29:50
    Author     : 40710
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@page import="impl.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
        <!--<script src="../jsFile/index.js"></script>-->
    </head>
    <body class="HPbody">
        <div class="HPback">
            <div class="menu">
                <ul class="menubar">
                    <li><a href="Login.jsp">login</a></li>
                    <li><a href="Register.jsp">register</a></li>
                        <%
                            User u = (User) session.getAttribute("user");
                            if (u != null) {
                                out.println("<li><a href=\"Bought.jsp\">" + u.getUser_id() + " </a></li>");
                            } else {
                                out.println("<li><a href=\"Bought.jsp\">personal details</a></li>");
                            }
                            out.println("<li><a href=\"ShopCart.jsp\">shopping cart</a></li>");
                        %> 
                </ul>
            </div>
            <div class="box">
                <input type="text" name="search" placeholder="Please input the keyword">
                <div class="search">search</div>
            </div>
            <script language =javascript src="../jsFile/index.js"></script>
            <img id="obj" src ="../image/1.jpg" width=400 height=400 border =0 >
            <!--onclick="window.location.href='Clothing.jsp'">-->
            <div style="width:500px;">
                <%
                    List<FirstClothesClass> fcc = FirstClothesClassImpl.findAll();

                    out.println("<dl class=\"classify\">");
                    for (int i = 0; i < fcc.size(); i++) {
                        out.println("<dt>" + fcc.get(i).getFirst_id() + "</dt>");
                        List<SecondClothesClass> scc = SecondClothesClassImpl.findByFN(fcc.get(i).getFirst_no());
                        out.println("<dd>");
                        for (int j = 0; j < scc.size(); j++) {
                            out.println("<a href=\"SortPage.jsp?secondno=" + scc.get(j).getSecond_secondno() + "&firstno=" + scc.get(j).getSecond_firstno() + "\">" + scc.get(j).getSecond_secondid() + "</a>");
                        }
                        out.println("</dd>");
                    }
                    out.println("</dl>");
                %>
                <!--<dl class="classify">-->
                <% // for(int i=0; i<4; i++){ %>
                <!--<dt>Women's clothing collection</dt>-->
                <!--<dd>-->
                <% // for(int j=0; j<6; j++){ %>
                <!--<a href="#">down coat</a>-->
                <% // } %>
                <!--            <a href="#">jacket</a>
                            <a href="#">knitwear</a>
                            <a href="#">hoodie</a>
                            <a href="#">blouse</a>
                        </dd>
                        <dd>
                            <a href="#">T-shirt</a>
                            <a href="#">business suit</a>
                            <a href="#">dress</a>
                            <a href="#">skirt</a>
                            <a href="#">short sleeve</a>
                        </dd>
                        <dd>
                            <a href="#">shorts</a>
                            <a href="#">trousers</a>
                            <a href="#">sportswear</a>
                            <a href="#">pajamas</a>
                        </dd>
                        
                        <dt>Men's clothing collection</dt>
                        <dd>
                            <a href="#">down coat</a>
                            <a href="#">jacket</a>
                            <a href="#">knitwear</a>
                            <a href="#">hoodie</a>
                            <a href="#">casual shirt</a>
                        </dd>
                        <dd>
                            <a href="#">bussiness shirt</a>
                            <a href="#">T-shirt</a>
                            <a href="#">short sleeve</a>
                            <a href="#">business suit</a>
                        </dd>
                        <dd>
                            <a href="#">sportswear</a>
                            <a href="#">shorts</a>
                            <a href="#">trousers</a>
                            <a href="#">pajamas</a>
                        </dd>
                        <dt>childrens's clothing collection(boys)</dt>
                        <dd>
                            <a href="#">down coat</a>
                            <a href="#">fleece</a>
                            <a href="#">knitwear</a>
                            <a href="#">blouse</a>
                            <a href="#">T-shirt</a>
                        </dd>
                        <dd>
                            <a href="#">short sleeve</a>
                            <a href="#">suit</a>
                            <a href="#">pants</a>
                            <a href="#">Animated cartoon</a>
                        </dd>
                        <dt>childrens's clothing collection(girls)</dt>
                        <dd>
                            <a href="#">down coat</a>
                            <a href="#">fleece</a>
                            <a href="#">knitwear</a>
                            <a href="#">blouse</a>
                            <a href="#">T-shirt</a>
                        </dd>
                        <dd>
                            <a href="#">short sleeve</a>
                            <a href="#">dress</a>
                            <a href="#">pants</a>
                            <a href="#">Animated cartoon</a>
                        </dd>-->
                <% // } %>
                </dl>
                <dl class="toggery">
                    <dt>Popular shops:</dt>
                    <dd>
                        <a href=#>1.Uniqlo's official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>2.ZARA official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>3.H&M official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>4.adidas official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>5.Yishion official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>6.NIKE official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>7.BOY LONDON official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>8.MLB official flagship store</a>
                    </dd>
                    <dd>
                        <a href=#>9.PUMA official flagship store</a>
                    </dd>
                </dl>
            </div>
            <div class="links">
                <a href="/shopping/intel_echart.jsp">Anaslysis Result for Intel Log</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="/shopping/person_echart.jsp">Anaslysis Result for Person Log</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#">about us</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#"> contact us </a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#">merchants settled</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#">join us</a>
            </div>
        </div>
    </body>
</html>
