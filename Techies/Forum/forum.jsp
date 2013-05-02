<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
    <head>
        <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
        <title>Forum-SwiftCiti</title>
<%
String tid=(String)session.getAttribute("username");
   String que="",dat="",aut="",code="",dat1="",b="q";
   Date exp;
   int i=1,j=1,autId,count=0;
   Connection cn=null;
   Statement stmt;
   PreparedStatement stmt1,stmt2,stmt3;
   ResultSet rs,rs1,rs2;
 
        try {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc";
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu");
            Statement st;
            st=cn.createStatement();
            ResultSet r=st.executeQuery("select * from topic order by topic_id desc");
            while(r.next())
             {j++;}
            }
            catch(Exception e){}
%>      

    <script type="text/javascript" language="javascript">
     function validation() {
  
        if(document["form2"].data.value == "")
       { alert("Please Enter Your Query");
         return;
       }
      else
       {

       document["form2"].action="forum_que_process.jsp?<%=j%>";
       return;
 }
 }
</script>
</head>
<body>
<% String login = (String)session.getAttribute("loginType"); %>

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

<ul id="menu2">
      <li class="menu_right"> <a class="drop">About</a>
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
                              <li><a href="${pageContext.request.contextPath}/Alerts/alerts.jsp">Alerts Forum</a></li> 
                              <%if(login.equals("general")){ %>
                              <li><a href="#">Discussion Forum</a></li>
                              <%} %>
     </ul>
                        </div>
                    </div>
    </li>
     
</ul>

<br/> <br/>
<form name="form2" method="post" onsubmit='return validation()'>
                <div id="ask-form">
                    <input type="text" name="data" id="longtext">
                    <input type="submit" class="button2" name="Login" value="Post Question">
                </div>
            </form>
            <br/><br/>

            <TABLE cellspacing="0">
                <TBODY>
                    <TR>
                        <TH width="5%">No.</TH>
                        <TH width="35%">Problem</TH>
                        <th width="25%">Date and Time</th>
                        <th width="25%">Author</th>
                        <th width="10%">Replies</th>
                    </TR>

  <%try{
            stmt=cn.createStatement();
            Date dt=new Date();
            rs=stmt.executeQuery("select * from topic order by topic_id desc");
            while(rs.next()) {
            count=0;
                code=rs.getString(1); 
                que=rs.getString(3);
                dat=rs.getString(4);
                autId=rs.getInt(2);
                exp=rs.getDate(5);
                if(exp.before(dt)){
                stmt3=cn.prepareStatement("delete from reply where topic_id='"+code+"'");
                stmt3.executeUpdate();                
                }
                else
                {
                stmt1=cn.prepareStatement("select * from reply where topic_id='"+code+"'");
            	stmt2=cn.prepareStatement("select username from general_users where general_users_id=?");
                stmt2.setInt(1,autId);
                rs1=stmt1.executeQuery();
                rs2=stmt2.executeQuery();
                rs2.next();                
                while(rs1.next()) {
                count++;
                }

    %>

     <tr align="left"  >	 
        <td  height="40" width="5%" align="left"  ><%=i%></td>
        <td  align="left" width="35%"><a href="forum_ans.jsp?<%=code %>"><%=que%></a></td>
        <td  align="left"  width="25%"><%=dat%></td>
        <td  align="left"  width="10%"><%=rs2.getString(1)%><br>
        <%if(!rs2.getString(1).equals(tid)){ %><a href="flagUser.jsp?author=<%=rs2.getString(1) %>&topicid=<%=code %>&by=<%=b %> ">Flag</a><%}else{%><a href="editQues.jsp?author=<%=rs2.getString(1) %>&topicid=<%=code %>&by=<%=b %>">Edit</a><a href="delQue.jsp?author=<%=rs2.getString(1) %>&topicid=<%=code %>&by=<%=b %> ">Delete</a><%} %></td>
        <td  align="left"  width="10%"><%=count%></td>        
    </tr> 
    
    
	
    <%
    }
    
        i++;
                }

            }

            catch(Exception e) {
                e.printStackTrace();
            }

    %>    
  
    </TBODY>

</table>
 

 </div>
<br/><br/><br/><br/><br/><br/><br/><br/>
        <div id="fotlinks6">
            <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.
                 </div>
        </div>

</body>
</html>