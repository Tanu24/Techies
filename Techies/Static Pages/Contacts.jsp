<%-- 
    Document   : contacts
    Created on : 12 Mar, 2013, 12:17:14 AM
    Author     : Tanu
--%>


<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contacts</title>
        
        <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
    </head>
    <body>
         <div id="title">
            <div id="title1">Swift<span>Citi</span></DIV>
            <div id="title2">A smarter way to a swifter city</div>
        </div>
        
<%String user=(String)session.getAttribute("username");
String login=(String)session.getAttribute("loginType");
                    if(user!=null){
                     %>
 <div id="right-links">
            <table cellpadding="0px"><tr><td>
                <li class="user-right">
                    <a href="#"  class="drop">
                       <%=user %> 
                    </a>
                    <div class="dropdown_1column">
                        <div class="col_1">
                            <ul class="simple">
                                <a href="${pageContext.request.contextPath}/changeProfile.jsp">Profile</a>
                                <%if(login.equals("general")){ %>
                                <a href="${pageContext.request.contextPath}/userPreferences.jsp">Set/Edit Preferences</a>
                                <%} %>
                                <a href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
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
      <%}
      else
      { %>
      <div id="right-links">
       <td>
            <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
            </td>
            &nbsp&nbsp
            <td>
                <a href="${pageContext.request.contextPath}/registration.jsp">Register</a>
                </td>&nbsp&nbsp&nbsp
                
                
        </div>
        <%} %> 
       
                        
        <div id="main1">
            <ul id="menu2">
                <li class="menu_right"><a class="drop">About</a>
                    <div class="dropdown_1column align_right">
                        <div class="col_1">
                            <ul class="simple">
                                <li><a href="about.jsp">The Team</a></li>
                                <li><a href="about.jsp">The Software</a></li>            
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="menu_right"><a href="#" class="drop">Contacts</a>
                </li>
                <li class="menu_right"><a href="FAQ.jsp" class="drop">FAQs</a>
                </li>
                <li class="menu_right"><a class="drop">Resources</a>
                    <div class="dropdown_1column align_right">
                        <div class="col_1">
                            <ul class="simple">
                                <li><a href="${pageContext.request.contextPath}/Static Pages/links.jsp">Links</a></li>
                                <%if(user!=null){ %>                           
                                <li><a href="${pageContext.request.contextPath}/map.jsp">Traffic Live!</a></li>   
                                <%} %>        
                            </ul>
                        </div>
                    </div>
                </li>
               <%if(user!=null){ %>  
                <li class="menu_right"><a class="drop">Forum</a>
                <div class="dropdown_1column align_right">
                        <div class="col_1">
                            <ul class="simple">
                              <li><a href="${pageContext.request.contextPath}/Alerts/alerts.jsp">Alerts Forum</a></li>
                              <%if(login.equals("general")){ %> 
                              <li><a href="${pageContext.request.contextPath}/Forum/forum.jsp">Discussion Forum</a></li>
                              <%} %>
     </ul>
                        </div>
                    </div>
    </li>
<%} %>

            </ul>
            <br/><br/>
            <p style="text-align: left; font-family: Calibri; font-size: 20px; color: black;"<b>Website Administration</b></p>
            <table cellspacing="10" width="360">
                <tbody>
                    <tr>
                        <td>
                            Chief Admin
                        </td>
                        <td>
                            +91 9876512345
                            <br/>
                            admin@swiftciti.co.in
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Deputy Admin
                        </td>
                        <td>
                            +91 9123456789
                            <br/>
                            dptadmin@swiftciti.co.in
                        </td>
                    </tr>
                </tbody>
            </table>
            <br/><br/><br/>
            <p style="text-align: left; font-family: Calibri; font-size: 20px; color: black;"<b>City Traffic Administration</b></p>           
            <table cellspacing="10" width="360">
                <tbody>
                    <tr>
                        <td>
                            Chief Admin
                        </td>
                        <td>
                            +91 9876545869
                            <br/>
                            admin@citytraffic.co.in
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Deputy Admin
                        </td>
                        <td>
                            +91 9123493654
                            <br/>
                            dptadmin@citytraffic.co.in
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
                    
        <br/><br/>
<div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved. </div>
            </div>
        
    </body>
</html>
