<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Login Page</title>
</head>

<body>


<form action="loginAction.jsp" method="post">
 
 			<label>Username:</label>
            <input name="username" id="username" type="text"/>
            <br/>
            <label>Password:</label>
            <input name="password" id="password" type="password"/>
			<br/>
			
			<input type="submit" value="Login here"/>
			

</form>

<%/*
	String username1="basilk";
	Cookie cookieusername=new Cookie("username",username1);
 	response.addCookie(cookieusername);
 	cookieusername.setMaxAge(50 * 50); //Time is in Minutes*/
	
			
String msg=request.getParameter("msg");
if(msg!=null&&msg.equals("error"))
{out.println("Invalid Credentials ...");
}

String msg1=request.getParameter("msg");
if(msg1!=null&&msg1.equals("capwrong"))
{out.println("Capctha Error ...");
}




%>

</body>
</html>
