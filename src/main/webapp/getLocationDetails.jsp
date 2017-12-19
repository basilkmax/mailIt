<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>GetLocationDetails</title>
</head>

<body>
<%
//System.out.println("welcome to ajax");
String tsid=request.getParameter("param");
out.println("hello"+tsid);
String sql="select * from location_tb where sid='"+tsid+"'";
ResultSet rs=obj.ForSelect(sql);

while(rs.next())
{
%>
<option value="<%=rs.getString("pid")%>" id="<%=rs.getString("p_name")%>"> <%=rs.getString("p_name")%> </option>
<%
}


%>

</body>
</html>
