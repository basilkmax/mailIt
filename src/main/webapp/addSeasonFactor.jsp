<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>addSeasonFactor</title>
</head>

<body>
<%
 String seasonid=request.getParameter("seasonfactorCombobox");
  String factorname=request.getParameter("factorName");
 
 
 
   String sql="insert into seasonfactor_tb values(null,'"+seasonid+"','"+factorname+"')";
   
   int r=obj.ForExecute(sql);
   
   
   if(r>0)
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg5=success");
    }
   else
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg5=error");
    } 
	%>
   
</body>
</html>
