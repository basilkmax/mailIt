<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>GetstateDetails</title>
</head>

<body>
<%
//System.out.println("welcome to ajax");
String tcid=request.getParameter("d");
out.println("hello"+tcid);
String sql="select * from state_tb where cid='"+tcid+"'";
ResultSet rs=obj.ForSelect(sql);

while(rs.next())
{
%>
<option value="<%=rs.getString("sid")%>" id="<%=rs.getString("sname")%>" > <%=rs.getString("sname")%> </option>
<%
}


%>

</body>
</html>
