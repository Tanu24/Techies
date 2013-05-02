<%@page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SwiftCiti-Home</title>
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />

	
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/css/ajaxgoogle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/css/script.js"></script>
</head>
<%String user=(String)session.getAttribute("username");
String login=(String)session.getAttribute("loginType"); %>
<body>

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
        <br/><br/>
        
<div id="main1">
  <ul id="menu2">
      <li class="menu_right"><a class="drop">About</a>
      <div class="dropdown_1column align_right">
        <div class="col_1">
          <ul class="simple">
            <li><a href="${pageContext.request.contextPath}/Static Pages/about.jsp#team">The Team</a></li>
            <li><a href="${pageContext.request.contextPath}/Static Pages/about.jsp#software">The Software</a></li>            
          </ul>
        </div>
      </div>
    </li>
      <li class="menu_right"><a href="${pageContext.request.contextPath}/Static Pages/contacts.jsp" class="drop">Contacts</a>
    </li>
      <li class="menu_right"><a href="${pageContext.request.contextPath}/Static Pages/FAQ.jsp" class="drop">FAQs</a>
    </li>
      <li class="menu_right"><a class="drop">Resources</a>
      <div class="dropdown_1column align_right">
        <div class="col_1">
          <ul class="simple">
            <li><a href="${pageContext.request.contextPath}/Static Pages/links.jsp">Links</a></li>
            <li><a href="${pageContext.request.contextPath}/map.jsp">Traffic Live!</a></li>            
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
  <div id="gallery">
    <div id="slides">
      <div class="slide"><img src="${pageContext.request.contextPath}/theme/css/images/tp/t1.jpg" width="920" height="375" alt="side" /></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/theme/css/images/tp/tp2.jpg" width="870" hspace="20" height="400" align="center" /></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/theme/css/images/tp/t3.jpg" width="920" height="400" alt="side" /></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/theme/css/images/tp/t4.png" width="920" height="400" alt="side" /></div>
    </div>
    <div id="menu1">
      <ul>
        <li class="fbar">&nbsp;</li>
        <li class="menuItem"><a href=""><img src="img/sample_slides/thumb_macbook.png" alt="thumbnail" /></a></li>
        <li class="menuItem"><a href=""><img src="img/sample_slides/thumb_iphone.png" alt="thumbnail" /></a></li>
        <li class="menuItem"><a href=""><img src="img/sample_slides/thumb_imac.png" alt="thumbnail" /></a></li>
        <li class="menuItem"><a href=""><img src="img/sample_slides/thumb_about.png" alt="thumbnail" /></a></li>
      </ul>
    </div>

  </div>
  <div id="cont">
    
    <div id="cont2">
      <div id="con22">Ads</div>
       <div id="gallery1">
    <%Calendar cal=Calendar.getInstance();
		    	int sec=cal.get(Calendar.SECOND);
		  if(sec<15){
		  %><a href="www.spice-mobile.com">
      <img src="${pageContext.request.contextPath}/theme/css/images/ad/ad1.png" width="290" height="300" alt="side" />
      </a>
      <%}
      else if(sec>=15 && sec<30){
      %>
      <a href="www.coca-cola.com">
      <img src="${pageContext.request.contextPath}/theme/css/images/ad/ad2.png" width="290" height="300" alt="side" />
     </a>
      <% }else if(sec>=30 && sec<45){%>
      <a href="www.vodafone.in">
      <img src="${pageContext.request.contextPath}/theme/css/images/ad/ad3.png" width="290" height="300" alt="side" />
      </a>
      <%}else {%>
      <a href="www.myntra.com">
      <img src="${pageContext.request.contextPath}/theme/css/images/ad/ad4.gif" width="290" height="300" alt="side" />
	  </a><%} %>
    

  </div>
    </div>
      <div id="cont1">
    <div id="con11">SwiftCiti</div>
    <div id="con111">
          SwiftCiti provides a framework for smooth traffic flow in a city by relieving stress
          on manual control and automating the management system. SwiftCiti provides a method of
          automation of the existing traffic management system and increases its efficiency manifolds.
    </div>
  </div>

  </div>
</div>
        <br/><br/>
<div id="fotlinks6">
            <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved. </div>
</div>

</body>
</html>
  
