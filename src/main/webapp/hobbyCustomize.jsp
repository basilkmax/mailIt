<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>hobbyCustomize</title>

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
<script type="text/javascript">
function getHobbyFactors(temphobbyid){

//alert(tempseasonid);
	if(window.XMLHttpRequest)
	{
	xmlhttp=new XMLHttpRequest();
	}
	else
	{
	xmlhttp=new ActiveXObject("Microsoft.XMLHttp");
	}
	
xmlhttp.onreadystatechange=function(){

//alert(xmlhttp.responseText);
	 if(xmlhttp.readyState==4&&xmlhttp.status==200)
 	{
 	document.getElementById("factorNames").innerHTML=xmlhttp.responseText;
 	}
	 }
 xmlhttp.open("GET","getHobbyFactorDetails.jsp?d="+temphobbyid,true);
 xmlhttp.send();



}
</script>
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
<h3>Customize Hobby Factor </h3>
<br/>

<form action="setHobbyCustomizable.jsp" method="post">
 

<label>Hobby</label>

<select name="hobbyfactorCombobox" id="hobbyfactorCombobox" onchange="getHobbyFactors(this.value)">

<option >--Select Hobby --</option>
<%
 String sql="select hobby_id from hobby_tb where username='"+tusername+"'";
 ResultSet rs=obj.ForSelect(sql);
 while(rs.next())
 {
  String sql1="select hobby_id,hobby_name from hobbydetails_tb where hobby_id='"+rs.getString(1)+"'";
  ResultSet rs1=obj.ForSelect(sql1);
  rs1.next();
 %>
    <option value="<%=rs1.getString(1)%>" id="<%=rs1.getString(1)%>"> <%=rs1.getString(2)%> </option>
 <%
 }
 %>
 </select>
 <br/>
 
 
 <label>Factor Details</label>
 
 <table id="factorNames">
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
