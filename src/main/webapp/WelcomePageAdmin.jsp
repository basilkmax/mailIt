<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome Page for Admin</title>
<script type="text/javascript">


function getStateDetails(tempcid){

//alert(tempcid);
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
 	document.getElementById("state_id").innerHTML=xmlhttp.responseText;
 	}
	 }
 xmlhttp.open("GET","getStateDetails1.jsp?d="+tempcid,true);
 xmlhttp.send();



}

function getSeasonFactors(tempseasonid){

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
 xmlhttp.open("GET","getSeasonFactorDetails.jsp?d="+tempseasonid,true);
 xmlhttp.send();



}
</script>
</head>

<div name="container" style="background-color:lightblue;margin:-5;">



<body>


<div class="logout" style="float:right">
<a href="Logout.jsp"> <input type="button" value="LOGOUT" /></a>
</div>
<center><h3><i>Welcome:</i><b><%=session.getAttribute("username")%></b></h3></center> 

<br/>
<br/>
<h3>HOBBY DETAILS </h3>
<form action="addHobby.jsp" method="post">

<label>Hobby Name:</label>
<input type="text" id="hobbyname" name="hobbyname"/>
<br/>
 <input type="submit" value="Save"/>
</form>
<br/>
	<%
			
String msg1=request.getParameter("msg1");
if(msg1!=null&&msg1.equals("success"))
{out.println("Added succesfully...");
}
else
if(msg1!=null&&msg1.equals("error"))
out.println("Error in adding hobby...");


%>
<br/>

<form action="addHobbyFactor.jsp" method="post">
<h3>HOBBY FACTOR DETAILS </h3>
<label>Hobby </label>
<select name="hobbyfactorCombobox" id="hobbyfactorCombobox">
<option >--Select Hobby --</option>
<%
 String sql="select * from hobbydetails_tb";
 ResultSet rs=obj.ForSelect(sql);
 while(rs.next())
 {
 %>
    <option value="<%=rs.getString(1)%>" id="<%=rs.getString(1)%>"> <%=rs.getString(2)%> </option>
 <%
 }
 %>
 </select>
 <br/>
 
 <label>Factor Name</label>
 <input type="text" id="factorName" name="factorName"/>
 <br/>
 
 <input type="submit" value="Save"/>
 
 

</form>
<br/>
	<%
			
String msg2=request.getParameter("msg2");
if(msg2!=null&&msg2.equals("success"))
{out.println("Added successfully...");
}
else
if(msg2!=null&&msg2.equals("error"))
out.println("Error in adding...");


%>


<br/>
<h3>SEASON DETAILS </h3>
<form action="addSeason.jsp" method="post">

<label>Season Name</label>
<input type="text" id="seasname" name="seasname" />

<br/>
<input type="submit" value="Add"/>
<br/>
</form>
	<%
			
String msg3=request.getParameter("msg3");
if(msg3!=null&&msg3.equals("success"))
{out.println("Added successfully...");
}
else
if(msg3!=null&&msg3.equals("error"))
out.println("Error in adding...");


%>
<br/>
<br/>
<h3>SEASON COUNTRY DETAILS </h3>
<form action="addSeasonCountry.jsp" method="post">
 <label>Country</label>
			 <select name="country_id" id="country_id" onchange="getStateDetails(this.value)">
			 	<option>--Select Country--</option>
			 	 <% 
			
					String sql1="select * from country_tb";
					ResultSet rs1=obj.ForSelect(sql1);
					
	

				 while(rs1.next()){
				
				 // System.out.println(""+rs.getString(1));
				  
				 %>
				 <option value="<%=rs1.getString(1)%>" id="<%=rs1.getString(1)%>"> <%=rs1.getString(2)%> </option>
				 <%
				 }
				 %>
				 
				
		
			 </select>
			 
			 
			 
			 

			 <br/>	


			  <label>State</label>
			 <select name="state_id" id="state_id"  >
			 	<option >--Select Country First--</option>
				
			 </select>
			 <br/>
			 <label>Season</label>
			  <select name="season_id" id="season_id" >
			 	<option>--Select Season--</option>
			 	 <% 
			
					String sql2="select * from season_tb";
					ResultSet rs2=obj.ForSelect(sql2);
					
	

				 while(rs2.next()){
				
				 // System.out.println(""+rs.getString(1));
				  
				 %>
				 <option value="<%=rs2.getString(1)%>" id="<%=rs2.getString(2)%>"> <%=rs2.getString(2)%> </option>
				 <%
				 }
				 %>
				 
				
		
			 </select>
			 
			 
			 <br/>
			  <label>Month</label>
			 <select name="month_id" id="month_id"  >
			 	<option >--Select Month--</option>
					<% for(int i=1;i<13;i++)
					{
						%>
						<option value="<%=i%>" ><%=i%></option>
					<%
					 }
					 %>	
						
				
			 </select>
		<br/>
	
		
		<input type="submit" value="Add" />
			 	
			 




</form>

	<%
			
String msg4=request.getParameter("msg4");
if(msg4!=null&&msg4.equals("success"))
{out.println("Added successfully...");
}
else
if(msg4!=null&&msg4.equals("error"))
out.println("Error in adding...");


%>
<br/>
<br/>
<h3>SEASON FACTOR DETAILS </h3>
<br/>
<form action="addSeasonFactor.jsp" method="post">

<label>Hobby </label>
<select name="seasonfactorCombobox" id="seasonfactorCombobox">
<option >--Select Season --</option>
<%
 String sql3="select * from season_tb";
 ResultSet rs3=obj.ForSelect(sql3);
 while(rs3.next())
 {
 %>
    <option value="<%=rs3.getString(1)%>" id="<%=rs3.getString(1)%>"> <%=rs3.getString(2)%> </option>
 <%
 }
 %>
 </select>
 <br/>
 
 <label>Factor Name</label>
 <input type="text" id="factorName" name="factorName"/>
 <br/>
 
 <input type="submit" value="Save"/>
 
 

</form>
<%
			
String msg5=request.getParameter("msg5");
if(msg5!=null&&msg5.equals("success"))
{out.println("Added successfully...");
}
else
if(msg5!=null&&msg5.equals("error"))
out.println("Error in adding...");


%>
<br/>

<br/>
<br/>
<h3>AGE FACTOR DETAILS </h3>
<br/>
<form action="addAgeFactor.jsp" method="post">

 <label>Min. Age</label>
			 <select name="minAgeCombobox" id="minAgeCombobox"  >
			 	<option >--Select Min. Age--</option>
					<% for(int i=1;i<100;i++)
					{
						%>
						<option value="<%=i%>" ><%=i%></option>
					<%
					 }
					 %>	
						
				
			 </select>
<br/>
 <label>Max Age</label>
			 <select name="maxAgeCombobox" id="maxAgeCombobox"  >
			 	<option >--Select Max. Age--</option>
					<% for(int i=1;i<100;i++)
					{
						%>
						<option value="<%=i%>" ><%=i%></option>
					<%
					 }
					 %>	
						
				
			 </select>
			<br/> 
 
 <label>Factor Name</label>
 <input type="text" id="agefactorName" name="agefactorName"/>
 <br/>
 
 <input type="submit" value="Save"/>
 
 

</form>
<%
			
String msg6=request.getParameter("msg6");
if(msg6!=null&&msg6.equals("success"))
{out.println("Added successfully...");
}
else
if(msg6!=null&&msg6.equals("error"))
out.println("Error in adding...");


%>
<br/>

 
  <br/>

 <%
			
String msg7=request.getParameter("msg7");
if(msg7!=null&&msg7.equals("success"))
{out.println("Saved successfully...");
}
else
if(msg7!=null&&msg7.equals("error"))
out.println("Failed in saving...");


%>
  </div>
</body>
</html>
