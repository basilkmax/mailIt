<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<table>
<th>Factor ID</th>
<th>Factor name</th>
<th>Select</th>


<%
//System.out.println("welcome to ajax");
String tseasonid=request.getParameter("d");
Cookie[] usernamecookies=request.getCookies();
String tusername="";
 for (int i=0; i<usernamecookies.length; i++)
{
 if(usernamecookies[i].getName().equals("username"))
 {
	  
	System.out.println(usernamecookies[i].getValue());
	tusername=usernamecookies[i].getValue().toString();
 
}
 }



String sql="select * from seasonfactor_tb where season_id='"+tseasonid+"'";

ResultSet rs=obj.ForSelect(sql);


while(rs.next())
{
String tempfactorid=rs.getString("factor_id");
System.out.println("factorid from getfactordetails:"+tempfactorid);

String sql1="select * from userseasoncustom_tb where username='"+tusername+"' and factorid='"+tempfactorid+"'";
ResultSet rs1=obj.ForSelect(sql1);


if(rs1.next())
{


%>
<tr>
<td><%=rs.getString("factor_id")%></td>
<td><%=rs.getString("factor_name")%></td>
<td> <input type="checkbox" id="factorids" name="factorids" value="<%=rs.getString("factor_id")%>" checked="checked" /></td>
</tr>
<%
}
else{




%>
<tr>
<td><%=rs.getString("factor_id")%></td>
<td><%=rs.getString("factor_name")%></td>
<td> <input type="checkbox" id="factorids" name="factorids" value="<%=rs.getString("factor_id")%>" /></td>
</tr>
<%
}
}
%>
</table>
</body>
</html>
