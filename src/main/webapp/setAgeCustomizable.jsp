<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>setAgeCustomizable</title>
</head>

<body>

<%Cookie[] usernamecookies=request.getCookies();
 String tusername="";
  for (int i=0; i<usernamecookies.length; i++)
{
  if(usernamecookies[i].getName().equals("username"))
  {
	  
	out.println(usernamecookies[i].getValue());
	tusername=usernamecookies[i].getValue().toString();
  
 }
  }
String[] tfactorids=request.getParameterValues("factorids");
int r=0;
int r1=0;
for(String item:tfactorids)
{

String sql1="delete from useragecustom_tb where username='"+tusername+"' and factorid='"+item+"'";

r1=obj.ForExecute(sql1);

 if(r>0)
System.out.println("delted");
 else
System.out.println("error in delted");
 
String sql="insert into useragecustom_tb values(null,'"+tusername+"','"+item+"')";
 
r=obj.ForExecute(sql);
 

  
 }
  if(r>0)
response.sendRedirect("ageCustomize.jsp?msg7=success");
 else
response.sendRedirect("ageCustomize.jsp?msg7=error");
 
 
 %>
 
 
</body>
</html>
