<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>contactPage</title>
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
<div class="header5" style="padding:10px;">
<h3><a href="ViewTrash.jsp" >VIEW TRASH </a></h3>
</div>
<div class="header4" style="padding:10px;">
<h3><a href="ViewContacts.jsp" >VIEW CONTACTS </a></h3>
</div>


</div>
<br/>
<h3>ADD CONTACT DETAILS</h3>
<form name="contact" action="addContactAction.jsp" method="post">




<label>Mail ID</label>
<input type="text" name="mail_id" id="mail_id"/>
<br/>

<label>Name</label>
<input type="text" name="name" id="name"/>

<br/>
<label>Address</label>
<textarea name="address" id="address"></textarea>
<br/>

<label>phone</label>
<input type="text" name="phone" id="phone"/>
<br/>
<label>Status:PENDING</label>

<br/>
<input type="submit" value="Save"/>


</form>

</body>
</html>
