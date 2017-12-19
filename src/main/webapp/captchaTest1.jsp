<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,java.net.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean class="myconnection.DataManipulation" id="obj" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<%
	String captchatext=request.getParameter("captchatext");
	String usernamet=request.getParameter("usernamet");
	String username=usernamet;
	String temp=request.getParameter("temp");
	System.out.println("temp="+temp);
	
	if(captchatext.equals(temp))
	{
	// grantaccess()
	

 	session.setAttribute("username",usernamet);
 	//set the cookie
	System.out.println("usernamet"+usernamet);
 	Cookie cookieusername=new Cookie("username",usernamet);
 	response.addCookie(cookieusername);
 	cookieusername.setMaxAge(60*60*72); //Time is in Minutes 72 huors
	
	 String localip=InetAddress.getLocalHost().toString();

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


 
   String wcheck="select * from w where username='"+usernamet+"' and ip='"+localip+"'";
  ResultSet rsw=obj.ForSelect(wcheck);

  if(rsw.next()==false)
  {
    String dosql2="insert into w values(null,'"+usernamet+"','"+localip+"')";
  int dor2=obj.ForExecute(dosql2);
  //chec for execute error
  System.out.println("executed2");

  }
  
  
 
 	response.sendRedirect("WelcomePage.jsp");
 
 	//end of grant access
	}
	else
	response.sendRedirect("captcha1.jsp?msg=capwrong");
	
%>
</body>
</html>
