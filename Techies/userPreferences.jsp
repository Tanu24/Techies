<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@ page import="was.database.*"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<%
String user=(String)request.getSession().getAttribute("username");
String login=(String)request.getSession().getAttribute("loginType");
DatabaseAccess3 db=new DatabaseAccess3();
db.updateLogintime(login,user); 
ResultSet rs1=null;
 %>
    <HEAD>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Preferences</title>
        
        <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
    </HEAD>
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
                                <a href="#">Set/Edit preferences</a>
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
            <li><a href="Static Pages/about.jsp#team">The Team</a></li>
            <li><a href="Static Pages/about.jsp#software">The Software</a></li>            
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
                              <li><a href="${pageContext.request.contextPath}/Forum/forum.jsp">Discussion Forum</a></li>
     </ul>
                        </div>
                    </div>
    </li>
</ul>
 
 <br/> <br/> 
           
            <%              int z=1;
            Connection con=null;
        try {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            String jdbcUrl = "jdbc:db2://localhost:50000/tgmc";
            con= DriverManager.getConnection(jdbcUrl, "db2admin", "tanu");
              String str="SELECT general_users_id from general_users WHERE username='"+user+"'";            
            String sql="SELECT totaltime from userpreftime WHERE general_users_id=?";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(str);  
            rs.next();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,rs.getInt(1));
            rs1=ps.executeQuery();
            rs1.next();
            
           %>
<%if(rs1.getInt(1)!=0){ 
int a=rs1.getInt(1)/60;
            int b=rs1.getInt(1)%60;
            if(a==0){%>
            <p style="font-family: Calibri; font-size: 20px; text-align: center; color: black;"> Your Preferred route time is <%=b %> seconds</p>
            <%}else if(b==0&&a==1){ %>
            <p style="font-family: Calibri; font-size: 20px; text-align: center; color: black;"> Your Preferred route time is 1 minute</p>
            <%}else if(b==0&&a!=1){ %>
            <p style="font-family: Calibri; font-size: 20px; text-align: center; color: black;"> Your Preferred route time is <%=a %> minutes</p>
            <%}else{ %>
            <p style="font-family: Calibri; font-size: 20px; text-align: center; color: black;"> Your Preferred route time is <%=a %> minutes <%=b %> seconds</p><%} }%>
            <p style="font-family: Calibri; font-size: 20px; text-align: left; font-style: italic; color: black; text-decoration: underline;">Choose your preferred signals:</P>            
            <p style="text-align: left;  color: black; background: white; width: 830px;">
              Signal Name   
            </p>
            
                <form action="${pageContext.request.contextPath}/userPrefProcess.jsp">
                 <% 

            PreparedStatement st1;
            ResultSet r;
            z=1;
            st1=con.prepareStatement("SELECT name from signals");
            r=st1.executeQuery();
            
            %>
                 <table align="left" width="850" cellspacing="10"  bgcolor="white" >
                     
                <tbody>
                    <TR>
                        <td>
                <input type="checkbox" name="cb1" size="100" value="1">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                        </TD>
                        <TD>
                <input type="checkbox" name="cb2" size="100" value="2">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                        </TD>
                        <TD>
                <input type="checkbox" name="cb3" size="100" value="3">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                </TD>
                    </TR>
                <TR>
                    <TD>
                <input type="checkbox" name="cb4" size="100" value="4">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                </TD>
                 
                     <TD>
                <input type="checkbox" name="cb5" size="100" value="5">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>
                <input type="checkbox" name="cb6" size="100" value="6">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                </TR>
                <TR>
                     <TD>
                <input type="checkbox" name="cb7" size="100" value="7">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                 
                     <TD>
                <input type="checkbox" name="cb8" size="100" value="8">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>
                <input type="checkbox" name="cb9" size="100" value="9">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     </TR>
                 <TR>
                     <TD>
                <input type="checkbox" name="cb10" size="100" value="10">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                
                     <TD>
                <input type="checkbox" name="cb11" size="100" value="11">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>
                <input type="checkbox" name="cb12" size="100" value="12">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     </TR>
                 <TR>
                     <TD>
                <input type="checkbox" name="cb13" size="100" value="13">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                
                     <TD>
                <input type="checkbox" name="cb14" size="100" value="14">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>
                <input type="checkbox" name="cb15" size="100" value="15">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     </TR>
                 <TR>
                     <TD>
                <input type="checkbox" name="cb16" size="100" value="16">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                
                     <TD>
                <input type="checkbox" name="cb17" size="100" value="17">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>
                <input type="checkbox" name="cb18" size="100" value="18">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     </TR>
                 <TR>
                     <TD>
                <input type="checkbox" name="cb19" size="100" value="19">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                 
                     <TD>
                <input type="checkbox" name="cb20" size="100" value="20">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>      
                <input type="checkbox" name="cb21" size="100" value="21">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     </TR>
                 <TR>
                     <TD>
                <input type="checkbox" name="cb22" size="100" value="22">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>
                <input type="checkbox" name="cb23" size="100" value="23">
                 <%
            r.next();
                out.print(r.getString(1));
                %>
                     </TD>
                     <TD>
                <input type="checkbox" name="cb24" size="100" value="24">
                 <%
            r.next();
                out.print(r.getString(1));
                %><br/>
                 <%
                 }
                catch(Exception e){
  }%>
                     </TD>
                     </TR>
           </tbody>
                 </table> 
  <input type="submit" class="button2" name="Login" value="Submit Preference" >					
  
                           </form>

<div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
            </div>
        </div>
    </body>
    </html>