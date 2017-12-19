<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>addSeasonCountry</title>
</head>

<body>
<%
String country_id=request.getParameter("country_id");
String state_id=request.getParameter("state_id");
String season_id=request.getParameter("season_id");
String month_id=request.getParameter("month_id");


System.out.println("ids:"+country_id+" "+state_id+" "+season_id+" "+month_id);

   String sql="insert into seasoncountry_tb values(null,'"+country_id+"','"+state_id+"','"+season_id+"','"+month_id+"')";
   

 int r=obj.ForExecute(sql);
   
   
   if(r>0)
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg4=success");
    }
   else
   {
    response.sendRedirect("WelcomePageAdmin.jsp?msg4=error");
    } 
	%>



</body>
</html>
