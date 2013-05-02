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
<title>Flag user</title>
<script type="text/javascript" language="javascript">
     function validationa() {
  
        if(document["form2"].reason.value == "")
       { alert("Please select a reason to flag!"); 
      return;
       }
      else
       {
       document["form2"].action="flagProcess.jsp";
       return;
 }
 }
     function validationq() {
  
        if(document["form2"].reason.value == "")
       { alert("Please select a reason to flag!"); 
      return;
       }
      else
       {
       document["form2"].action="flagUserTopic.jsp";
       return;
 }
 }
</script>
</head>
<body>


        <div id="title">
            <div id="title1">Swift<span>Citi</span></DIV>
            <div id="title2">A smarter way to a swifter city</div>
        </div>
       <div id="right-links">
            <table cellpadding="0px"><tr><td>
                <li class="user-right">
                    <a class="drop">
                        <%=(String)request.getSession().getAttribute("username")%>
                    </a>
                    <div class="dropdown_1column">
                        <div class="col_1">
                            <ul class="simple">
                                <a href="${pageContext.request.contextPath}/changeProfile.jsp">Profile</a>
                                <a href="${pageContext.request.contextPath}/userPreferences.jsp">Set/Edit preferences</a>
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
<div id="container">
<fieldset id="signin_menu">
<%
String w=request.getParameter("by");
if(w.equals("a")){
String uname=request.getParameter("author");
String topicid=request.getParameter("topicid");
String rid=request.getParameter("replyid");
%>
<form name="form2"  method="post"  onsubmit='return validationa()'>
<b><u><font style='font-family: "Times New Roman"; font-weight: bold' size="3">Please select a reason</font></u></b>
<br /><br />
<input type="hidden" value=<%=uname %> name="user">
<input type="hidden" value=<%=topicid %> name="tpcid">
<input type="hidden" value=<%=rid %> name="repid">
<select name="reason">
<option value="">Select a reason</option>
<option value="spam">Spam</option>
<option value="abusive">Abusive Language</option>
</select>
<input type="submit" value="Submit Request"> 
</form>
<% }
if(w.equals("q")){
String uname=request.getParameter("author");
String topicid=request.getParameter("topicid");
%>

<form name="form2"  method="post"  onsubmit='return validationq()'>
<b><u><font style='font-family: "Times New Roman"; font-weight: bold' size="3">Please select a reason</font></u></b>
<br /><br />
<input type="hidden" value=<%=uname %> name="user">
<input type="hidden" value=<%=topicid %> name="tpcid">
<p>
<select name="reason">
<option value="">Select a reason</option>
<option value="spam">Spam</option>
<option value="abusive">Abusive Language</option>
</select>
</p>

<p>
<input type="submit" class="button2" value="Submit"></input>
</p>

</form>
<% } %>
</fieldset></div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
 <div id="fotlinks6">
            <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.
                 </div>
        </div>
</div>
</body>
</html>