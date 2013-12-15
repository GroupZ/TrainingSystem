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
    <title>Edit Courses - Training Management System</title>

    
    <!--[if lt IE 9]><script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <link rel="stylesheet" href="../style.css" media="screen">
    <!--[if lte IE 7]><link rel="stylesheet" href="../style.ie7.css" media="screen" /><![endif]-->
    <link rel="stylesheet" href="../style.responsive.css" media="all">
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css">
    <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">

    <script src="../jquery.js"></script>
    <script src="../script.js"></script>
    <script src="../script.responsive.js"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>


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
    <ul class="art-hmenu"><li><a href="../home.html" class="">Home</a></li><li><a href="../courses.jsp.html" class="active">Courses</a><ul class="active"><li><a href="../courses/view-courses.html">View Courses</a></li><li><a href="../courses/manage-courses.html">Manage Courses</a></li><li><a href="../courses/apply-courses.html">Apply Courses</a></li></ul></li><li><a href="../attendance.html">Attendance</a><ul><li><a href="../attendance/course-attendance.html">Course Attendance</a></li><li><a href="../attendance/attendance-record.html">Attendance Record</a></li></ul></li><li><a href="../certification.html">Certification</a></li><li><a href="../advertisement.html">Advertisement</a></li><li><a href="../report.html">Report</a></li><li><a href="../profile.html">Profile</a></li><li><a href="../status.html">Status</a></li><li><a href="../contact-us.html">Contact Us</a></li></ul> 
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
<ul class="art-vmenu"><li><a href="../home.html" class="">Home</a></li><li><a href="../courses.jsp.html" class="active">Courses</a><ul class="active"><li><a href="../courses/view-courses.html">View Courses</a></li><li><a href="../courses/manage-courses.html">Manage Courses</a></li><li><a href="../courses/apply-courses.html">Apply Courses</a></li></ul></li><li><a href="../attendance.html">Attendance</a><ul><li><a href="../attendance/course-attendance.html">Course Attendance</a></li><li><a href="../attendance/attendance-record.html">Attendance Record</a></li></ul></li><li><a href="../certification.html">Certification</a></li><li><a href="../advertisement.html">Advertisement</a></li><li><a href="../report.html">Report</a></li><li><a href="../profile.html">Profile</a></li><li><a href="../status.html">Status</a></li><li><a href="../contact-us.html">Contact Us</a></li></ul>
                
        </div>
</div><div class="art-block clearfix">
        <div class="art-blockcontent"><p>Enter Block content here...</p>
<br>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pharetra, tellus sit amet congue vulputate, nisi erat iaculis nibh, vitae feugiat sapien ante eget mauris.</p></div>
</div></div>
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                                <div class="art-postmetadataheader">
                                        <h2 class="art-postheader">Edit Courses</h2>
                                                            
                                    </div>
                                <div class="art-postcontent art-postcontent-0 clearfix"><p>
                                        
<%
     try {
            String ids = request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                String host = "jdbc:mysql://localhost:3306/training_management";
                Connection connection = DriverManager.getConnection(host,"root","");
            
                Statement stmt = connection.createStatement();
                ResultSet resultSet;

                String query = "SELECT * FROM courses WHERE id='" + ids + "'";
                
                //stmt = conn.prepareStatement(query);
                resultSet = stmt.executeQuery(query);
                
                if (resultSet.next())
                { %>
                    
                    <form action="./../CourseUpdate" method="post" name="updateCourse">
    <table width="800px" border="0" cellpadding="5px">
    <tr><td colspan="2" align="center" bgcolor="#CC0000" style="color:#FFF">Course Information</td></tr>
    <tr>
    	<td align="right" width="30%">
    	Course Code
    	</td>
        <td align="left" width="70%">
            <input name="ccode" type="text" size="30" value="<%= resultSet.getString("course_code") %>" required />
        </td>
    </tr>
    <tr>
    	<td align="right">
    	Course Name
    	</td>
        <td align="left">
            <input name="cname" type="text" size="30" value="<%= resultSet.getString("course_name") %>" required />
        </td>
    </tr>
    <tr>
    	<td align="right">
    	Category
    	</td>
        <td align="left" ><span id="spryselect1">
          <select size="1" name="category" title="Please choose..">
            <option value="">Please select...</option>
            <option id="Academic" value="Academic">Academic</option>
            <option id="Non-Academic" value="Non-Academic">Non-academic</option>
            <option id="ICT Training" value="ICT Training">ICT Training</option>
          </select>
                <script>
            document.getElementById("<%= resultSet.getString("category") %>").selected=true;
            </script>
          <span class="selectRequiredMsg">Please select an item.</span></span></td>   
    </tr>
    <tr>
    	<td align="right">
    	Start Date
    	</td>
        <td align="left"><span id="sprytextfield1">
                <input name="sdate" type="text" size="11" value="<%= resultSet.getString("start_date") %>" required />
        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
    </tr>
    <tr>
    	<td align="right">
    	Finish Date
    	</td>
        <td align="left"><span id="sprytextfield2">
                <input name="edate" type="text" size="11" value="<%= resultSet.getString("end_date") %>" required />
        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
    </tr>
    <tr>
    	<td align="right">
    	Venue/Place
    	</td>
        <td align="left">
            <input name="place" type="text" size="30" value="<%= resultSet.getString("venue") %>" required />
        </td>
    </tr>
    <tr>
    	<td align="right" valign="top">
    	Objectives
    	</td>
        <td align="left">
        <textarea name="objective" rows="4" cols="40" draggable="false"><%= resultSet.getString("objective") %></textarea>
        </td>
    </tr>
    <tr>
    	<td align="right">
    	Target Group
    	</td>
        <td align="left">
            <input name="target" type="text" size="30" value="<%= resultSet.getString("target") %>" required />
        </td>
    </tr>
    <tr><td colspan="2" align="center" bgcolor="#CC0000" style="color:#FFF">Trainer Information</td></tr>
    <tr>
    	<td align="right">
    	Trainer Name
    	</td>
        <td align="left">
            <input name="tname" type="text" size="30" value="<%= resultSet.getString("trainer_name") %>" required />
        </td>
    </tr>
    <tr>
    	<td align="right">
    	Trainer E-mail
    	</td>
        <td align="left"><span id="sprytextfield3">
                <input name="temail" type="text" value="<%= resultSet.getString("trainer_email") %>" size="30" required />
        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
    </tr>
    <tr>
    	<td align="right">
    	Trainer Contact Number
    	</td>
        <td align="left"><span id="sprytextfield4">
                <input name="tphone" type="text" value="<%= resultSet.getString("trainer_phone") %>" size="30" required />
        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
    </tr>
    <tr>
    	<td colspan="2">&nbsp;</td>
    <tr>
    	<td align="center" colspan="2">
        <input name="id" type="hidden" value="<%= resultSet.getString("id") %>">
    	<input type="submit" name="Submit" value="Update" />
        </td>
    </tr>
    </table>
    </form>
                <%
                }
                else
                {
                     out.println("ERROR! Unable to retrieve data from database.");
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

<!-- end -->
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
<script type="text/javascript">
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "date", {format:"yyyy-mm-dd", validateOn:["change"], hint:"yyyy-mm-dd", useCharacterMasking:true});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "date", {format:"yyyy-mm-dd", hint:"yyyy-mm-dd", useCharacterMasking:true, validateOn:["change"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "email");
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "integer", {validateOn:["change"]});
</script>

</body></html>