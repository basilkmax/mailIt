<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>actionSeasonCustomize</title>
</head>

<body>

<%
String tusername=session.getAttribute("username").toString();
String newfname=request.getParameter("newfname");
String factorid=request.getParameter("factorid");
System.out.println("username:"+tusername+" name:"+newfname+" fid:"+factorid);

String sql1="insert into userseasoncustom_tb values(null,'"+tusername+"','"+factorid+"')";
int r1=obj.ForExecute(sql1);
/*
String sql2="update seasonfactor_tb set factor_name='"+newfname+"' where factor_id='"+factorid+"'";
int r2=obj.ForExecute(sql2);*/

if(r1>0)
response.sendRedirect("seasonCustomize.jsp?msg=success");
else
response.sendRedirect("seasonCustomize.jsp?msg=error");

%>



	
	

</body>
</html>
