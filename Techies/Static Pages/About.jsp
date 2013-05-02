<%-- 
    Document   : contacts
    Created on : 12 Mar, 2013, 12:17:14 AM
    Author     : Tanu
--%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us</title>
        
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
                <li class="menu_right"><a href="#" class="drop">About</a>
                    <div class="dropdown_1column align_right">
                        <div class="col_1">
                            <ul class="simple">
                                <li><a href="#">The Team</a></li>
                                <li><a href="#">The Software</a></li>            
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="menu_right"><a href="contacts.jsp" class="drop">Contacts</a>
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
            <p style="text-align: left; font-family: Calibri; font-size: 20px; color: black;" id="team"><b>The Team</b></p>
            <p style="text-align: left;">The consists of four undergraduates who have a passion for working with problems that people face in their day-to-day lives. 
            The project came as an idea from The Great Mind Challenge by IBM and the team found it apt to work on. <br/>Through this project, they wish to suggest a method to 
            improve the deplorable situation of traffic in India today. They hope that through this software, they will serve humanity and will see the India, that they have always envisioned, in the near future.
            </p>
            <br/>
            <p style="text-align: left; font-family: Calibri; font-size: 20px; color: black;" id="software"><b>The Software</b></p>
            <p style="text-align: left;">The software uses traffic intensity at every crossroad as a parameter to set timer controls on traffic lights.
                There is provision for traffic clearance in case of passing of VIP and emergency vehicles. 
                 <br/><br/>
                Switching to guided manual control in case of an emergency situation is also a part of the system. 
                The residents of the city can access all the relevant information regarding traffic from an interactive website which will be updated regularly with the latest information. 
                The website can also be used by the Traffic Police and City Traffic Management Authority to issue alerts on manual control for a specific crossroad. 
                Our software is flexible to be used in any environment.</p>
            
        </div>
                    
        <br/><br/>
<div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
            </div>
        
    </body>
</html>
