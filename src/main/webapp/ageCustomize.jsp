<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ageCustomize</title>
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
<div class="header6" style="padding:10px;">
<h3><a href="spamPage.jsp" >SPAM </a></h3>
</div>
</div>
<br/>
<h3>Customize Age Factor </h3>
<br/>
<%

//String tusername=session.getAttribute("username").toString();

String sql8="select age from register_tb where username='"+tusername+"'";
ResultSet rs8=obj.ForSelect(sql8);
rs8.next();
String tage=rs8.getString(1);//age of user
//out.println(tage);//ok

String sql9="select factor_id,factor_name from age_tb where min_age<'"+tage+"' and max_age>'"+tage+"'";
ResultSet rs9=obj.ForSelect(sql9);
String agefactorname="";

%>
<b><u> Factor Details</u></b>
 <form action="setAgeCustomizable.jsp" method="post">
<table>
 

<tr>
<th>Factor ID</th>
<th>Factor Name</th>
<th>Select</th>
</tr>
<%
 
int rupd2=0;
while(rs9.next())
{
System.out.println("Reached while rs9.next of age factor in ageCustomize");
agefactorname=rs9.getString(1);//age factor name of user


String tempfactorid=rs9.getString(1);
//System.out.println("factorid from getfactordetails:"+tempfactorid);

String sql1="select * from useragecustom_tb where username='"+tusername+"' and factorid='"+tempfactorid+"'";
ResultSet rs1=obj.ForSelect(sql1);


if(rs1.next())
{
	 %>
	  <tr>
	  	<td><%=rs9.getString(1)%></td>
		<td><%=rs9.getString(2)%></td>
		<td><input type="checkbox" name="factorids" id="factorids" value="<%=rs9.getString(1)%>" checked="checked"/></td>
	</tr>
		
	  
	    
	 <%
}
else{

 %>
  <tr>
  	<td><%=rs9.getString(1)%></td>
	<td><%=rs9.getString(2)%></td>
	<td><input type="checkbox" name="factorids" id="factorids" value="<%=rs9.getString(1)%>"/></td>
</tr>
	
  
    
 <%
 }
 }
 %>
 </select>
 <br/>


 </table>
 

 <br/>
 <input type="submit" value="Save" />
 
 </form>
 





<%
			
String msg=request.getParameter("msg7");
if(msg!=null&&msg.equals("success"))
{
out.println("saved successfully...");
}
else if(msg!=null&&msg.equals("error"))
{
out.println("Error in saving factor..");
}
%>


</body>
</html>
