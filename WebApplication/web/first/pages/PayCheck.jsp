<%-- 
    Document   : PayCheck
    Created on : 2019-11-29, 18:06:26
    Author     : Administrator
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="impl.StoreImpl"%>
<%@page import="java.util.Date"%>
<%@page import="impl.TradeImpl"%>
<%@page import="impl.ItemImpl"%>
<%@page import="java.util.List"%>
<%@page import="impl.CartImpl"%>
<%@page import="entity.*"%>
<%@page import="impl.UserImpl"%>
<%@page import="log.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String pass = request.getParameter("pass");
            User u = (User) session.getAttribute("user");
//            genIp ip = new genIp();
            String item_id = (String) session.getAttribute("item_id");
            String store = StoreImpl.findById(item_id);
            Cookie[] co = request.getCookies();
            if (!u.getUser_passwd().equals(pass)) {
                //genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "08", co[0].getName(), co[1].getName(), item_id, store);
                out.println("<script>alert(\"Password is incorrect.\")</script>");
                out.println("<script> window.history.back(-1); </script>");
            } else {
                genLog.Log(u.getUser_id(), InetAddress.getLocalHost().getHostAddress(), "1", co[0].getName(), co[1].getName(), item_id, store);
                Item item = ItemImpl.findNoItem(item_id);
                String item_no = item.getItem_no();
                List<Cart> c = CartImpl.findCartUser(u.getUser_no());  //通过item_no找到该cart
                int i = 0;
                while (i < c.size()) {
                    if (c.get(i).getItem_no().equals(item_no)) {
                        break;
                    } else {
                        i++;
                    }
                }
                Trade trade = new Trade(null, c.get(i).getItem_amount(), item_no, c.get(i).getUser_no(), c.get(i).getItem_size(), c.get(i).getItem_color());
                int t = TradeImpl.add(trade);
                if (c.get(i).getCart_no() != null) {
                    CartImpl.deleteCartId(c.get(i).getCart_no());
                }
                out.println("<script>alert(\"Pay successfully.\")</script>");
                out.println("<script> window.location.href=\"HomePage.jsp\"; </script>");
            }
        %>
    </body>
</html>
