<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>addAgeFactor</title>
</head>

<body>
<%
 String minAge=request.getParameter("minAgeCombobox");
 String maxAge=request.getParameter("maxAgeCombobox");
 
  String agefactorname=request.getParameter("agefactorName");
 
 
 
   String sql="insert into age_tb values(null,'"+minAge+"','"+maxAge+"','"+agefactorname+"')";
   
   int r=obj.ForExecute(sql);
   
   
   if(r>0)
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg6=success");
    }
   else
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg6=error");
    } 
	%>
   

</body>
</html>
