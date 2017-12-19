<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Reply Mail Page</title>

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
<br/>
<br/>
</head>

<body>
<%

String tid=request.getParameter("id");
 String sql="select * from tempdata_tb where id='"+tid+"'";
 ResultSet rs=obj.ForSelect(sql);
 rs.next();
 %>
 
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
MAIL Details:
<br/>
<br/>


<form method="post" action="ReplyMailAction.jsp">
<label>From ID:</label>
<input type="text" name="from_id" id="from_id" value="<%=rs.getString(2)%>" />



<br/>
<br/>


<label>To ID:</label>
<input type="text" name="to_id" id="to_id" value="<%=rs.getString(3)%>" />


<br/>
<br/>


<label>SUBJECT:</label>
<input type="text" name="subject" id="subject" value="" />

<br/>
<br/>



<label>Message:</label>
<textarea   name="message" id="message">
</textarea>

<br/>
<br/>

<input type="submit" value="Reply"/>

</form>

</body>
</html>
