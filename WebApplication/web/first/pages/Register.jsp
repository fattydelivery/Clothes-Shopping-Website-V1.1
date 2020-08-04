<%-- 
    Document   : Register
    Created on : 2019-11-21, 15:37:13
    Author     : 40710
--%>

<%@page import="impl.UserImpl"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../cssFile/index.css">
    </head>
    <body class="Rbody" onload="getEmpty()">
        <form action="RegisterCheck.jsp">
            <div class="Rback">
                <div class="reg">
                    <div class="head">
                        <p style="color: black">&nbsp; Register </p>
                    </div>
                    <div class="midl">
                        <input type="text" placeholder="UserName" name="userid" value="">
                    </div>
                    <div class="midl">
                        <input type="password" placeholder="Password" name="pass" value="">
                    </div>
                    <div class="midl">
                        <input type="text" name="phone" placeholder="Phone" value="">
                    </div>
                    <div class="midl">
                        <textarea name="addr" cols="4" rows="4" validate="{maxlength: 500}" value=""></textarea>
                    </div>
                    <div class="get">
                        <button> Register </button> 
                    </div>
                </div>
            </div>
            <div class="Rfoot">
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
        <!--<script src="../jsFile/register.js">-->

        <!--</script>-->
    </body>
</html>
