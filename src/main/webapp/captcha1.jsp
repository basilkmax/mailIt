<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,java.net.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<%

		 String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 5) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String temp = salt.toString();
%>
<form name="captchaform" method="post" action="captchaTest.jsp"/>
	
	Enter the captcha below<br/>
	<label><h3><%=temp%></h3></label>
	<br/>
		<input type="hidden" id="temp" name="temp" value="<%=temp%>"/>

	<input name="captchatext" type="text" id="captchatext"/>
	<br/>
	
	<input type="submit" value="Submit"/>
	
	</form>
	
	<%
String msg1=request.getParameter("msg");
if(msg1!=null&&msg1.equals("capwrong"))
{out.println("Capctha Error ...");
}
%>
</body>
</html>
