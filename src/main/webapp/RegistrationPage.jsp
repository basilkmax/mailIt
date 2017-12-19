<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Registration Page</title>
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
 	document.getElementById("state").innerHTML=xmlhttp.responseText;
 	}
	 }
 xmlhttp.open("GET","getStateDetails.jsp?d="+tempcid,true);
 xmlhttp.send();



}//end of function

//location function
function getLocationDetails(tempsid){
//alert(tempsid);
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
 	document.getElementById("location").innerHTML=xmlhttp.responseText;
 	}
	 }
 xmlhttp.open("GET","getLocationDetails.jsp?param="+tempsid,true);
 xmlhttp.send();

}

</script>


</head>
<body>
        <h3>Registration Form</h3>
        <div class="regitrationForm" style="background-color:lightblue;padding:35px;margin:35px;">
		<form name="registrationForm" action="registerAction.jsp" method="post">
		
		
            <label>Name:</label>
            <input name="name" id="name" type="text"/>
            <br/>
            <label>Age:</label>
            <input name="age" id="age" type="text"/>
			 <br/>
            <label>Gender:</label>
            <input id="gender" name="gender" type="radio" value="Male" /> Male
		    <input id="gender" name="gender" type="radio" value="Female" />Female
		    <br/>
			
			 <label>Hobby</label>
			 <%
			 String sql1="select * from hobbydetails_tb";
			 ResultSet rs1=obj.ForSelect(sql1);
			 while(rs1.next())
			 {
			 %>
			 <input type="checkbox" name="hobbyid" id="hobbyid" value="<%=rs1.getString(1)%>" /><%=rs1.getString(2)%>
			 <%
			 }
			 %>
			  
			 <br/>
          <!--  <label>Address:</label>
            <input name="address" id="address" type="text"/>
			 <br/>-->
			 
			
			  <label>Country</label>
			 <select name="country" id="country" onchange="getStateDetails(this.value)">
			 	<option>--Select Country--</option>
			 	 <% 
			
					String sql="select * from country_tb";
					ResultSet rs=obj.ForSelect(sql);
					
	

				 while(rs.next()){
				
				 // System.out.println(""+rs.getString(1));
				  
				 %>
				 <option value="<%=rs.getString(1)%>" id="<%=rs.getString(2)%>"> <%=rs.getString(2)%> </option>
				 <%
				 }
				 %>
				 
				
		
			 </select>


			 <br/>	


			  <label>State</label>
			 <select name="state" id="state" onchange="getLocationDetails(this.value)" >
			 	<option >--Select Country First--</option>
				
			 </select>
			 <br/>	
			 
			 
			 
			 
			   <label>Location</label>
			 <select name="location" id="location">
			 	<option>--Select State First--</option>
			 </select>
			 <br/>	
			 
			 
			  <label>Security Question</label>
			 <select name="securityQuestion" id="securityQuestion" >
			 	<option >--Select Security question --</option>
				<option value="Your pet name">--Your pet name --</option>
				<option value="Your Grandfathers name">--Your Grandfather's name --</option>
				<option value="Your License number">--Your License number--</option>
				
				
			 </select>
			 <br/>	
			 
			  <label>Answer:</label>
            <input name="answer" id="answer" type="text"/>
            <br/>
			
			 <label>Alternate Mail id:</label>
            <input name="alt_email" id="alt_email" type="text"/>
            <br/>
	
				
            <label>Username:</label>
            <input name="username" id="username" type="text"/>
			 <br/>
            <label>Password:</label>
            <input name="password" id="password" type="password"/>
			<br/>
			
			<input type="submit" value="Register here" />
			
            
        </form>
		
		</div>
            
			<%
			
String msg=request.getParameter("msg");

if(msg!=null&&msg.equals("error1"))
out.println("Error ..Username already exists ..try different username");

if(msg!=null&&msg.equals("success"))
{out.println("registered successfully...");
}
else
if(msg!=null&&msg.equals("error"))
out.println("Error in registration...");



			


%>
</body>
</html>
