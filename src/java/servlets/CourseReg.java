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
public class CourseReg extends HttpServlet {

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
            out.println("<h1>Processing registration..</h1>");

            //read FORM data
            String ccode = request.getParameter("ccode");
            String cname = request.getParameter("cname");
            String category = request.getParameter("category");
            String sdate = request.getParameter("sdate");
            String edate = request.getParameter("edate");
            String place = request.getParameter("place");
            String objective = request.getParameter("objective");
            String target = request.getParameter("target");
            String tname = request.getParameter("tname");
            String temail = request.getParameter("temail");
            String tphone = request.getParameter("tphone");
            
            try {
                ConnectDB c_db = new ConnectDB();
                Connection conn=c_db.getConnection();
                String query = null;
                //String query2 = null;
                Statement stmt = conn.createStatement();
                ResultSet resultSet;
                ResultSetMetaData resultSetMetaData;

                query = "INSERT INTO courses (course_code, course_name, "
                        + "category, start_date, end_date, venue, objective, "
                        + "target, trainer_name, trainer_email, "
                        + "trainer_phone) VALUES ";
                query = query + "('" + ccode + "', '" + cname + "', '"
                        + category + "', '" + sdate + "', '" + edate + "', '"
                        + place + "', '" + objective + "', '" + target + "', '"
                        + tname + "', '" + temail + "', '" + tphone + "')";
                
                stmt = conn.prepareStatement(query);
                stmt.execute(query);
               // resultSetMetaData = resultSet.getMetaData();
                
               
                    out.println("Success!");
                    response.sendRedirect("./courses.jsp");
                
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
