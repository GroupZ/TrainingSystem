package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
import java.lang.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MuhammadHasyimi
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Please wait...</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Processing..</h1>");

            //read FORM data
            String username = request.getParameter("truser");
            String password = request.getParameter("trpass");
            int remember = getValue(request.getParameter("remember"), 0);
            
            try {
                ConnectDB c_db = new ConnectDB();
                Connection conn=c_db.getConnection();
                String query = null;
                //String query2 = null;
                Statement stmt;
                ResultSet resultSet;
                ResultSetMetaData resultSetMetaData;

                query = "SELECT * FROM users WHERE ";
                query = query + "username='" + username + "' AND ";
                query = query + "password='" + password + "'";
                
                stmt = conn.prepareStatement(query);
                resultSet = stmt.executeQuery(query);
                resultSetMetaData = resultSet.getMetaData();
                /* APPRAOCH 2 : Accessing MySQL DATABASE 
                String DBusername = "root"; // Username/password required
                String DBpassword = ""; // for MySQL.

                String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/training_management";
                Class.forName(driver);
                // Establish network connection to database.
                Connection connection =
                    DriverManager.getConnection(url, DBusername, DBpassword);
                */
                // Send query to database and store results.
                //Statement statement = conn.createStatement();
                
                //ResultSet resultSet = statement.executeQuery(query);
                
                if (resultSet.next())
                {
                    out.println("Login Success!");
                    //out.println("User ID :" + resultSet.getString("employeeID"));
                    //out.println("Username :" + resultSet.getString(3));
                    
                    if(remember == 1) {
                        Cookie c = new Cookie("name", resultSet.getString("name"));
                        c.setMaxAge(24*60*60);
                        response.addCookie(c);
                        
                        Cookie d = new Cookie("designation", resultSet.getString("designation"));
                        d.setMaxAge(24*60*60);
                        response.addCookie(d);
                        
                        Cookie e = new Cookie("username", resultSet.getString("username"));
                        e.setMaxAge(24*60*60);
                        response.addCookie(e);
                    } else {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("name", resultSet.getString("name"));
                        session.setAttribute("designation", resultSet.getString("designation"));
                        session.setAttribute("username", resultSet.getString("username"));
                        //session.setAttribute("username2", "BSBEV");
                    }
                    response.sendRedirect("./testLogin.jsp");
                }
                else
                {
                     out.println("Login Failed! Your entered wrong username/password");
                     //response.sendRedirect("./form/login.jsp");
                }
      // Print results.
            }
            //catch(ClassNotFoundException cnfe) {
           // System.err.println("Error loading driver: " + cnfe);
            //} 
            catch(SQLException sqle) {
            System.err.println("Error connecting: " + sqle);
            } catch(Exception ex) {
            System.err.println("Error with input: " + ex);
            }
            
            out.println("</body>");
            out.println("</html>");
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public int getValue(String valString, int defaultVal) {
    try {
      return(Integer.parseInt(valString));
    } catch(NumberFormatException nfe) {
      return(defaultVal);
    }
    catch(Exception e) {
        return(defaultVal);
    }
  }
}
