<%-- 
    Document   : ShopPage
    Created on : 2019-11-29, 0:43:39
    Author     : Administrator
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
    </head>
    <body class="ShPbody">
        <div class="Outsearch">
            <div class="box">
                <input type="text" name="search" placeholder="Please input the keyword">
                <div class="Insearch">search</div>
            </div>
        </div>
        <div class="result">
            <%
                String store_no = request.getParameter("store_no");
                List<Item> ii = ItemImpl.findStoreItem(store_no);
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
                        <button class="in" id="in<%=i * 4 + 0%>" onclick="window.location.href = 'Clothing.jsp?user_no=<%=store_no%>&itemid=<%=ii.get(i * 4 + 0).getItem_id()%>'"> In </button>
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
                        <button class="in" id="in<%=i * 4 + 1%>" onclick="window.location.href = 'Clothing.jsp?user_no=<%=store_no%>&itemid=<%=ii.get(i * 4 + 1).getItem_id()%>'"> In </button>
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
                        <button class="in" id="in<%=i * 4 + 2%>" onclick="window.location.href = 'Clothing.jsp?user_no=<%=store_no%>&itemid=<%=ii.get(i * 4 + 2).getItem_id()%>'">In </button>
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
                        <button class="in" id="in<%=i * 4 + 3%>" onclick="window.location.href = 'Clothing.jsp?user_no=<%=store%>&itemid=<%=ii.get(i * 4 + 3).getItem_id()%>'"> In </button>
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
