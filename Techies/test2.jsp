<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@page import="was.common.PasswordService"%>
<%@page import="was.database.DatabaseAccess2"%>
<html>
    <head>
        <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />

        <title>Forgot Password</title>
    </head>
    <body>
        <div id="title">
            <div id="title1">Swift<span>Citi</span></DIV>
            <div id="title2">A smarter way to a swifter city</div>
        </div>
 <div id="right-links">
        <td>
            <a href="login.jsp">Login</a></td>
            &nbsp&nbsp
            <td>
                <a href="registration.jsp">Register</a>
                </td>&nbsp&nbsp&nbsp
                <td>

                    <a accesskey="1" title="">
                        <img src="${pageContext.request.contextPath}/theme/css/images/home.jpg" width="30em" height="30em"/>
                    </a>
                </td>
                
        </div>
        
        
        <br/><br/>
   <div id="main1">
            <ul id="menu2">
                <li class="menu_right"><a class="drop">About</a>
                    <div class="dropdown_1column align_right">
                        <div class="col_1">
                            <ul class="simple">
                                <li><a href="Static Pages/about.jsp">The Team</a></li>
                                <li><a href="Static Pages/about.jsp">The Software</a></li>            
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="menu_right"><a href="Static Pages/contacts.jsp" class="drop">Contacts</a>
                </li>
                <li class="menu_right"><a href="Static Pages/FAQ.jsp" class="drop">FAQs</a>
                </li>
                <li class="menu_right"><a class="drop">Resources</a>
                    <div class="dropdown_1column align_right">
                        <div class="col_1">
                            <ul class="simple">
                                <li><a href="#">Downloads</a></li>          
                            </ul>
                        </div>
                    </div>
                </li>
             
            </ul>
            <br/><br/>
 
            <div id="container">
<fieldset id="signin_menu">
<form>
<b><u><font style='font-family: "Times New Roman"; font-weight: bold' size="4">Please enter your new password</font></u></b>
                <br /><br />

         <div align="center"> Password &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type = "password" name= "texta"/>
<br/><br/>
Confirm Password &nbsp&nbsp&nbsp
		<input type = "password" name= "textb"/>
		<br/>
		<input type="submit" value="Submit" class="button2" ></input>
</div>

<% String username = (String)request.getSession().getAttribute("username");
 String logintype = (String)request.getSession().getAttribute("loginType");
	String a=request.getParameter("texta");
String b=request.getParameter("textb");
if(a!=null)
{
if ((a.length()<5)||(a.length()>10))
{out.println("Password length should be between 5 to 10 characters");
}
else if(b.equals(a))
	{String c=PasswordService.getInstance().encrypt(a);
	 DatabaseAccess2 dbO=new DatabaseAccess2();
	 dbO.insertNewPassword(username,c,logintype);
	response.sendRedirect("home.jsp");
	 }else
	 out.println("Confirmed Password doesn't match the password stated above");}
	%>
	</form>
	</fieldset></div>
	           </div>
	</body>
</HTML>
