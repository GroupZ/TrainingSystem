import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
import java.lang.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MuhammadHasyimi
 */
public class login extends HttpServlet {

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
            
            HttpSession session = request.getSession(true);
            
            try{
                // APPRAOCH 2 : Accessing MySQL DATABASE 
                String DBusername = "root"; // Username/password required
                String DBpassword = ""; // for MySQL.

                String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/training_management";
                Class.forName(driver);
                // Establish network connection to database.
                Connection connection =
                    DriverManager.getConnection(url, DBusername, DBpassword);
                
                // Send query to database and store results.
                Statement statement = connection.createStatement();

                String query = "SELECT * FROM admin_info WHERE ";
                query = query + "username='" + username + "' AND ";
                query = query + "password='" + password + "'";
                
                System.out.println(query);
                
                ResultSet resultSet = statement.executeQuery(query);
                
                if (resultSet.next())
                {
                    out.println("Login Success!");
                    out.println("User ID :" + resultSet.getString("employeeID"));
                    out.println("Username :" + resultSet.getString(3));
                    
                    session.setAttribute("username", username);
                    session.setAttribute("username2", "BSBEV");
                    response.sendRedirect("index.jsp");
                }
                else
                {
                     out.println("Login Failed! Your entered wrong username/password");
                }
      // Print results.
            }
            catch(ClassNotFoundException cnfe) {
            System.err.println("Error loading driver: " + cnfe);
            } catch(SQLException sqle) {
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
}
