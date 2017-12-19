<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>actionBlacklist1</title>
</head>

<body>
<%
 String from_id=request.getParameter("mail_id");
 String tusername=request.getParameter("username");
 


 //getting email from_id
 String sql0="select alternate_mailid from log_tb where username='"+tusername+"' ";
 
 ResultSet rs=obj.ForSelect(sql0);
 rs.next();
 String to_id=rs.getString(1);

/* 
 System.out.println("from id:"+from_id);
  
 System.out.println("username:"+tusername);
 
  System.out.println("to_id:"+to_id);
  */

 //add to blacklist tb
 
String sql="insert into blacklist_tb values(null,'"+from_id+"','"+to_id+"',CURRENT_DATE)";
 int r=obj.ForExecute(sql);
 
 
 
 
  
 String sql1="update contacts_tb set status='BLACKLISTED' where username='"+tusername+"' and mail_id='"+from_id+"' ";
 int r1=obj.ForExecute(sql1);
 
 String sql2="update tempdata_tb set status='SPAM' where from_id='"+from_id+"' and to_id='"+to_id+"' ";
 int r2=obj.ForExecute(sql2);
 
 
 
 if(r>0&r1>0&r2>0)
 response.sendRedirect("ViewContacts.jsp?msg=success");
 else
  response.sendRedirect("ViewContacts.jsp?msg=error");
  
 
 

 
 
 %>
</body>
</html>
