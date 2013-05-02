<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
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
            <html:form action="/newPassword">
                <b><u><font style='font-family: "Times New Roman"; font-weight: bold' size="3">Please enter your security answer</font></u></b>
                <br /><br />
                <div align="left">
                
                                Login Type: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<html:radio property="logintype" value="general">General User</html:radio>
								&nbsp&nbsp&nbsp&nbsp
								<html:radio property="logintype" value="incharge">User Incharge</html:radio>
							<br/><br/>
							Username &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<html:text property="username"></html:text><br/><br/>
Security Question</label>&nbsp&nbsp
							<html:select property="securityquestion">
                                    <html:option value="Select your Security Question">Select your Security Question</html:option>
                                    <html:option value="What's your pet's name?">What's your pet's name?</html:option>
                                    <html:option value="What's your first mobile number?">What's your first mobile number?</html:option>
                                    <html:option value="What's your favourite teacher's name?">What's your favourite teacher's name?</html:option>
                                    <html:option value="Who's your favourite superhero?">Who's your favourite superhero?</html:option>
                                    <html:option value="What's your favourite subject?">What's your favourite subject?</html:option>
 </html:select>
 <br/><br/>Security Answer&nbsp&nbsp&nbsp&nbsp&nbsp
							<html:text property="securityanswer"></html:text>

							</div>

                        <input type="submit" value="Submit" class="button2" ></input>
            </html:form>
            
            <div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
            </div>
            </fieldset>
        </div>

</div>
    </body>
</html>