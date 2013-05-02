<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.sql.*"%>
  <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%Connection con = null;
	String driverClass = "com.ibm.db2.jcc.DB2Driver";
	String dbUrl = "jdbc:db2://localhost:50000/tgmc";
	String dbUser = "db2admin";
	String dbPassword = "tanu";
	ResultSet rs=null;
	int[] col=new int[25];
	for(int u=1;u<25;u++)
	col[u]=0;
for(int i=1;i<25;i++)
{
try{
            Class.forName(driverClass);
            con = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
            
            Calendar cal=Calendar.getInstance();
        	TimeZone tz=TimeZone.getTimeZone("IST");
        	cal.setTimeZone(tz);
        	String month="";
        	if(cal.get(Calendar.MONTH)==0){
        		month="jan";
        	}
        	else if(cal.get(Calendar.MONTH)==1){
        		month="feb";
        	}
        	else if(cal.get(Calendar.MONTH)==2){
        		month="mar";
        	}
        	else if(cal.get(Calendar.MONTH)==3){
        		month="apr";
        	}
        	else if(cal.get(Calendar.MONTH)==4){
        		month="may";
        	}
        	else if(cal.get(Calendar.MONTH)==5){
        		month="jun";
        	}        	
        	else if(cal.get(Calendar.MONTH)==6){
        		month="jul";
        	}
        	else if(cal.get(Calendar.MONTH)==7){
        		month="aug";
        	}
        	else if(cal.get(Calendar.MONTH)==8){
        		month="sep";
        	}
        	else if(cal.get(Calendar.MONTH)==9){
        		month="oct";
        	}
        	else if(cal.get(Calendar.MONTH)==10){
        		month="nov";
        	}
        	else if(cal.get(Calendar.MONTH)==11){
        		month="dec";
        	}
        	String tname=month+cal.get(Calendar.DAY_OF_MONTH)+"_"+"13";
        	tname=tname.toUpperCase();
	DatabaseMetaData meta = con.getMetaData();
    ResultSet res = meta.getTables(null,"DB2ADMIN", tname, null);
   if(!res.next()) {
	   String sql="create table "+tname+" like jan1_13";
		String sql1="INSERT into "+tname+" SELECT * FROM MAR1_13";
		Statement st1=con.createStatement();
		st1.execute(sql);
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.executeUpdate();
    }
        	int arr[]=new int[4];
        	int tvalue=0;
  String sql1="select * from "+tname+" where signal_id=?";
        	PreparedStatement ps=con.prepareStatement(sql1);
        	ps.setInt(1,i);
        	if(cal.get(Calendar.HOUR_OF_DAY)>=7&&cal.get(Calendar.HOUR_OF_DAY)<9) tvalue=1;
        	if(cal.get(Calendar.HOUR_OF_DAY)>=9&&cal.get(Calendar.HOUR_OF_DAY)<11) tvalue=2;
        	if(cal.get(Calendar.HOUR_OF_DAY)>=11&&cal.get(Calendar.HOUR_OF_DAY)<13) tvalue=3;
        	if(cal.get(Calendar.HOUR_OF_DAY)>=13&&cal.get(Calendar.HOUR_OF_DAY)<15) tvalue=4;
        	if(cal.get(Calendar.HOUR_OF_DAY)>=15&&cal.get(Calendar.HOUR_OF_DAY)<17) tvalue=5;
        	if(cal.get(Calendar.HOUR_OF_DAY)>=17&&cal.get(Calendar.HOUR_OF_DAY)<19) tvalue=6;
        	if(cal.get(Calendar.HOUR_OF_DAY)>=19&&cal.get(Calendar.HOUR_OF_DAY)<21) tvalue=7;
        	if(cal.get(Calendar.HOUR_OF_DAY)>=21&&cal.get(Calendar.HOUR_OF_DAY)<23) tvalue=8;
        	arr[0]=4*(tvalue-1)+2;
        	arr[1]=4*(tvalue-1)+3;
        	arr[2]=4*(tvalue-1)+4;
        	arr[3]=4*(tvalue-1)+5;
        	rs=ps.executeQuery();
        	rs.next();
       if((int)((rs.getInt(arr[0])+rs.getInt(arr[1])+rs.getInt(arr[2])+rs.getInt(arr[3]))/4)>6)
           col[i]=1;
            else if(((int)(rs.getInt(arr[0])+rs.getInt(arr[1])+rs.getInt(arr[2])+rs.getInt(arr[3]))/4)<4)
            	col[i]=2;
            else col[i]=3;
	 }
	 catch(Exception e)
	 {}}
	%>

<html>
<head>
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/default.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css" media="screen" />
</head>
<body>
<%String user=(String)session.getAttribute("username");
String login=(String)session.getAttribute("loginType"); %>
       <div id="title">
            <div id="title1">Swift<span>Citi</span></DIV>
            <div id="title2">A smarter way to a swifter city</div>
        </div>
        <div id="right-links">
        <br/>
            <table cellpadding="0px"><tr><td>
                <li class="user-right">
                    <a href="#"  class="drop">
                       <%=user %> 
                    </a>
                    <div class="dropdown_1column">
                        <div class="col_1">
                            <ul class="simple">
                                <a href="changeProfile.jsp">Profile</a>
                                <%if(login.equals("general")){ %>
                                <a href="${pageContext.request.contextPath}/userPreferences.jsp">Set/Edit Preferences</a>
                                <%} %>
                                <a href="logout.jsp">Logout</a>
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
                        
        <div id="main2">
            <ul id="menu2">
                <li class="menu_right"><a href="#" class="drop">About</a>
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
                                <li><a href="map.jsp">Traffic Live!</a></li>            
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
          
<br/><br/><br/>

<applet width="95%" hspace="25" height="700" Name = "Map" ALIGN = "middle"
CODE = "was.common.map"
CODEBASE = "${pageContext.request.contextPath}/applet">

<param name="col1" value="<%=col[1] %>">
<param name="col2" value="<%=col[2] %>">
<param name="col3" value="<%=col[3] %>">
<param name="col4" value="<%=col[4] %>">
<param name="col5" value="<%=col[5] %>">
<param name="col6" value="<%=col[6] %>">
<param name="col7" value="<%=col[7] %>">
<param name="col8" value="<%=col[8] %>">
<param name="col9" value="<%=col[9] %>">
<param name="col10" value="<%=col[10] %>">
<param name="col11" value="<%=col[11] %>">
<param name="col12" value="<%=col[12] %>">
<param name="col13" value="<%=col[13] %>">
<param name="col14" value="<%=col[14] %>">
<param name="col15" value="<%=col[15] %>">
<param name="col16" value="<%=col[16] %>">
<param name="col17" value="<%=col[17] %>">
<param name="col18" value="<%=col[18] %>">
<param name="col19" value="<%=col[19] %>">
<param name="col20" value="<%=col[20] %>">
<param name="col21" value="<%=col[21] %>">
<param name="col22" value="<%=col[22] %>">
<param name="col23" value="<%=col[23] %>">
<param name="col24" value="<%=col[24] %>">
</applet>
<div align="left">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspMagenta represents low traffic<br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspBlack represents normal traffic<br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspBlue represents high traffic<br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSky Blue represents rest phase</div>
<div id="fotlinks6">
                <div align="center"><br />Copyright (c) 2013 IIT(BHU) Varanasi. All rights reserved. </div>
            </div>
</body>
</html>