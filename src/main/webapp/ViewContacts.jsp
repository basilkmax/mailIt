<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>View Contacts</title>
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
<div class="header5" style="padding:10px;">
<h3><a href="ViewTrash.jsp" >VIEW TRASH </a></h3>
</div>

</div>
<br/>



<h3>CONTACTS DETAILS</h3>
<br/>
<table border="solid" style="padding:20px;margin:10px;" cellpadding="10" cellspacing="5">
<tr>
	
	<th>ID</th>
	<th>Name</th>
	<th>Mail ID</th>
	<th>Address</th>
	<th>Phone</th>
	<th>Status</th>
	
	
</tr>
<%

 //String tusername=session.getAttribute("username").toString();
 String sql="select * from contacts_tb where username='"+tusername+"'";
 ResultSet rs=obj.ForSelect(sql);
 while(rs.next())
 {
 %>
 <tr>
 	
     <td><%=rs.getString(1)%></td>
 	 <td><%=rs.getString(3)%></td>
	 <td><%=rs.getString(4)%></td>
	 <td><%=rs.getString(5)%></td>
	
	 <td><%=rs.getString(6)%></td>
	
	 <td><%=rs.getString(7)%></td>
	 <td><a href="actionBlacklist1.jsp?username=<%=rs.getString(2)%>&mail_id=<%=rs.getString(3)%>" > Blacklist It</a></td>
	</tr>
	<%
	}
	%>
	</table>
	
	<%
			
String msg=request.getParameter("msg");
if(msg!=null&&msg.equals("success"))
{out.println("Blacklisted successfully...");
}
else if(msg!=null&&msg.equals("error"))
{
out.println("Failed in blacklisting..");
}
%>


</body>
</html>
