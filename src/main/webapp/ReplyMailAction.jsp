<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<%

 String from_id=request.getParameter("from_id");
  String to_id=request.getParameter("to_id");
   String subject=request.getParameter("subject");
    String message=request.getParameter("message");
	
	out.println(from_id);
	
	String sql="insert into tempdata_tb values(null,'"+to_id+"','"+from_id+"','"+subject+"','"+message+"',CURRENT_DATE,'PENDING','SEND')";
	int r=obj.ForExecute(sql);
	
	if(r>0)
	{
		response.sendRedirect("inboxPage.jsp?msg=success");
	}
	else
	{
		response.sendRedirect("inboxPage.jsp?msg=error");
	}
	
	
	%>
</body>
</html>
