<%-- 
    Document   : Login
    Created on : 2019-11-21, 15:32:41
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
    </head>
    <body class="Lbody">
        <form action="LoginCheck.jsp">
            <div class="Lback">
                <div class="log">
                    <div class="head">
                        <p style="color: black"> Login </p>
                    </div>
                    <div class="mid">
                        <input type="text" placeholder="UserName" name="user">
                    </div>
                    <div class="mid">
                        <input type="password" placeholder="Password" name="pass">
                    </div>
                    <div class="get">
                        <button onclick="check()">Login</button>
                        <!--<a href="HomePage.jsp">  </a>-->
                    </div>
                    <div class="base">
                        <p class="pl"><a href="#" style="color: black;">Forget password</a></p>
                        <p class="pr"><a href="Register.jsp" style="color: rgb(215,120,29)" name="res">register immediately</a></p>
                    </div>
                </div>
            </div>
            <div class="Lfoot">
                <div class="links">
                    <a href="#">about us</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    |
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#"> contact us </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    |
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#">merchants settled</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    |
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#">join us</a>
                </div>
                <div class="wel">
                    Welcome to us
                </div>
            </div>
        </form>
    </body>
</html>
