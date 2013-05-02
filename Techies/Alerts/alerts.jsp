<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<%
   String type="",aut="",code="",dat1="", signal="",time="";
   Date dat,exp;
   int i=1,autId,count=0,z=1;
   Connection cn=null;
   Statement stmt;
   PreparedStatement stmt1,stmt2,stmt3;
   ResultSet rs,rs1,rs2;
      String logintype=(String)request.getSession().getAttribute("loginType");
   
%> 
<head>
      
        <link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
        <title>Alerts</title>
<script type="text/javascript" language="javascript">
      
     function validation() {
     
  
        if(document["form2"].cb1.checked==false&&document["form2"].cb2.checked==false&&document["form2"].cb3.checked==false&&document["form2"].cb4.checked==false&&document["form2"].cb5.checked==false&&document["form2"].cb6.checked==false&&document["form2"].cb7.checked==false&&document["form2"].cb8.checked==false&&document["form2"].cb9.checked==false&&document["form2"].cb10.checked==false&&document["form2"].cb11.checked==false&&document["form2"].cb12.checked==false&&document["form2"].cb13.checked==false&&document["form2"].cb14.checked==false&&document["form2"].cb15.checked==false&&document["form2"].cb16.checked==false&&document["form2"].cb17.checked==false&&document["form2"].cb18.checked==false&&document["form2"].cb19.checked==false&&document["form2"].cb20.checked==false&&document["form2"].cb21.checked==false&&document["form2"].cb22.checked==false&&document["form2"].cb23.checked==false&&document["form2"].cb24.checked==false)
       { 
       alert("Please Select Signal");
         return;
       }
      else
       {
       document["form2"].action="alert_process.jsp?";
       return;
 }
 }
</script> 
    </head>
<body>

<%String login = (String)session.getAttribute("loginType"); %>
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
                              <li><a href="#">Alerts Forum</a></li> 
                              <%if(login.equals("general")){ %>
                              <li><a href="${pageContext.request.contextPath}/Forum/forum.jsp">Discussion Forum</a></li>
                              <%} %>
     </ul>
                        </div>
                    </div>
    </li>
     
</ul>

<br/> <br/>
        <TABLE  width="910" align="left" cellpadding="2" cellspacing="2">
<TBODY>
<TR>
<TR>
                    <TH>No.</TH>
                    <TH>Alert Type</TH>
                    <th>Date From</th>    
                    <th>Date To</th>
                      <th>Time</th>
                    <th>Signal_id</th>
                    <th>Issued By</th>
                </TR>
   <%    
        try {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc";
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu");
            stmt=cn.createStatement();
            Date dt=new Date();
            rs=stmt.executeQuery("select * from alerts order by alert_id desc");
            while(rs.next()) {
            z=1;

                code=rs.getString(1); 
                type=rs.getString(27);
                dat=rs.getDate(28);                
                autId=rs.getInt(26);
                exp=rs.getDate(29);
                time=rs.getString(30);
                Calendar cal=Calendar.getInstance();
            cal.setTime(exp);
            cal.add(Calendar.DATE,1);
            java.sql.Date d=new java.sql.Date(cal.getTime().getTime());
               if(d.before(dt)){
                stmt3=cn.prepareStatement("delete from alerts where alert_id='"+code+"'");
                stmt3.executeUpdate();
                }
                else
                {
            	stmt2=cn.prepareStatement("select username from user_incharge where user_incharge_id=?");
                stmt2.setInt(1,autId);
                rs2=stmt2.executeQuery();
                rs2.next();
                stmt1=cn.prepareStatement("select name from signals");
                rs1=stmt1.executeQuery();
                while(rs1.next()){
                if(rs.getString(z+1).equals("Y"))               
                signal+=rs1.getString(1)+", ";
                z++;
                }   
                int len=signal.length();
                String signals=signal.substring(0,len-2);
                     
    %>
     <tr align="left" id="a-table"  >	 
                    <td  height="30" width="5%" align="left"  ><%=i%></td>
                    <td  align="left" width="25%"><%=type%></td>
                    <td  align="left"  width="18%"><%=dat%></td>
                    <td  align="left"  width="18%"><%=exp%></td>
                     <td  align="left"  width="18%"><%=time%></td>
                    <td  align="left"  width="14%"><%=signal%></td>
                    <td  align="left"  width="20%"><%=rs2.getString(1)%></td>

                </tr> 
	
    <%}
        i++;
                }

            }

            catch(Exception e) {
                e.printStackTrace();
            }

    %>    
  
    </TBODY>

</table>

<%if(logintype.equals("incharge")){%>
 <%for(int j=0;j<=i;j++){%><br><br><br><br><%}%>
     <p style="font-family: Calibri; font-size: 20px; text-align: left; font-style: italic; color: black; text-decoration: underline;">Post your alert here:</P>
        <form name="form2" method="post" onsubmit='return validation()'>  
      <TABLE  width="850" align="left" cellspacing="15" bgcolor="white">
                <tbody>
                    <tr>
                        <td>Date From: <SELECT name="date1a">
                            <option value="">Date</option>
                            <%for (int x = 1; x < 32; x++) {%>
                <option value=<%=x%>><%=x%></option>
                <%}%>
            </SELECT>
            <SELECT name="date1b">
                <option value="">Month</option>
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <option value="April">April</option>
                <option value="May">May</option>
                <option value="June">June</option>
                <option value="July">July</option>
                <option value="August">August</option>
                <option value="September">September</option>
                <option value="October">October</option>
                <option value="November">November</option>
                <option value="December">December</option>
            </SELECT>
            <SELECT name="date1c">
                <option value="">Year</option>
                <option value="13">2013</option>
                <option value="14">2014</option>
            </SELECT>
                        </TD>
                        <TD>           
             Alert type <select name="alert">
                <option value="">Select an alert type</option>
                <option value="VIP">VIP</option>
                <option value="Construction">Construction</option>
                <option value="Blockage">Blockage</option>
            </select>
                        </td>
                    </TR>
                    <TR>
                        <TD>Date To: &nbsp&nbsp&nbsp <SELECT name="date2a">
                <option value="">Date</option>
                <%for (int x = 1; x < 32; x++) {%>
                <option value=<%=x%>><%=x%></option>
                <%}%>
            </SELECT>
            <SELECT name="date2b">
                <option value="">Month</option>
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <option value="April">April</option>
                <option value="May">May</option>
                <option value="June">June</option>
                <option value="July">July</option>
                <option value="August">August</option>
                <option value="September">September</option>
                <option value="October">October</option>
                <option value="November">November</option>
                <option value="December">December</option>
            </SELECT>
            <SELECT name="date2c">
                <option value="">Year</option>
                <%for (int x = 2013; x < 2015; x++) {%>
                <option value=<%=x%>><%=x%></option>
                <%}%>
            </SELECT>
                        </td>
                        <TD>           
 Time&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   <input type="text" name="time" size="15">
                        </td>
                    </TR>
                </tbody>
            </TABLE>
            <br/>
            <br/><br/><br/>       
   <p style="text-align: left;  color: black; background: white; width: 830px;">
                &nbsp&nbsp
            Signal Name</P> 
            <% 
        try {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc";
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu");
            
            PreparedStatement st;
            ResultSet r;
            z=1;
            st=cn.prepareStatement("SELECT name from signals");
            r=st.executeQuery();
            
            %>
            <table width="850" cellspacing="10"  bgcolor="white">
                <tbody>
                    <TR>
                        <td>
            <input type="checkbox" name="cb1" size="100" value="1"> 
            <%
            r.next();
                out.print(r.getString(1));
                %>
                        </td>
                        <td>
            <input type="checkbox" name="cb2" size="100" value="2">
            <%
            r.next();
                out.print(r.getString(1));
                %>
                        </TD>
                        <td>
            <input type="checkbox" name="cb3" size="100" value="3">
            <%
            r.next();
                out.print(r.getString(1));
                %>
                        </TD>
                    </TR>
                    <TR>
                        <td>
            <input type="checkbox" name="cb4" size="100" value="4">
            <%
            r.next();
                out.print(r.getString(1));
                %>
                        </td>
                        <td>
            <input type="checkbox" name="cb5" size="100" value="5">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb6" size="100" value="6">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                    </tr>
                    <tr>
            <td>
            <input type="checkbox" name="cb7" size="100" value="7">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb8" size="100" value="8"><%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb9" size="100" value="9">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
            </tr>
                    <tr>
                        <td>
            <input type="checkbox" name="cb10" size="100" value="10">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb11" size="100" value="11">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb12" size="100" value="12">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
            </tr>
                    <tr>
                        <td>
            <input type="checkbox" name="cb13" size="100" value="13">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb14" size="100" value="14">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb15" size="100" value="15">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
            </tr>
                    <tr>
                        <td>
            <input type="checkbox" name="cb16" size="100" value="16">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb17" size="100" value="17">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb18" size="100" value="18">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
            </tr>
                    <tr>
                        <td>
            <input type="checkbox" name="cb19" size="100" value="19">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb20" size="100" value="20">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb21" size="100" value="21">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
            </tr>
                    <tr>
                        <td>
            <input type="checkbox" name="cb22" size="100" value="22">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb23" size="100" value="23">
            <%
            r.next();
                out.print(r.getString(1));
                %>
            </td>
                        <td>
            <input type="checkbox" name="cb24" size="100" value="24">
            <%
            r.next();
                out.print(r.getString(1));
                %>
                <%
                 }
                catch(Exception e){
  }%>
                    </tr>
                </TBODY>
            </TABLE>
                       

            <input type="submit" class="button2" name="Login" value="Submit Alert" >					

        </form>
 </div>
 <div id="fotlinks6">
            <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
        </div>
     
    <%} else{%>  
</div>
<%for(int j=0;j<=i;j++){%><br><br><br><br><%}%>
 <div id="fotlinks6">
            <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved.</div>
        </div>
        <%} %>
</body>
</html>