<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>sendmailAction</title>
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
// String from_id=request.getParameter("from_id");
  String to_id=request.getParameter("to_id");
   String subject=request.getParameter("subject");
    String message=request.getParameter("message");
	
	String sql1="select alternate_mailid from log_tb where username='"+tusername+"'";
	ResultSet rs1=obj.ForSelect(sql1);
	rs1.next();
	String from_id=rs1.getString(1);
	
	String sql2="select * from log_tb where alternate_mailid='"+to_id+"'";
	ResultSet rs2=obj.ForSelect(sql2);
	if(rs2.next()){
	
	
	String sql="insert into tempdata_tb values(null,'"+from_id+"','"+to_id+"','"+subject+"','"+message+"',CURRENT_DATE,'PENDING','SEND')";
	int r=obj.ForExecute(sql);
	
	if(r>0)
	{
		response.sendRedirect("sendMailPage.jsp?msg=success");
	}
	else
	{
		response.sendRedirect("sendMailPage.jsp?msg=error");
	}
	}
	else
	{
		response.sendRedirect("sendMailPage.jsp?msg=error1");
	}
	
	
	
	%>
 
</body>
</html>
