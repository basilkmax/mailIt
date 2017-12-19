<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Inbox</title>
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
<div class="logout" style="float:right">
<a href="Logout.jsp"> <input type="button" value="LOGOUT" /></a>
</div>
</head>
<body>
<br/>


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
</div>
<br/>
<h3>SPAM DETAILS</h3> 


<form name="spamTable" action="trashActionSpam.jsp" method="post">
<table border="solid" cellpadding="10" cellspacing="5">
<tr>
	<th>Select</th>
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

//display through spam mails
String sql="select * from tempdata_tb where to_id='"+receiverMailID+"' and status='SPAM'";
ResultSet rs=obj.ForSelect(sql);

while(rs.next())
{
System.out.println("id:"+rs.getString(1));
%>

<tr>
<td><input type="checkbox" id="trashcheck" name="trashcheck" value="<%=rs.getString(1)%>" /></td>

	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("from_id")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("subject")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("date")%></a></td>
	
</tr>	
</a>
	
	
	<%
	}
   %>


	

</table>
<br/>

<input type="submit" value="move to trash"/>
</form>
	
	<%		
String msg1=request.getParameter("msg1");
if(msg1!=null&&msg1.equals("success"))
{out.println("Moved to trash successfully...");
}
else if(msg1!=null&&msg1.equals("error"))
{
out.println("Error moving to trash..");
}
%>



</body>
</html>
