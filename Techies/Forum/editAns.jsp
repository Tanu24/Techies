<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
<title>Edit Answer</title>
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
        <br/><br/><br/><br/><br/>
        <a href="forum.jsp">&lt&ltBack to forum</a>
<%
String tid=request.getParameter("topicid");
String rid=request.getParameter("replyid");
Connection cn=null;
ResultSet rs=null;
try {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc";
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu");
            Statement st;
            st=cn.createStatement();
            rs=st.executeQuery("select * from reply where topic_id='"+tid+"' and reply_id='"+rid+"'");
            rs.next();
            }
            catch(Exception e){
            e.getMessage();
            }
             %>
             <div id="main1">
<div id="container">
<br/><br/>

<form action="editAnsProcess.jsp">
    <div id="ask-form">
<input type="text"  name="edited" id="longtext" value=<%=rs.getString(4)%>>
<input type="hidden" name="topicid" value=<%=tid %>>
<input type="hidden" name="replyid" value=<%=rid %>><br/>
<center><input type="submit" class="button2"></center>
    </div>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</form>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
 <div id="fotlinks6">
            <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.
                 </div>
        </div>
</div>

</body>
</html>
