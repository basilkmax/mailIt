<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>RegisterAction Jsp</title>
</head>

<body>
<%
 String name=request.getParameter("name");
 String age=request.getParameter("age");
 String gender=request.getParameter("gender");
 String[] hobbyid=request.getParameterValues("hobbyid");//hobby getting
 //String address=request.getParameter("address");
 String tcid=request.getParameter("country");
 String tsid=request.getParameter("state");
 String tpid=request.getParameter("location");
  String username=request.getParameter("username");
   String password=request.getParameter("password");
    String question=request.getParameter("securityQuestion");
	 String answer=request.getParameter("answer");
	 String altEmail=request.getParameter("alt_email");
	 
   
   
   String sql1="select cname from country_tb where cid='"+tcid+"'";
   ResultSet rs1=obj.ForSelect(sql1);
   rs1.next();
   String country=rs1.getString(1);
   
    String sql2="select sname from state_tb where sid='"+tsid+"'";
   ResultSet rs2=obj.ForSelect(sql2);
   rs2.next();
   String state=rs2.getString(1);
   
   
    String sql3="select p_name from location_tb where pid='"+tpid+"'";
   ResultSet rs3=obj.ForSelect(sql3);
   rs3.next();
   String location=rs3.getString(1);
   
   String sqlcheck="select username from register_tb where username='"+username+"'";
   ResultSet rscheck=obj.ForSelect(sqlcheck);
   
   if(rscheck.next())
   {
   
     response.sendRedirect("RegistrationPage.jsp?msg=error1");
   
   }
   else
   {
   
   
   String sql="insert into register_tb values(null,'"+name+"','"+age+"','"+gender+"','"+username+"','"+country+"','"+state+"','"+location+"')";
   
   int r=obj.ForExecute(sql);
   
   
   String sqltwo="insert into log_tb values(null,'"+username+"','"+password+"','"+question+"','"+answer+"','"+altEmail+"')";
   
   int rtwo=obj.ForExecute(sqltwo);
   
   
   int rthree=0;
  
   
  for(String item:hobbyid){
  
 out.println(item);
     String sqlthree="insert into hobby_tb values(null,'"+username+"','"+item+"')";
   
     rthree=obj.ForExecute(sqlthree);
   
   }
   
   
   
   
   
   
   
   if(r>0 && rtwo>0 && rthree>0)
   {
   response.sendRedirect("RegistrationPage.jsp?msg=success");
    }
   else
   {
    response.sendRedirect("RegistrationPage.jsp?msg=error");
    } 
	
	}//main if end
   
   %>
   

</body>
</html>
