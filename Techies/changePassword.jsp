<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>

<head>
<title>Change Password</title>
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
</head>
<body>
<%String user=(String)request.getSession().getAttribute("username");
String login=(String)request.getSession().getAttribute("loginType");%>
<div id="title">
            <div id="title1">Swift<span>Citi</span></DIV>
            <div id="title2">A smarter way to a swifter city</div>
        </div>
        <div id="right-links">
            <table cellpadding="0px"><tr><td>
                <li class="user-right">
                    <a href="#"  class="drop">
                       <%=user %> 
                    </a>
                    <div class="dropdown_1column">
                        <div class="col_1">
                            <ul class="simple">
                                <a href="changeProfile.jsp">Profile</a>
                                <%if(login.equals("general")){ %>
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
                              <%if(login.equals("general")){ %>
                              <li><a href="Forum/forum.jsp">Discussion Forum</a></li>
                              <%} %>
     </ul>
                        </div>
                    </div>
    </li>
</ul>
 
 <br/> <br/> 
<div id="container">
<fieldset id="signin_menu">
<html:errors></html:errors>
<html:form action="/alterPassword">
<b><u><font style='font-family: "Times New Roman"; font-weight: bold' size="3">Please enter your new password</font></u></b>
<br /><br />
<div align="left">
Old Password:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<html:password property="oldPassword"></html:password>
<br/><br/>
New Password: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<html:password property="newPassword"></html:password>
<br/><br/>
Confirm Password:&nbsp&nbsp&nbsp<html:password property="cPassword"></html:password><br/><br/>
<input type="submit" class="button2" value="Submit"></input>
            <input type="reset" class="button2" value="Reset"></input>
</html:form>
</fieldset>
</div>
<br/><br/><br/><br/>
<div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
            </div>
        </div>
</body>
</html>