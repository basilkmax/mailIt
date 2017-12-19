<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<%
 String hobbyname=request.getParameter("hobbyname");
 
   String sql="insert into hobbydetails_tb values(null,'"+hobbyname+"')";
   
   int r=obj.ForExecute(sql);
   
   
   if(r>0)
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg1=success");
    }
   else
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg1=error");
    } 
	%>
   
 
</body>
</html>
