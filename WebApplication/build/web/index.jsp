<%-- 
    Document   : index
    Created on : 2019-11-22, 10:06:47
    Author     : Administrator
--%>

<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="impl.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
    </head>
    <body class="HPbody">
        <div class="HPback">
            <div class="menu">
	        <ul class="menubar">
		    <li><a href="Login.jsp">login</a></li>
                    <li><a href="Register.jsp">register</a></li>
                    <li><a href="Bought.jsp">personal details</a></li>
                    <li><a href="ShopCart.jsp">shopping cart</a></li>
	        </ul>
            </div>
        <div class="box">
                <input type="text" name="search" placeholder="Please input the keyword">
                <div class="search">search</div>
        </div>
            <script language =javascript src="../jsFile/index.js"></script>
        <img id=hobj src ="../image/1.jpg" width=400 height=400 border =0 
            onclick="window.location.href='one.jsp'">
        <div style="width:500px;">
    <%
            List<FirstClothesClass> fcc = FirstClothesClassImpl.findAll();
            out.println("<dl class=\"classify\">");
            for(int i=0; i<fcc.size(); i++) {
                out.println("<dt>"+fcc.get(i).getFirst_id()+"</dt>");
                List<SecondClothesClass> scc = SecondClothesClassImpl.findByFN(fcc.get(i).getFirst_no());
                out.println("<dd>");
                for(int j=0; j<scc.size(); j++) {
                    out.println("<a href=\"itemlist.jsp?secondno="+scc.get(j).getSecond_secondno()+"&firstno="+scc.get(j).getSecond_firstno()+"\">"+scc.get(j).getSecond_secondid()+"</a>");
                }
                out.println("</dd>");
            }
            out.println("</dl>");
        %>
    <dl class="toggery">
        <dt>Popular shops:</dt>
        <dd>
            <a href="#">1.Uniqlo's official flagship store</a>
        </dd>
        <dd>
            <a href="#">2.ZARA official flagship store</a>
        </dd>
        <dd>
            <a href="#">3.H&M official flagship store</a>
        </dd>
        <dd>
            <a href="#">4.adidas official flagship store</a>
        </dd>
        <dd>
            <a href="#">5.Yishion official flagship store</a>
        </dd>
        <dd>
            <a href="#">6.NIKE official flagship store</a>
        </dd>
        <dd>
            <a href="#">7.BOY LONDON official flagship store</a>
        </dd>
        <dd>
            <a href="#">8.MLB official flagship store</a>
        </dd>
        <dd>
            <a href="#">9.PUMA official flagship store</a>
        </dd>
    </dl>
    </div>
        <div class="links">
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
