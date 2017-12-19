<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.Calendar,java.io.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Inbox</title>
Welcome user ID:<%=session.getAttribute("username")%>
<div class="logout" style="float:right">
<a href="Logout.jsp"> <input type="button" value="LOGOUT" /></a>
</div>
</head>

<body>
<br/>
<br/>
<h3><a href="spamPage.jsp" >SPAM </a></h3>
<br/>
<br/>
<h3>INBOX DETAILS</h3> 



<table>
<tr>
	<th>Name</th>
	<th>Subject</th>
	<th>Date</th>
</tr>

<%

String tusername=session.getAttribute("username").toString();


//get receivers mail id
String sql1="select * from log_tb where username='"+tusername+"'";
ResultSet rs1=obj.ForSelect(sql1);
rs1.next();
String receiverMailID=rs1.getString("alternate_mailid");


//display through inbox mails
String sql="select * from tempdata_tb where to_id='"+receiverMailID+"' and status='FILTERED'";
ResultSet rs=obj.ForSelect(sql);

while(rs.next())
{

%>

<tr>

	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("from_id")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("subject")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("date")%></a></td>
	
</tr>	
</a>
	
	
	<%
	}
   %>


	

</table>

<%
			
String msg=request.getParameter("msg");
if(msg!=null&&msg.equals("success"))
{out.println("Send mail successfully...");
}
else if(msg!=null&&msg.equals("error"))
{
out.println("Error in sending mail..");
}

//For season factor name




//get state from registerTb
String sql2="select * from register_tb where username='"+tusername+"'";
ResultSet rs2=obj.ForSelect(sql2);
rs2.next();
String tstate=rs2.getString("state");


//get sid from stateTB
String sql3="select sid from state_tb where sname='"+tstate+"'";

ResultSet rs3=obj.ForSelect(sql3);
rs3.next();
String tsid=rs3.getString(1);



//gettting current month
Calendar now=Calendar.getInstance();
int cur=now.get((Calendar.MONTH))+1;
String curMonth=Integer.toString(cur);

System.out.println("month is "+curMonth);

//getting current season id
String sql4="select season_id from seasoncountry_tb where state_id='"+tsid+"'and month_id='"+curMonth+"'";

String factorname="";
ResultSet rs4=obj.ForSelect(sql4);
if(rs4.next())
{

String tseasonid=rs4.getString(1);

System.out.println("tseasonOd="+tseasonid);

//get season factorname

String sql5="select * from seasonfactor_tb where season_id='"+tseasonid+"'";
ResultSet rs5=obj.ForSelect(sql5);
rs5.next();

factorname=rs5.getString(3);

System.out.println("factor name="+factorname);
%>
</br>
</br>
<%

out.println("<b><i>Current month,season factor name is:"+rs5.getString(3)+"</i></b>");

}
else
out.println("<b><i>No data found for current month.</i><b>");


//filtration

String sqlf="select * from  tempdata_tb where to_id='"+receiverMailID+"' and viewstatus='SEND' and message like '%"+factorname+"%'";

ResultSet rsf=obj.ForSelect(sqlf);
int rupd=0;
while(rsf.next())
{
//updating
String sqlupd="update tempdata_tb set status='FILTERED' where id='"+rsf.getString(1)+"'";
rupd=obj.ForExecute(sqlupd);
}

if(rupd>0)
{
System.out.println("filtered and updated");


}
else
{
System.out.println("error in filtration");

}

//hobby factor

String sql6="select * from hobby_tb where username='"+tusername+"'";
ResultSet rs6=obj.ForSelect(sql6);
String factorname1;
int rupd1=0;
while(rs6.next())
{
System.out.println("rs6 "+rs6.getString(3));
String sql7="select factor_name from hobbyfactor_tb where hobby_id='"+rs6.getString(3)+"'";

ResultSet rs7=obj.ForSelect(sql7);
rs7.next();
factorname1=rs7.getString(1);
System.out.println("factorname1="+factorname1);

	
	//filtering
	String sqlf1="select * from  tempdata_tb where to_id='"+receiverMailID+"' and viewstatus='SEND' and message like '%"+factorname1+"%'";

ResultSet rsf1=obj.ForSelect(sqlf1);

while(rsf1.next())
{
//updating
System.out.println("Reached rsf1");
String sqlupd1="update tempdata_tb set status='FILTERED' where id='"+rsf1.getString(1)+"'";
rupd1=obj.ForExecute(sqlupd1);
}









}
if(rupd1>0)
{
System.out.println("filtered and updated in hobby factor");


}
else
{
System.out.println("error in filtration in hobby factor");

}
 
%>
<%




//FILTEREING BASED ON AGE

String sql8="select age from register_tb where username='"+tusername+"'";
ResultSet rs8=obj.ForSelect(sql8);
rs8.next();
String tage=rs8.getString(1);
//out.println(tage);//ok

String sql9="select factor_name from age_tb where min_age<'"+tage+"' and max_age>'"+tage+"'";
ResultSet rs9=obj.ForSelect(sql9);
String agefactorname="";


int rupd2=0;
while(rs9.next())
{
System.out.println("Reached while rs9.next");
agefactorname=rs9.getString(1);
//out.println(agefactorname);

String sqlf2="select * from  tempdata_tb where to_id='"+receiverMailID+"' and viewstatus='SEND' and message like '%"+agefactorname+"%'";

ResultSet rsf2=obj.ForSelect(sqlf2);

while(rsf2.next())
{
//updating
System.out.println("Reached rsf2");
String sqlupd2="update tempdata_tb set status='FILTERED' where id='"+rsf2.getString(1)+"'";
rupd2=obj.ForExecute(sqlupd2);
}



}
if(rupd2>0)
{
System.out.println("filtered and updated in age factor");


}
else
{
System.out.println("error in filtration in age factor");

}
	
 
 

%>







</body>
</html>
