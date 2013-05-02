
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ</title>
        
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
                <li class="menu_right"><a href="contacts.jsp" class="drop">Contacts</a>
                </li>
                <li class="menu_right"><a href="#" class="drop">FAQs</a>
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
            <p style="text-align: left; font-family: Calibri; font-size: 20px; color: black;"><b>FAQs</b></p>
            <br/>
            <div style="text-align: left">
            <b>1. What documents should a driver carry while driving?</b><br/>
            <li>Driving license</li>
            <li>Registration Certificate</li>
            <li>Taxation Certificate</li>
            <li>PUC Certificate</li>
            <li>Insurance Certificate</li>
            <li>Fitness Certificate & Permit (incase of transport vehicles)</li><br/><br/>
            <b>2. Who is authorised to collect traffic fine on the spot?</b><br/>
            Any Traffic branch officer of and above the rank of Assist Sub-Inspector of Police duly authorised with a receipt book.<br/><br/>
            <b>3. What is the rule for tinted glasses?</b><br/>
            The glass of windscreen and rear window of every motor vehicle shall be maintained in such a way that visual transmission of light is not less than 70% and side windows shall be maintained in such a way that visual transmission of light is not less than 50% and shall conform to Indian Standards.
            <br/><br/>
            <b>4. What is the rule regarding seat belts? Is it binding using seat belts while driving in interior areas or by lanes?</b><br/>
            The driver and the person seated in the front seat must wear the seat belts while vehicle is in motion ( U/S 138 CMVR r/w 177 MVA . It has been made compulsory to the manufacturers from the year 1995 to provide the seat belts to the vehicles. It is binding on occupants to wear the seat belts whenever vehicle is in motion.
            <br/><br/>
            <b>5. What are the duties of a driver when his vehicle is involved in an accident resulting in death/bodily injury/damage to property?</b><br/>
            The duties of the driver are as under:<br/>
            <li>Arrange for medical help</li>
            <li>Inform the police</li>
            <li>Incase the vehicle is carrying dangerous goods, keep everyone away, avoid smoking in the vicinity and take emergency action as displayed on the vehicle. </li>
            </div>   
        </div>
                    
        <br/><br/>
<div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved. </div>
            </div>
        
    </body>
</html>
