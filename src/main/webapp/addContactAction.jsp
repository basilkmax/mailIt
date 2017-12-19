<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>addContactAction</title>
</head>

<body>
<%
Cookie[] usernamecookies=request.getCookies();
 String tusername="";
  for (int i=0; i<usernamecookies.length; i++)
{
  if(usernamecookies[i].getName().equals("username"))
  {
	  
	out.println(usernamecookies[i].getValue());
	tusername=usernamecookies[i].getValue().toString();
  
 }
  }
	String mail_id=request.getParameter("mail_id");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	
	String sql="insert into contacts_tb values(null,'"+tusername+"','"+mail_id+"','"+name+"','"+address+"','"+phone+"','WHITELISTED')";
	int r=obj.ForExecute(sql);
	
	if(r>0)
	 response.sendRedirect("WelcomePage.jsp?msg=success");
	 else
	 response.sendRedirect("WelcomePage.jsp?msg=error");
	 
	%>

	
</body>
</html>
