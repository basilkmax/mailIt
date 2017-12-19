<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>trashAction</title>
</head>

<body>
<%
 String[] trashchecks=request.getParameterValues("trashcheck");
 int r=0;
 
 
 
 
   for(String item:trashchecks)
 {
 System.out.println("ID:"+item);
 String sql="update tempdata_tb set status='TRASH' where id='"+item+"'";
	r=obj.ForExecute(sql);
	
	
  }
  if(r>0)
		response.sendRedirect("spamPage.jsp?msg1=success");
	else
		response.sendRedirect("spamPage.jsp?msg1=error");
 
 
 
 %>
</body>
</html>
