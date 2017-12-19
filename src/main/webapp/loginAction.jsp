<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.io.*,java.sql.*,java.util.*,java.net.*" errorPage=""  session = "true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>

<%

String username=request.getParameter("username");
String password=request.getParameter("password");



String huser=username;
System.out.println("username:"+huser);

//defined for algorthm use
int j=0,k1=5,k2=3;
boolean cokiepresent=false;

 
         Cookie[] cookies = null;
          Cookie cookie = null;


cookies=request.getCookies();
 
 if(cookies != null )
  {
 for (int i=0; i<cookies.length; i++)
{
  cookie = cookies[i];

  if(cookie.getName().compareTo("username")==0)
  {
	
    String s=cookie.getValue();

   if(huser.equals(s))
	  {
      System.out.println("Hello :"+s);
      cokiepresent=true;
      j=i;
     
    } 
	

	
  
  }
  }
}
  
  
   // ALGORITHM
  
  
  
  
  //get local ip
   String localip=InetAddress.getLocalHost().toString();
  System.out.print("your ip address:"+localip+" and j value="+j);
  
 String sql3="select * from w where ip='"+localip+"' and username='"+username+"'";
  ResultSet rs3=obj.ForSelect(sql3);
  
  
  String sql4="select k1 from fs where ip='"+localip+"' and username='"+username+"'";
 ResultSet rs4=obj.ForSelect(sql4);
 
 String sql5="select k2 from ft where username='"+username+"'";
 ResultSet rs5=obj.ForSelect(sql5);
  
 


  
  
  


String sql1="select * from log_tb where username='"+username+"' and password='"+password+"'";
String sql2="select * from admin_tb where username='"+username+"' and password='"+password+"'";

ResultSet rs1=obj.ForSelect(sql1);
ResultSet rs2=obj.ForSelect(sql2);
//if login correct
if(rs1.next())
{
 
 
 System.out.println(" login correct");
 int rs4value=3,rs5value=30;

 // rs4.next();
  if(rs4.next())
  {
  String rs4Stringvalue=rs4.getString(1);
  rs4value=Integer.parseInt(rs4Stringvalue);
  System.out.println("rs4value="+rs4value);
  }
  
  //rs5.next();
  if(rs5.next())
  {
     String rs5Stringvalue=rs5.getString(1);
  rs5value=Integer.parseInt(rs5Stringvalue);
  System.out.println("rs5value="+rs5value);
  }
//if (((V alid(cookie, un,k1,true) _ ((srcIP; un) 2 W)) ^ (FS[srcIP; un] < k1)) _ (FT[un] < k2)) then
  if(((cokiepresent)||(rs3.next()))&&((rs4value<k1)||(rs5value<k2)))
  
 {
    System.out.println("entered1");
  
    
    String fscheck="select * from fs where username='"+username+"' and ip='"+localip+"'";
    ResultSet rsfscheck=obj.ForSelect(fscheck);

    if(rsfscheck.next())
    {

    String dosql1="update fs set k1='0' where  username='"+username+"' and ip='"+localip+"'";
    int dor1=obj.ForExecute(dosql1);
    System.out.println("ok");
    
    }
    else
    {

    //FS[srcIP, un] =0
    String dosql1="insert into fs values(null,'"+username+"','"+localip+"','0')";
    int dor1=obj.ForExecute(dosql1);
    System.out.println("executed1");
    }



	
  String wcheck="select * from w where username='"+username+"' and ip='"+localip+"'";
  ResultSet rsw=obj.ForSelect(wcheck);

  if(rsw.next()==false)
  {
    String dosql2="insert into w values(null,'"+username+"','"+localip+"')";
  int dor2=obj.ForExecute(dosql2);
  //chec for execute error
  System.out.println("executed2");

  }
  


	
	
	// grantaccess()
	session = request.getSession();
	session.setAttribute("username", username);
 	//set the cookie
 	String sanj=(String)session.getAttribute("username");
 	System.out.println("session username sanj:"+sanj);
 
 Cookie cookieusername = null;
 	cookieusername=new Cookie("username",username);
 	response.addCookie(cookieusername);
 	cookieusername.setMaxAge(60*60*72); //Time is in Minutes*/
 	
 	String tusername=cookieusername.getValue().toString();
	System.out.println("tusername="+tusername);
 
  
 
 	response.sendRedirect("WelcomePage.jsp");
 
 	//end of grant access
	
	
  }
   else
  	{
  	//ATT CHALLENGE OF CAPTCHA
 	System.out.println("entered else of correct credentilas");

		 String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 5) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String temp = salt.toString();
		
		System.out.println("reached else");
		
	
	%>
	<form name="captchaform1" method="post" action="captchaTest1.jsp"/>
	
	Enter the captcha below<br/>
	<label><h3><%=temp%></h3></label>
	<input type="hidden" id="temp" name="temp" value="<%=temp%>"/>
		<input type="hidden" id="usernamet" name="usernamet" value="<%=username%>"/>
	<br/>
	<input name="captchatext" type="text" id="captchatext"/>
	<br/>
	
	<input type="submit" value="Submit"/>
	
	</form>
		
	<%
  

 	
  
  	}
  
 
}
//for admin
else
if(rs2.next())
{
 session.setAttribute("username",rs2.getString("username"));
 response.sendRedirect("WelcomePageAdmin.jsp");
}



else//else part for  user
{
 
 System.out.println(" login incorrect");
 int rs4value=1;
	if(rs4.next())
  {
	   String rs4Stringvalue=rs4.getString(1);
   rs4value=Integer.parseInt(rs4Stringvalue)+1;
  System.out.println("rs4value"+rs4value);
  } 
	
	
	
	//else if (V alidUsername(un) ^ (FT[un] < k2)) then
  String sqlvaliduser="select * from log_tb where username='"+username+"'";
  ResultSet validuser=obj.ForSelect(sqlvaliduser);
 
  
   String sql51="select k2 from ft where username='"+username+"'";
 ResultSet rs51=obj.ForSelect(sql51);
 int rs51value=0;
 if(rs51.next())
 {
	   String rs51Stringvalue=rs51.getString(1);
  rs51value=Integer.parseInt(rs51Stringvalue);
  System.out.println("oye"+rs51value);
}
   System.out.println("reached 222");
  
  // if(((cookies[j].getName().equals("username"))||(rs3.next()))&&((rs4value<k1)||(rs5value<k2)))

//if ((Valid(cookie, un,k1,false) _ ((srcIP; un) 2 W)) ^ (FS[srcIP; un] < k1)) then
  //if(((!cookies[j].getName().equals("username"))||rs3.next())&&(rs4value<k1))
  if(rs3.next()&&rs4value<k1)
  {
 
  String dosql11="select k1 from fs where ip='"+localip+"' and username='"+username+"'";
 ResultSet rs11=obj.ForSelect(dosql11);
 rs11.next();
 int tempk1=Integer.parseInt(rs11.getString(1));
 tempk1=tempk1+1;
 
 String dosql12="update fs set k1='"+tempk1+"' where ip='"+localip+"' and username='"+username+"'";
 int dor12=obj.ForExecute(dosql12);
 //check for execute error
 
 	response.sendRedirect("LoginPage.jsp?msg=error");


  }
  
 
  
  else if(validuser.next()&&rs51value<k2)
  {
  //FT[un] ( FT[un] + 1
   String dosql22="select k2 from ft where username='"+username+"'";
 	ResultSet rs22=obj.ForSelect(dosql22);
 	rs22.next();
 	int tempk2=Integer.parseInt(rs22.getString(1));
 	tempk2=tempk2+1;
 
	 String dosql221="update ft set k2='"+tempk2+"' where username='"+username+"'";
	  	int dor221=obj.ForExecute(dosql221);
 
   	response.sendRedirect("LoginPage.jsp?msg=error");
  
  }

  else
  {
  	//ATT CHALLENGE OF CAPTCHA
  	//out.println("sorry u neeed to do captcha");
	/*int array[]=null;
	for(int h=0;h<=4;h++)
	{
		array[h]=*/
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
	<input type="hidden" id="temp" name="temp" value="<%=temp%>"/>
	<br/>
	<input name="captchatext" type="text" id="captchatext"/>
	<br/>
	
	<input type="submit" value="Submit"/>
	
	</form>
		
	<%
  
  }
  
}






%>

</body>
</html>
