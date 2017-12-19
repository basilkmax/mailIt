<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Compose Mail Page</title>
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
</div>
<br/>
COMPOSE MAIL:

<form name="mailform" action="sendmailAction.jsp" method="post">



<label>To ID</label>
<input type="text" name="to_id" id="to_id"/>

<br/>
<br/>


<label>SUBJECT</label>
<input type="text" name="subject" id="subject"/>

<br/>
<br/>



<label>Message</label>
<textarea  placeholder="type message here" name="message" id="message">
</textarea>

<br/>
<br/>




<input type="hidden" id="date" name="date"/>

<br/>
<br/>
<label>Status:PENDING</label>

<br/>
<br/>

<input type="submit" value="Send" />


</form>
<%
			
String msg=request.getParameter("msg");
if(msg!=null&&msg.equals("success"))
{out.println("Send mail successfully...");
}
else
if(msg!=null&&msg.equals("error"))
out.println("Error in sending mail..");
else
if(msg!=null&&msg.equals("error1"))
out.println("To mail id doesn't exists..");







%>
</body>
</html>
