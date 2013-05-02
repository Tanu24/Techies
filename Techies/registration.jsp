<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
    <head>

        <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
        <title>Register</title>
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
                                <li><a href="${pageContext.request.contextPath}/Static Pages/links.jsp">Links</a></li>          
                            </ul>
                        </div>
                    </div>
                </li>
             
            </ul>
            <br/><br/>
<html:errors></html:errors>
            <html:form action="/register">
                <u><p style="font-family: Calibri; font-size: 20px; text-align: left; font-style: italic; color: black; ">Please register yourself</u></p>
                <br />
                <table cellspacing="10"><tbody><tr>
                <td>
                                Username*</td>
                            <td><html:text property="username"></html:text></td></tr>
                            <tr><td>               
                                    Password*</td><td><html:password property="password"></html:password></td></tr>
                            <tr><td>
                                    Confirm Password*</td> <td><html:password property="cPassword"></html:password></td></tr>
                            <tr><td>
                                    Email Id*</td><td><html:text property="emailid"></html:text></td></tr>
                            <tr><td>
                                    Contact Number*</td><td><html:text property="contactnumber"></html:text></td></tr>
                            <tr><td>
                                    Address</td><td><html:text property="address"></html:text></td></tr>
                            <tr><td>
                                    City*</td><td><html:text property="city"></html:text></td></tr>
                            <tr><td>
                                    State*</td><td><html:text property="state"></html:text></td></tr>                            
                            <tr><td>
                                    Country*</td><td><html:text property="country"></html:text></td></tr>
                            <tr><td>
                                    Postal Code</td><td><html:text property="postalcode"></html:text></td></tr>
                            <tr><td>
                                    Date of Birth</td><td><html:text property="birthdate"></html:text></td></tr>
                            <tr><td>
                                    Sex</td><td><html:radio property="sex" value="M">Male</html:radio>
                                    &nbsp&nbsp&nbsp&nbsp
                                <html:radio property="sex" value="F">Female</html:radio></td></tr>
                            <tr><td>
                                    Security Question*</td><td><html:select property="securityquestion">
                                    <html:option value="Select your Security Question">Select your Security Question</html:option>
                                    <html:option value="What's your pet's name?">What's your pet's name?</html:option>
                                    <html:option value="What's your first mobile number?">What's your first mobile number?</html:option>
                                    <html:option value="What's your favourite teacher's name?">What's your favourite teacher's name?</html:option>
                                    <html:option value="Who's your favourite superhero?">Who's your favourite superhero?</html:option>
                                    <html:option value="What's your favourite subject?">What's your favourite subject?</html:option>
                                </html:select></td></tr>
                        <tr><td>
                                Security Answer*</td><td><html:text property="securityanswer"></html:text></td></tr>
                        
                        </tbody></table> 
<div align="left">&nbsp&nbsp&nbsp&nbsp&nbspAll fields marked with * are mandatory</div>
                    <input type="submit" value="Submit" class="button2" ></input>

            </html:form>

            <div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
            </div>
        </div>

    </body>
</html>
