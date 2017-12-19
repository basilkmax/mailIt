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
 String hobbyid=request.getParameter("hobbyfactorCombobox");
  String factorname=request.getParameter("factorName");
 
 
 
   String sql="insert into hobbyfactor_tb values(null,'"+hobbyid+"','"+factorname+"')";
   
   int r=obj.ForExecute(sql);
   
   
   if(r>0)
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg2=success");
    }
   else
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg2=error");
    } 
	%>
   
 
</body>
</html>
