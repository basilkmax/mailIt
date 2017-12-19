<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Mail Details</title>
Welcome user ID:<%Cookie[] usernamecookies=request.getCookies();
 String tusername="";
  for (int i=0; i<usernamecookies.length; i++)
{
  if(usernamecookies[i].getName().equals("username"))
  {
	  
	out.println(usernamecookies[i].getValue());
	tusername=usernamecookies[i].getValue().toString();
  
 }
  }%><div class="logout" style="float:right">
<a href="Logout.jsp"> <input type="button" value="LOGOUT" /></a>
</div>
</head>

<body>
<br/>
<%
String tid=request.getParameter("id");
System.out.println("tid"+tid);
 String sql="select * from tempdata_tb where id='"+tid+"'";
 
 ResultSet rs=obj.ForSelect(sql);
 rs.next();
 
 String to_id=rs.getString(3);
 String from_id=rs.getString(2);
 String date=rs.getString(6);
 
 
	
 
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
MAIL Details:
<br/>
<br/>



<label>From ID:</label>
<input type="text"   value="<%=rs.getString(2)%>" />



<br/>
<br/>


<label>To ID:</label>
<input type="text"  value="<%=rs.getString(3)%>" />


<br/>
<br/>


<label>SUBJECT:</label>
<input type="text"  value="<%=rs.getString(4)%>" />

<br/>
<br/>



<label>Message:</label>
<textarea   name="message" id="message"><%=rs.getString(5)%>
</textarea>

<br/>
<br/>







<br/>
<br/>
<a href="ForwardMailPage.jsp?id=<%=tid%>" > <input type="button" value="Forward"/></a>
<a href="ReplyMailPage.jsp?id=<%=tid%>" > <input type="button" value="Reply"/></a>
<a href="BlacklistAction.jsp?to_id=<%=to_id%>&from_id=<%=from_id%>&date=<%=date%>" > <input type="button" value="Report Spam"/></a>

<br/>

<%
String sql1="update tempdata_tb set viewstatus='VIEWED' where id='"+tid+"'";
 int r=obj.ForExecute(sql1);
 if(r>0)
 	{System.out.println("UPdated successfully");}
	else
	System.out.println("update failed");
%>

</body>
</html>
