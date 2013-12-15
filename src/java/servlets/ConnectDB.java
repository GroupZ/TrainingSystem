/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.sql.SQLException;

/**
 *
 * @author nickth
 */
public class ConnectDB {
     private java.sql.Connection  con = null;
     private final String url = "jdbc:mysql://";
     private final String driver = "com.mysql.jdbc.Driver";
     private final String serverName= "localhost";
     private final String portNumber = "3306";
     private final String databaseName= "training_management";
     private final String userName = "root";
     private final String password = "";
     private final String selectMethod = "cursor"; 
     
     public ConnectDB(){}
     
     private String getConnectionUrl(){        
          return url+serverName+":"+portNumber+"/"+databaseName;
     }
     
      public java.sql.Connection getConnection(){
        try{
           Class.forName(driver); 
           con = java.sql.DriverManager.getConnection(getConnectionUrl(),userName,password);
             if(con!=null) System.out.println("Connection Successful!");
               }catch(ClassNotFoundException | SQLException e){
               System.out.println("Error Trace in getConnection() : " + e.getMessage());
         }
          return con;
      }
     
       public void displayDbProperties(){
          java.sql.DatabaseMetaData dm = null;
          java.sql.ResultSet rs = null;
          try{
               con= this.getConnection();
               if(con!=null){
                    dm = con.getMetaData();
                    System.out.println("Driver Information");
                    System.out.println("\tDriver Name: "+ dm.getDriverName());
                    System.out.println("\tDriver Version: "+ dm.getDriverVersion ());
                    System.out.println("\nDatabase Information ");
                    System.out.println("\tDatabase Name: "+ dm.getDatabaseProductName());
                    System.out.println("\tDatabase Version: "+ dm.getDatabaseProductVersion());
                    System.out.println("Avalilable Catalogs ");
                    rs = dm.getCatalogs();
                    while(rs.next()){
                         System.out.println("\tcatalog: "+ rs.getString(1));
                    } 
                    rs.close();
                    rs = null;
                    closeConnection();
               }else System.out.println("ERROR: No active Connection");
          }catch(Exception e){
               e.printStackTrace();
          }
          dm=null;
     }     
     
     public void closeConnection(){
          try{
               if(con!=null)
                    con.close();
               con=null;
          }catch(Exception e){
               e.printStackTrace();
          }
     }
     public static void main(String[] args) throws Exception
       {
         
          ConnectDB myDbTest = new ConnectDB();
          myDbTest.displayDbProperties();
       }    
    
}
