<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Blacklist action</title>
</head>

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

 
 String to_id=request.getParameter("to_id");
 String from_id=request.getParameter("from_id");
 String date=request.getParameter("date");
 

 String sql="insert into blacklist_tb values(null,'"+from_id+"','"+to_id+"','"+date+"')";
 int r=obj.ForExecute(sql);
 
 String sql1="update contacts_tb set status='BLACKLISTED' where username='"+tusername+"' and mail_id='"+from_id+"' ";
 int r1=obj.ForExecute(sql1);
 
 String sql2="update tempdata_tb set status='SPAM' where from_id='"+from_id+"' and to_id='"+to_id+"' ";
 int r2=obj.ForExecute(sql2);
 
 
 
 if(r>0&r1>0&r2>0)
 response.sendRedirect("inboxPage.jsp?msg3=success");
 else
  response.sendRedirect("inboxPage.jsp?msg3=error");
  
  
 

%>

<body>
</body>
</html>
