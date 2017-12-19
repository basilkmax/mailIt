<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,java.net.*" errorPage=""  session = "true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome page</title>
<div class="logout" style="float:right">
<a href="Logout.jsp"> <input type="button" value="LOGOUT" /></a>
</div>
<%/*out.print( session.getId());*/ %>

Welcome user :
 <%Cookie[] usernamecookies=request.getCookies();
 String tusername="";
  for (int i=0; i<usernamecookies.length; i++)
{
  if(usernamecookies[i].getName().equals("username"))
  {
	  
	out.println(usernamecookies[i].getValue());
	tusername=usernamecookies[i].getValue().toString();
  
 }
  }
String localip=InetAddress.getLocalHost().toString();
out.print("your ip address:"+localip);
		
		
%>
<br/>
<br/>
</head>

<body>

<input type="hidden" id="tusername" name="tusername" value="<%=tusername%>"/>
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
<div class="header5" style="padding:10px;">
<h3><a href="ViewTrash.jsp" >VIEW TRASH </a></h3>
</div>
</div>
<br/>
<%
			
String msg=request.getParameter("msg");
if(msg!=null&&msg.equals("success"))
{out.println("added contact successfully...");
}
else if(msg!=null&&msg.equals("error"))
{
out.println("Error in adding contacts..");
}
%>







</body>
</html>
