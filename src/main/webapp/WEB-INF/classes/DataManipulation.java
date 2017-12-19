package myconnection;
import java.sql.*;
public class DataManipulation
{
  Connection con;
  ResultSet rs;
 int r;

 String instanceConnectionName = "mailingsystem-189307:asia-east1:mailingsystem-db";

    // TODO: fill this in
    // The database from which to list tables.
    String databaseName = "basil_db";

    String username = "root";

    // TODO: fill this in
    // This is the password that was set via the Cloud Console or empty if never set
    // (not recommended).
    String password = "root";
//[START doc-example]

    //didnt worked
    //String jdbcUrl = String.format("jdbc:mysql://google/%s?cloudSqlInstance=%s&"+"socketFactory=com.google.cloud.sql.mysql.SocketFactory",databaseName,instanceConnectionName);
  

//worked onsite
   String jdbcUrl = String.format("jdbc:google:mysql://mailingsystem-189307:asia-east1:mailingsystem-db/basil_db?user=root&amp;password=root");
  
  //jdbc:mysql://107.167.188.122:3306/basil_db
//jdbc:google:mysql://${INSTANCE_CONNECTION_NAME}/${database}?user=${user}&amp;password=${password}

    //worked for locally
 // String jdbcUrl = String.format("jdbc:mysql://localhost:3306/basil_db");
  public DataManipulation()
  {

  try
     {//googledriver worked onsite
	  Class.forName("com.mysql.jdbc.GoogleDriver");
      con=DriverManager.getConnection(jdbcUrl,username,password);
        
   //[END doc-example]
       }
     catch(Exception e)
     {
          System.out.println("Invalid database connection");
      }
   }   

   public int ForExecute(String s)
   {
     
      try 
      {
        PreparedStatement ps=con.prepareStatement(s);
        r=ps.executeUpdate();
      }    
       catch(Exception e)
       {
            System.out.println("forexecute: failed");
        }
        return r;
     }
  public ResultSet ForSelect(String s)
  {
      try
         {
               PreparedStatement ps=con.prepareStatement(s);
               rs=ps.executeQuery();
           
             
           }
              catch(Exception e)
               {
                     System.out.println("For select:not found");
               }
                return rs;
            }
      }
   
  
