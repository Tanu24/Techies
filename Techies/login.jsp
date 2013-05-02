<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>
 <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
<title>Login</title>
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
<html:errors></html:errors>
<html:form method="post" action="/verifyLogin">
					
					
								<p>
                                <label for="logintype">Login Type:  </label>&nbsp&nbsp
								<html:radio property="logintype" value="general">General User</html:radio>
								&nbsp&nbsp&nbsp&nbsp
								<html:radio property="logintype" value="incharge">User Incharge</html:radio>
							</p>
							<p>
							<label for="username">Username</label>&nbsp&nbsp&nbsp
							<html:text property="username"></html:text>
							</p>
							<p>
							<label for="password">Password</label>&nbsp&nbsp&nbsp
							<html:password property="password"></html:password>
							</p>
							<p>
							<input type="submit" class="button2" value="Sign In"></input>
							</p>
							<p title="Answer your Security Question" >
							<a href="ForgotPassword.jsp" >Forgot Password?</a>							
							</p>
								
								
							
</html:form>
</fieldset>
</div>
<div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
            </div>
        </div>
</body>
</html>
