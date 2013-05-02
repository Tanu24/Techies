<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
    <head>
        <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
        <title>Forum-SwiftCiti</title>
<% 
String uname=(String)session.getAttribute("username");
    String que="",dat="",code="",aut="",ans="",b="a";
    int aut1,i=1,aut2,repid;
Connection cn;    
Statement stmt;
PreparedStatement stmt2;    
ResultSet rs,rs2,rs3;    
code=request.getQueryString();
%>
<script type="text/javascript" language="javascript">
     function validation() {
  
        if(document["form2"].data.value == "")
       { alert("Please Enter Your Query"); 
      return;
       }
      else
       {
       document["form2"].action="forum_ans_process.jsp?<%=code%>";
       return;
 }
 }
</script>

 </head>
 
    <body>

        <div id="title">
            <div id="title1">Swift<span>Citi</span></div>
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
        
                        <%            
try {           
Class.forName("com.ibm.db2.jcc.DB2Driver");            
String jdbcUri = "jdbc:db2://localhost:50000/tgmc";            
cn= DriverManager.getConnection(jdbcUri, "db2admin","tanu");            
stmt=cn.createStatement();
rs=stmt.executeQuery("select * from topic where topic_id = '"+code+"'");
rs.next();
que=rs.getString(3);
dat=rs.getString(4);
aut1=rs.getInt(2);          
rs.close();
stmt2=cn.prepareStatement("select username from general_users where general_users_id=?");
stmt2.setInt(1,aut1);
rs3=stmt2.executeQuery();
rs3.next();            
rs2=stmt.executeQuery("select * from reply where topic_id='"+code+"'");           
%>  
 <TABLE id="q-table" width="850" align="left"> 
            <tbody>  
                <tr align="left">
                    <td>
                        <a href="forum.jsp">&lt&ltBack to forum</a>
                    </td>
                </tr>
                <tr align="left">	    
                    <td align="left" id="ques">
                        QUESTION:
                        <br/><br/>
                        <a href="forum_ans.jsp?<%=code%>"><%=que%></a>
                    </td>
                </tr>
                <tr>  
                	<td width="80%"></td>                 
                    <td  align="right">
                        <%=rs3.getString(1)%> &nbsp&nbsp&nbsp
                    <%=dat%></td>
                </tr>
                <tr>
                    <td><br/><br/></td>
                </tr>
                </tbody>
                </TABLE>
                <br/><br/>

  
    




<br><br><br><br>


<table  width="850"cellpadding="2">
<tbody>
<TR>    
<th width="5%">No</th>
    
<th width="45%">Answer</th>
    
<th width="25%">Date and Time</th>
    
<th width="10%">Author</th>
</TR>
 
    
<%          
while(rs2.next()) {
repid=rs2.getInt(2);
ans=rs2.getString(4);
dat=rs2.getString(5);        
aut1=rs2.getInt(3);
        stmt2=cn.prepareStatement("select username from general_users where general_users_id=?");
stmt2.setInt(1,aut1);
rs3=stmt2.executeQuery();
rs3.next();
aut=rs3.getString(1);
%>
    
<tr align="left" id="a-table">	    
        
<td height="40" >
<%=i%></td>
        
<td >
<%=ans%>
</td>
        
<td>
<%=dat%></td>
        
<td ><%=aut%><br>
<%if(!(aut.equals(uname))){ %><a href="flagUser.jsp?author=<%=aut %>&topicid=<%=code %>&replyid=<%=rs2.getInt(2) %>&by=<%=b %> ">Flag</a><%}else{ %><a href="editAns.jsp?author=<%=aut %>&topicid=<%=code %>&replyid=<%=rs2.getInt(2) %>&by=<%=b %> ">Edit</a><a href="delAns.jsp?author=<%=aut %>&topicid=<%=code %>&replyid=<%=rs2.getInt(2) %>&by=<%=b %> ">Delete</a><%} %>
</td>   
</tr>	
    
<%i++;
}
rs2.close();
cn.close();

             
}
             
catch(Exception e) {

             
e.printStackTrace();

             }
             %>
</tbody>
</table>

         <br/><br/>

        <form name="form2"  method="post"  onsubmit='return validation()'>
            <div id="ask-form">
                    <input type="text" name="data" id="longtext">
                    <input type="submit" class="button2" name="Login" value="Post Answer">
            </div>		
        </form>

        </div>
<br/><br/>
        <div id="fotlinks6">
            <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
        </div>

    </body>
</html>  
