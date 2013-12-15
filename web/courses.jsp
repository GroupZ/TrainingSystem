<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.ConnectDB"%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head><!-- Created by Artisteer v4.1.0.59861 -->
    <meta charset="utf-8">
    <title>Courses - Training Management System</title>

    
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
<nav class="art-nav">
    <ul class="art-hmenu"><li><a href="home.html" class="">Home</a></li><li><a href="courses.jsp.html" class="active">Courses</a><ul class="active"><li><a href="courses/view-courses.html">View Courses</a></li><li><a href="courses/manage-courses.html">Manage Courses</a></li><li><a href="courses/apply-courses.html">Apply Courses</a></li></ul></li><li><a href="attendance.html">Attendance</a><ul><li><a href="attendance/course-attendance.html">Course Attendance</a></li><li><a href="attendance/attendance-record.html">Attendance Record</a></li></ul></li><li><a href="certification.html">Certification</a></li><li><a href="advertisement.html">Advertisement</a></li><li><a href="report.html">Report</a></li><li><a href="profile.html">Profile</a></li><li><a href="status.html">Status</a></li><li><a href="contact-us.html">Contact Us</a></li></ul> 
    </nav>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-sidebar1"><div class="art-block clearfix">
        <div class="art-blockcontent"><form action="#" method="post" name="login" id="form-login">
  <fieldset class="input" style="border: 0 none;">
    <p id="form-login-username">
      <label for="modlgn_username">Username</label>
      <br />
      <input id="modlgn_username" type="text" name="username" class="inputbox" alt="username" style="width:100%" />
    </p>
    <p id="form-login-password">
      <label for="modlgn_passwd">Password</label>
      <br />
      <input id="modlgn_passwd" type="password" name="passwd" class="inputbox" size="18" alt="password" style="width:100%" />
    </p>
    <p id="form-login-remember">
      <label class="art-checkbox">
      <input type="checkbox" id="modlgn_remember" name="remember" value="yes" alt="Remember Me" />Remember Me
      </label>
    </p>
    <input type="submit" value="Login" name="Submit" class="art-button" />    
  </fieldset>
  <ul>
    <li>
      <a href="#">Forgot your password?</a>
    </li>
    <li>
      <a href="#">Forgot your username?</a>
    </li>
    <li>
      <a href="#">Create an account</a>
    </li>
  </ul>
</form></div>
</div><div class="art-vmenublock clearfix">
        <div class="art-vmenublockheader">
            <h3 class="t">Navigator</h3>
        </div>
        <div class="art-vmenublockcontent">
<ul class="art-vmenu"><li><a href="home.html" class="">Home</a></li><li><a href="courses.jsp.html" class="active">Courses</a><ul class="active"><li><a href="courses/view-courses.html">View Courses</a></li><li><a href="courses/manage-courses.html">Manage Courses</a></li><li><a href="courses/apply-courses.html">Apply Courses</a></li></ul></li><li><a href="attendance.html">Attendance</a><ul><li><a href="attendance/course-attendance.html">Course Attendance</a></li><li><a href="attendance/attendance-record.html">Attendance Record</a></li></ul></li><li><a href="certification.html">Certification</a></li><li><a href="advertisement.html">Advertisement</a></li><li><a href="report.html">Report</a></li><li><a href="profile.html">Profile</a></li><li><a href="status.html">Status</a></li><li><a href="contact-us.html">Contact Us</a></li></ul>
                
        </div>
</div><div class="art-block clearfix">
        <div class="art-blockcontent"><p>Enter Block content here...</p>
<br>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pharetra, tellus sit amet congue vulputate, nisi erat iaculis nibh, vitae feugiat sapien ante eget mauris.</p></div>
</div></div>
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                                <div class="art-postmetadataheader">
                                        <h2 class="art-postheader">Courses</h2>
                                                            
                                    </div>
                                <div class="art-postcontent art-postcontent-0 clearfix"><p>

                                    <p style="color:#0000FF;font-size: 16pt" align="center">[<a href="courses/apply-courses.html">+ Add a New Course</a>]</p>
                                        
<table width="800px" border="1">
    <tr bgcolor="#CC0000" style="color:#FFF">
	<th align="center">ID</th>
    <th align="center">Course Code</th>
    <th align="center">Course Name</th>
    <th align="center">Category</th>
    <th align="center">Start Date</th>
    <th align="center">Finish Date</th>
    <th>&nbsp;</th>
</tr>
<%
     try {
                Class.forName("com.mysql.jdbc.Driver");
                String host = "jdbc:mysql://localhost:3306/training_management";
                Connection connection = DriverManager.getConnection(host,"root","");
            
                Statement stmt = connection.createStatement();
                ResultSet resultSet;

                String query = "SELECT id, course_code, course_name, "
                        + "category, start_date, end_date FROM courses";
                
                //stmt = conn.prepareStatement(query);
                resultSet = stmt.executeQuery(query);
                
                if (resultSet.next())
                { %>
                    <tr>
                        <td> <%= resultSet.getString("id") %> </td>
                        <td> <%= resultSet.getString("course_code") %> </td>
                        <td> <%= resultSet.getString("course_name") %> </td>
                        <td> <%= resultSet.getString("category") %> </td>
                        <td> <%= resultSet.getString("start_date") %> </td>
                        <td> <%= resultSet.getString("end_date") %> </td>
                        <td>[<a href="courses/edit-courses.jsp?id=<%= resultSet.getString("id") %>">Edit</a>]
                        &nbsp;[<a href="#" onClick="var confirmDelete = confirm('Do you want to delete this entry?'); if(confirmDelete == true){window.location.href='./../CourseDelete?id=<%= resultSet.getString("id") %>'}">Delete</a>]
                        </td>
                    </tr>
                 <% while(resultSet.next()) {  %>
                    <tr>
                        <td> <%= resultSet.getString("id") %> </td>
                        <td> <%= resultSet.getString("course_code") %> </td>
                        <td> <%= resultSet.getString("course_name") %> </td>
                        <td> <%= resultSet.getString("category") %> </td>
                        <td> <%= resultSet.getString("start_date") %> </td>
                        <td> <%= resultSet.getString("end_date") %> </td>
                        <td>[<a href="courses/edit-courses.jsp?id=<%= resultSet.getString("id") %>">Edit</a>]
                        &nbsp;[<a href="#" onClick="var confirmDelete = confirm('Do you want to delete this entry?'); if(confirmDelete == true){window.location.href='./CourseDelete?id=<%= resultSet.getString("id") %>'}">Delete</a>]
                        </td>
                    </tr>
                 <% }
                }
                else
                {
                     out.println("<tr><td align=center colspan=7>- No record found - </td></tr>");
                }
            }
            //catch(ClassNotFoundException cnfe) {
           // System.err.println("Error loading driver: " + cnfe);
            //} 
            catch(SQLException sqle) {
            System.err.println("Error connecting: " + sqle);
            } catch(Exception ex) {
                 ex.printStackTrace();
            System.err.println("Error with input: " + ex);
            }
%>
</table>
                                
                                </p></div>


</article></div>
                    </div>
                </div>
            </div><footer class="art-footer">
<p>Copyright © 2013. All Rights Reserved.<br></p>
    <p class="art-page-footer">
        <span id="art-footnote-links"><a href="http://www.artisteer.com/" target="_blank">Web Template</a> created with Artisteer.</span>
    </p>
</footer>

    </div>
</div>


</body></html>