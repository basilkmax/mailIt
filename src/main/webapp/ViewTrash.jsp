<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ViewTrash</title>
<div class="logout" style="float:right">
<a href="Logout.jsp"> <input type="button" value="LOGOUT" /></a>
</div>
Welcome user ID:<%Cookie[] usernamecookies=request.getCookies();
 String tusername="";
  for (int i=0; i<usernamecookies.length; i++)
{
  if(usernamecookies[i].getName().equals("username"))
  {
	  
	out.println(usernamecookies[i].getValue());
	tusername=usernamecookies[i].getValue().toString();
  
 }
  }%>
<br/>
<br/>
</head>

<body>


<div class="header" style="display:flex;" >
<div class="header1" style="padding:10px;">
<h3><a href="sendMailPage.jsp" >COMPOSE MAIL </a></h3>
</div>
<div class="header2" style="padding:10px;">
<h3><a href="inboxPage.jsp " >INBOX </a></h3>
</div>
<div class="header3" style="padding:10px;">
<h3><a href="addContacts.jsp" >ADD CONTACT </a></h3>
</div>
<div class="header4" style="padding:10px;">
<h3><a href="ViewContacts.jsp" >VIEW CONTACTS </a></h3>
</div>

</div>

<br/>
<h3>TRASH DETAILS</h3> 



<table border="solid" style="padding:10px;margin:5px;" cellpadding="15" cellspacing="5">
<tr>
	
	<th>Name</th>
	<th>Subject</th>
	<th>Date</th>
	
</tr>

<%
 //String tusername=session.getAttribute("username").toString();
 
//get receivers mail id
String sql1="select * from log_tb where username='"+tusername+"'";
ResultSet rs1=obj.ForSelect(sql1);
rs1.next();
String receiverMailID=rs1.getString("alternate_mailid");


String sql="select * from tempdata_tb where to_id='"+receiverMailID+"' and status='TRASH' ";
ResultSet rs=obj.ForSelect(sql);

while(rs.next())
{
%>

<tr>


 
	
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("from_id")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("subject")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("date")%></a></td>

	
	
</tr>	



<%
}
%>
 
</body>
</html>
