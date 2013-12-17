package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author MuhammadHasyimi
 */
public class UserReg extends HttpServlet {

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
            out.println("<h1>System found error</h1>");

            //read FORM data
            String name = request.getParameter("name");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            String designation = "staff";
            
            try {
                ConnectDB c_db = new ConnectDB();
                Connection conn=c_db.getConnection();
                String query, query2;

                Statement stmt = conn.createStatement();

                query = "INSERT INTO users (username, password, "
                        + "name, designation) VALUES ";
                query = query + "('" + user + "', '" + pass + "', '"
                        + name + "', '" + designation + "')";
                
                stmt = conn.prepareStatement(query);
                stmt.execute(query);
                
                query2 = "INSERT INTO staff_info (name, username) VALUES ";
                query2 = query2 + "('" + name + "', '" + user + "')";
                
                
                stmt = conn.prepareStatement(query2);
                stmt.execute(query2);
                    out.println("Success!");
                    response.sendRedirect("./login.jsp?note=2");
                
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
