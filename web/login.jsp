<%-- 
    Document   : login
    Created on : Dec 3, 2013, 1:25:58 AM
    Author     : MuhammadHasyimi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Login - Welcome to Training Management System</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">

    <!--[if lt IE 9]><script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <link rel="stylesheet" href="style.css" media="screen">
    <!--[if lte IE 7]><link rel="stylesheet" href="style.ie7.css" media="screen" /><![endif]-->
    <link rel="stylesheet" href="style.responsive.css" media="all">
    <script src="jquery.js"></script>
    <script src="script.js"></script>
    <script src="script.responsive.js"></script>
</head>
<body>
<div id="art-main">
<header class="art-header">


    <div class="art-shapes">
<div class="art-textblock art-object1762504858" data-left="50%">
        <div class="art-object1762504858-text-container">
        <div class="art-object1762504858-text"><p style="text-align: center; "><span style="font-size: 26px; text-align: center; text-shadow: rgba(23, 23, 23, 0.976563) 0px 0px 12px; color: #FFFFFF; ">Management And Staff Training <span style="color: rgb(255, 255, 255); ">Syste</span>m</span></p></div>
    </div>   
</div>
</div>                
</header>

<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                      <div class="art-layout-cell art-content"><article class="art-post art-article">
                                <div class="art-postmetadataheader">
                                        <h2 class="art-postheader" align="center">Log in</h2>
                                                            
                                    </div>
                                <div class="art-postcontent art-postcontent-0 clearfix"><p>

<!-- start content --> 
<% 
boolean isSet = (request.getParameter("note") == null); 

if(isSet == false) {
if((request.getParameter("note")).equals("1")) { %>
	<p align="center" style="color:#F00; font-size:16px"> Login Failed! Invalid username/password</p>
<% } else if((request.getParameter("note")).equals("2")) { %>
<p align="center" style="color:#0C0; font-size:16px">Registration success! You may log in now.</p>
<% } else if((request.getParameter("note")).equals("3")) { %>
<p align="center" style="color:#00F; font-size:16px">Successfully logged out</p>
<% } } %>
<form name="trLoginForm" action="./Login" method="post" enctype="application/x-www-form-urlencoded">
<div align="center">
<table border=0 align="center">

<tr><td align="right">Username:</td><td>
<input type="text" name="truser" size="30" required /></td></tr>

<tr><td align="right">Password:</td><td>
<input type="password" name="trpass" size="30" required /></td></tr>

<tr><td colspan="2" align="center"><label><input type="checkbox" name="remember" value="1" />Remember me</label></td></tr>

<tr><td align="center" colspan="2"><br><input type="submit" name="btnLogin" value="Log in"  /></td></tr>
</table>
</div>
</form>
<br>
<p align="center">
[<a href="add-user.html">Sign up</a>]
Register now if you want to use this system.
</p>
<!-- end content -->                                
                                
</p></div>
</article></div>
                  </div>
                </div>
            </div><footer class="art-footer">
<p>Copyright © 2013. All Rights Reserved.<br></p>
</footer>

    </div>
</div>
</body></html>
