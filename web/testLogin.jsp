<%-- 
    Document   : testLogin
    Created on : Dec 16, 2013, 12:00:10 AM
    Author     : MuhammadHasyimi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Success!</h1>
        <%
        String cookieName = "name";
        Cookie[] cookies = request.getCookies();
       
        if(session.getAttribute("name") != null) {
            out.println("This is session" + "\n\n");
            out.println(session.getAttribute("name") + "\n\n");
            out.println(session.getAttribute("username") + "\n\n");
            out.println(session.getAttribute("designation"));
        }  
        else if (cookies != null) {
            for(int i=0; i<cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookieName.equals(cookie.getName())) {
                    out.println("This is cookie" + "\n\n");
                    out.println(cookie.getValue() + "\n\n");
                }
                if (cookie.getName().equals("username")) {
                    out.println(cookie.getValue() + "\n\n");
                }
                if (cookie.getName().equals("designation")) {
                    out.println(cookie.getValue());
                }
            }
        } 
        else {
            response.sendRedirect("./login.jsp");
        }     
        %>
        
        <br>
        <p><a href="./Logout">Logout</a></p>
    </body>
</html>
