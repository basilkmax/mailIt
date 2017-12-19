<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.Calendar,java.io.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Inbox</title>
Welcome user ID:<%Cookie[] usernamecookies=request.getCookies();
String tusername="";
for (int i=0; i<usernamecookies.length; i++)
{
if(usernamecookies[i].getName().equals("username"))
{
	  
	out.println(usernamecookies[i].getValue());
	tusername=usernamecookies[i].getValue().toString();

}
}
%>

<div class="logout" style="float:right">
<a href="Logout.jsp"> <input type="button" value="LOGOUT" /></a>
</div>
</head>

<body>
<br/>
<br/>


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

<div class="header0" style="padding:3px;">
<a href="seasonCustomize.jsp" >Customize Season factor </a>&nbsp;&nbsp;

<a href="ageCustomize.jsp" >Customize Age factor </a>&nbsp;&nbsp;

<a href="hobbyCustomize.jsp" >Customize HObby factor </a>
</div>

 <br/>
<h3>INBOX DETAILS</h3> 

 <form name="inboxTable" action="trashAction.jsp" method="post">

<table border="solid" cellpadding="10" cellspacing="5" >
<tr>
	<th>Select</th>
	<th>Name</th>
	<th>Subject</th>
	<th>Date</th>
	
</tr>

<%


//get receivers mail id
String sql1="select * from log_tb where username='"+tusername+"'";
ResultSet rs1=obj.ForSelect(sql1);
rs1.next();
String receiverMailID=rs1.getString("alternate_mailid");

//display contacts mail

		//filter the inbox from contacts_tb
String sqlcon="select mail_id from contacts_tb where username='"+tusername+"' and status='WHITELISTED' ";

ResultSet rscon=obj.ForSelect(sqlcon);


 
while(rscon.next())
{
 String tempmailid=rscon.getString(1);



 String sqlcon1="select * from tempdata_tb  where to_id='"+receiverMailID+"' and from_id='"+tempmailid+"' order by date";
 ResultSet rscon1=obj.ForSelect(sqlcon1);
	while(rscon1.next())
	{
	
	//update status of CONTACTS MAILS
 String sqlcontacts="update tempdata_tb set status='CONTACTS' where id='"+rscon1.getString(1)+"'";
  int rcontact=obj.ForExecute(sqlcontacts);
 if(rcontact>0)
 {System.out.println("Success in updatintg status of contacts");}
 else
 {System.out.println("FAILED in updating status of contacts");}	
	%>
 
 


<tr>

<td>
 <input type="checkbox"  name="trashcheck" value="<%=rscon1.getString(1)%>" /></td>
	
	<td><a href="mailDetails.jsp?id=<%=rscon1.getString(1)%>"> <%=rscon1.getString("from_id")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rscon1.getString(1)%>"> <%=rscon1.getString("subject")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rscon1.getString(1)%>"> <%=rscon1.getString("date")%></a></td>

	
	
</tr>
<%	





	}
	 	//rscon1
		} //rscon
		
 
  
   
//season fasctor filtration



//--------------------------------------------------------------
//check for user customized season factor
String sqlfac1="select * from userseasoncustom_tb where username='"+tusername+"'";

ResultSet rsfac1=obj.ForSelect(sqlfac1);

 String tempfacname="";
//if usercustom factor exists
if(rsfac1.next())
{//if1
 System.out.println("-----USER CUSTOMIZABLE FACTOR IS PRESENT");

  do
	{//dowhile
	//getting factorname to corresponding factorid
	String sqlfac2="select factor_name from seasonfactor_tb where factor_id='"+rsfac1.getString(3)+"'";
	ResultSet rsfac2=obj.ForSelect(sqlfac2);
	rsfac2.next();
	tempfacname=rsfac2.getString(1);
	
	 System.out.println("---factorname:"+tempfacname);
	
	String sqlf="select * from  tempdata_tb where to_id='"+receiverMailID+"' and status='PENDING' and message like '%"+tempfacname+"%'";

	ResultSet rsf=obj.ForSelect(sqlf);
	int rupd=0;
	while(rsf.next())
	{
	//updating
	String sqlupd="update tempdata_tb set status='FILTERED' where id='"+rsf.	getString(1)+"'";
	rupd=obj.ForExecute(sqlupd);
	}

	if(rupd>0)
	{
	System.out.println("filtered and updated from custom factor method");


	}
	else
	{
	System.out.println("error in filtration from custm factor methiod");

	}

	
		
	
	
}while(rsfac1.next());//dowhileend
	
	

}//if1end

//else
{//else1
//For season factor name regular filtering
//current month filteration


//checking for current month exists
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


//getting current season id for season filtering
String sql4="select season_id from seasoncountry_tb where state_id='"+tsid+"'and month_id='"+curMonth+"'";

String factorname="";
ResultSet rs4=obj.ForSelect(sql4);


//if current month data exists
if(rs4.next())
{//if2
System.out.println("-----Current month  factor  exists for regular");
String tseasonid=rs4.getString(1);

System.out.println("tseasonOd="+tseasonid);

//get season factorname

String sql5="select * from seasonfactor_tb where season_id='"+tseasonid+"'";
ResultSet rs5=obj.ForSelect(sql5);
rs5.next();

factorname=rs5.getString(3);

System.out.println("factor name="+factorname);



//usual season factor filtration


String sqlf="select * from  tempdata_tb where to_id='"+receiverMailID+"' and viewstatus='SEND' and message like '%"+factorname+"%'";

ResultSet rsf=obj.ForSelect(sqlf);
int rupd=0;
	while(rsf.next())
	{
	//updating
	String sqlupd="update tempdata_tb set status='FILTERED' where id='"+rsf.	getString(1)+"'";
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


}//if2end

else
{
System.out.println("-----Curretn month  factor DOESNT exists for regular");
out.println("<b><i>No data found for current month.</i><b>");
}

}//else1end




%>
<%




//FILTEREING BASED ON AGE

//--------------------------------------------------------------
//check for user customized age factor
String sqlfac2="select * from useragecustom_tb where username='"+tusername+"'";

ResultSet rsfac2=obj.ForSelect(sqlfac2);

 String tempfacname2="";
 
//if usercustom factor exists
if(rsfac2.next())
{//if2
 System.out.println("-----USER CUSTOMIZABLE AGE FACTOR IS PRESENT");
 
 do{//dowhilebegin
 
 
 
 
 String sqlfac3="select factor_name from age_tb where factor_id='"+rsfac2.getString(3)+"'";
	ResultSet rsfac3=obj.ForSelect(sqlfac3);
	rsfac3.next();
	tempfacname2=rsfac3.getString(1);
	
	 System.out.println("---agefactorname:"+tempfacname2);
	
	String sqlf1="select * from  tempdata_tb where to_id='"+receiverMailID+"' and status='PENDING' and message like '%"+tempfacname2+"%'";

	ResultSet rsf1=obj.ForSelect(sqlf1);
	int rupd2=0;
	while(rsf1.next())
	{
	//updating
	String sqlupd1="update tempdata_tb set status='FILTERED' where id='"+rsf1.	getString(1)+"'";
	rupd2=obj.ForExecute(sqlupd1);
	}

	if(rupd2>0)
	{
	System.out.println("filtered and updated from custom age factor method");


	}
	else
	{
	System.out.println("error in filtration from custm age factor methiod");

	}

 
 
 
 
 
 
 }while(rsfac2.next());//dowhileend
}

else
{//else2


 System.out.println("-----USER CUSTOMIZABLE AGE FACTOR IS NOOT PRESENT");
 

String sql8="select age from register_tb where username='"+tusername+"'";
ResultSet rs8=obj.ForSelect(sql8);
rs8.next();
String tage=rs8.getString(1);//age of user
//out.println(tage);//ok

String sql9="select factor_name from age_tb where min_age<'"+tage+"' and max_age>'"+tage+"'";
ResultSet rs9=obj.ForSelect(sql9);
String agefactorname="";


int rupd2=0;
while(rs9.next())
{
System.out.println("Reached while rs9.next of age factor");
agefactorname=rs9.getString(1);//age factor name of user
//out.println(agefactorname);

String sqlf2="select * from  tempdata_tb where to_id='"+receiverMailID+"' and status='PENDING' and viewstatus='SEND' and message like '%"+agefactorname+"%'";

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

}//else2



%>

<%



//hobby factor Filtering


//--------------------------------------------------------------
//check for user customized hobby factor
String sqlfac21="select * from userhobbycustom_tb where username='"+tusername+"'";

ResultSet rsfac21=obj.ForSelect(sqlfac21);

 String tempfacname3="";
 
//if usercustom factor exists
if(rsfac21.next())
{//if3

System.out.println("-----USER CUSTOMIZABLE HOBBY FACTOR IS PRESENT");
 
 do{//dowhilebegin
 
 
 
 
 String sqlfac31="select factor_name from hobbyfactor_tb where factor_id='"+rsfac21.getString(3)+"'";
	ResultSet rsfac31=obj.ForSelect(sqlfac31);
	rsfac31.next();
	tempfacname3=rsfac31.getString(1);
	
	 System.out.println("---hobbyfactorname:"+tempfacname3);
	
	String sqlf11="select * from  tempdata_tb where to_id='"+receiverMailID+"' and status='PENDING' and message like '%"+tempfacname3+"%'";

	ResultSet rsf11=obj.ForSelect(sqlf11);
	int rupd21=0;
	while(rsf11.next())
	{
	//updating
	String sqlupd11="update tempdata_tb set status='FILTERED' where id='"+rsf11.	getString(1)+"'";
	rupd21=obj.ForExecute(sqlupd11);
	}

	if(rupd21>0)
	{
	System.out.println("filtered and updated from custom hobby factor method");


	}
	else
	{
	System.out.println("error in filtration from custm hobby factor methiod");

	}

 
 
 
 
 
 
 }while(rsfac21.next());//dowhileend








}//if3


else
{//else3

System.out.println("-----USER CUSTOMIZABLE HOBBY FACTOR IS NOOT PRESENT");
String sql6="select * from hobby_tb where username='"+tusername+"'";
ResultSet rs6=obj.ForSelect(sql6);
String factorname1;
int rupd1=0;
while(rs6.next())
{
System.out.println("reached rs6 "+rs6.getString(3));

//missing sql for all factors



String sql7="select factor_name from hobbyfactor_tb where hobby_id='"+rs6.getString(3)+"'";


ResultSet rs7=obj.ForSelect(sql7);
while(rs7.next())
{
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
}
 
 
 }//else3






//SETTING NON FILTERED TO SPAM

String sqlsp="Select * from tempdata_tb where to_id='"+receiverMailID+"' and status='PENDING'";
ResultSet rssp=obj.ForSelect(sqlsp);
while(rssp.next())
{
 String sqlsp1="update tempdata_tb set status='SPAM' where id='"+rssp.getString(1)+"'"; 
 int rsp=obj.ForExecute(sqlsp1);
 if(rsp>0)
{
System.out.println(" updated SPAM");


}
else
{
System.out.println("error in SPam updating");

}


}

	
	
%>	


 <%
 //display through inbox mails
String sql="select * from tempdata_tb where to_id='"+receiverMailID+"' and status='FILTERED'";
ResultSet rs=obj.ForSelect(sql);

while(rs.next())
{
System.out.println("id:"+rs.getString(1));

%>


<tr>

<td>
 <input type="checkbox"  name="trashcheck" value="<%=rs.getString(1)%>" /></td>
	
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("from_id")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("subject")%></a></td>
	<td><a href="mailDetails.jsp?id=<%=rs.getString(1)%>"> <%=rs.getString("date")%></a></td>

	
	
</tr>	

	
	
	<%
	}


%>

	

</table>
<br/>

<input type="submit" value="move to trash"/>
</form>

<%
			
String msg=request.getParameter("msg");
if(msg!=null&&msg.equals("success"))
{out.println("Send mail successfully...");
}
else if(msg!=null&&msg.equals("error"))
{
out.println("Error in sending mail..");
}


			
String msg1=request.getParameter("msg1");
if(msg1!=null&&msg1.equals("success"))
{out.println("Moved to trash successfully...");
}
else if(msg1!=null&&msg1.equals("error"))
{
out.println("Error moving to trash..");
}

			
String msg3=request.getParameter("msg3");
if(msg3!=null&&msg3.equals("success"))
{out.println("BLACKLISTED successfully...");
}
else if(msg3!=null&&msg3.equals("error"))
{
out.println("Error IN BLACKLISTING..");
}

%>







</body>
</html>
