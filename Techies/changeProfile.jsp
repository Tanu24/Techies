<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="was.commoncode.bean.UserBean"%>
<%@ page import="was.database.DatabaseAccess1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<%String user=(String)request.getSession().getAttribute("username");
String logintype=(String)request.getSession().getAttribute("loginType");
out.print(user);
out.print(logintype);
DatabaseAccess1 db=new DatabaseAccess1();
UserBean userInfo=db.getInfo(user,logintype);
out.print(userInfo.getEmailid());

    %>    
<head>
<title>Edit Pofile</title>
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />

<script type="text/javascript" language="javascript">
     function validation() {
 

       document["form2"].action="editProfile.jsp";
       return;
       
 }
 
</script> 
</head>

<body>
<div id="title">
            <div id="title1">Swift<span>Citi</span></DIV>
            <div id="title2">A smarter way to a swifter city</div>
        </div>
        <div id="right-links">
        <br/>
            <table cellpadding="0px"><tr><td>
            
                <li class="user-right">
                    <a href="#"  class="drop">
                       <%=user %> 
                    </a>
                    <div class="dropdown_1column">
                        <div class="col_1">
                            <ul class="simple">
                                <a href="#">Profile</a>
                               <%if(logintype.equals("general")){ %>
                                <a href="${pageContext.request.contextPath}/userPreferences.jsp">Set/Edit Preferences</a>
                                <%} %>
                                <a href="logout.jsp">Logout</a>
                            </ul>
                        </div>
                    </div>
                </li>
                </td>
                <td>

                    <a href="${pageContext.request.contextPath}/home.jsp" accesskey="1" title="">
                        <img src="${pageContext.request.contextPath}/theme/css/images/home.jpg" width="30em" height="30em"/>
                    </a>
                </td></tr></table>
        </div>
        <br/><br/>
        
        <div id="main1">
  <ul id="menu2">
      <li class="menu_right"><a class="drop">About</a>
      <div class="dropdown_1column align_right">
        <div class="col_1">
          <ul class="simple">
            <li><a href="Static Pages/about.jsp#team">The Team</a></li>
            <li><a href="Static Pages/about.jsp#software">The Software</a></li>            
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
            <li><a href="map.jsp">Traffic Live!</a></li>            
          </ul>
        </div>
      </div>
    </li>
       <li class="menu_right"><a class="drop">Forum</a>
                <div class="dropdown_1column align_right">
                        <div class="col_1">
                            <ul class="simple">
                              <li><a href="Alerts/alerts.jsp">Alerts Forum</a></li> 
                              <%if(logintype.equals("general")){ %>
                              <li><a href="Forum/forum.jsp">Discussion Forum</a></li>
                              <%} %>
     </ul>
                        </div>
                    </div>
    </li>
</ul>
 
 <br/> <br/> 
 <form name="form2" method="post" onsubmit='return validation()'>  
        <table width="600" cellspacing=">
        <tbody align="left">
        <tr> <td>
		Username  </td><td>
		 <input type="text" name="user" value="<%=user%>">
		 </td>
			</tr> 
		 <tr> <td>
		Email Id </td><td>
		 <input type="text" name="Email" value="<%=userInfo.getEmailid()%>">
			</td> </tr> 	         
		 <tr><td>
		Contact Number </td><td>
		 <input type="text" name="contact" value="<%=userInfo.getContactnumber()%>">
			</td></tr> 
			 <tr><td>
		Address</td><td>
		 <input type="text" name="address" value="<%=userInfo.getAddress()%>">
			</td></tr> 
           <tr><td>
		City</td><td>
		 <input type="text" name="city" value="<%=userInfo.getCity()%>">
			</td></tr> 
       <tr><td>
		State</td><td>
		 <input type="text" name="state" value="<%=userInfo.getState()%>">
			</td></tr> 
	    <tr><td>
		Country </td><td>
		 <input type="text" name="country" value="<%=userInfo.getCountry()%>">
			</td></tr> 
			 <tr><td>
		Postal Code</td><td>
		 <input type="text" name="code" value="<%=userInfo.getPostalcode()%>">
			</td></tr> 
		 <tr> <td>
		Date of Birth</td><td>
		 <input type="text" name="dob" value="<%=userInfo.getBirthdate()%>">
			</td></tr>
       		</tbody>
       	</table>     
			<input type="submit" class="button2" value="Change & Save"></input>
			
            <p title="Change the password">
			<a href="changePassword.jsp">Change Password</a>
			</p>
    </form>  
    <div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
            </div>
</body>
</html>