<%-- 
    Document   : login
    Created on : Dec 3, 2013, 1:25:58 AM
    Author     : MuhammadHasyimi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Welcome to Training System</title>
    </head>
    <body>
        <h4 align="center">Log in</h4>

<form name="trLoginForm" action="./login" method="post" enctype="application/x-www-form-urlencoded">
<table border=0 align="center">

<tr><td align="right">Username:</td><td>
<input type="text" name="truser" size="30" /></td></tr>

<tr><td align="right">Password:</td><td>
<input type="password" name="trpass" size="30" /></td></tr>

<tr><td colspan="2" align="center"><label><input type="checkbox" name="remember" value="1" />Remember me</label></td></tr>

<tr><td align="center" colspan="2"><br><input type="submit" name="btnLogin" value="Log in"  /></td></tr>
</table>
</form>
<br>
<p align="center">
[<a href="register.jsp">Sign up</a>]
Register now if you want to use this system.
</p>

<p align="center">
[<a href="#" onClick="window.prompt('Enter your email address',''); window.alert('Your password has been sent to your email address.');">Forgot password</a>]
</p><br>
    </body>
</html>
