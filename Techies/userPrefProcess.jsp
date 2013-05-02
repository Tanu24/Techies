<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="was.common.Emergency"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ibm.websphere.management.Session"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Calendar cal=Calendar.getInstance();
int prefroute[]=new int[25],n=0,uid;
int t1,t2,t,time=0,q, speed=40;
String sql="";
String uname=(String)request.getSession().getAttribute("username");
Connection cn;
    PreparedStatement stmt,stmt1;
    ResultSet rs;
String[] pref=new String[25];
for(int y=1;y<25;y++){
if(request.getParameter("cb"+y)==null){
    pref[y]="N";
    }
else{
	prefroute[n]=y;
	n++;
    pref[y]="Y";
    
    }
    }
    try {
    Class.forName("com.ibm.db2.jcc.DB2Driver"); 
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc"; 
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu"); 
            stmt1=cn.prepareStatement("SELECT general_users_id from general_users where username='"+uname+"'");
            rs=stmt1.executeQuery();
            rs.next();
            uid=rs.getInt(1);
    stmt=cn.prepareStatement("UPDATE userpreferences set signal1='"+pref[1]+"',signal2='"+pref[2]+"',signal3='"+pref[3]+"',signal4='"+pref[4]+"',signal5='"+pref[5]+"',signal6='"+pref[6]+"',signal7='"+pref[7]+"',signal8='"+pref[8]+"',signal9='"+pref[9]+"',signal10='"+pref[10]+"',signal11='"+pref[11]+"',signal12='"+pref[12]+"',signal13='"+pref[13]+"',signal14='"+pref[14]+"',signal15='"+pref[15]+"',signal16='"+pref[16]+"',signal17='"+pref[17]+"',signal18='"+pref[18]+"',signal19='"+pref[19]+"',signal20='"+pref[20]+"',signal21='"+pref[21]+"',signal22='"+pref[22]+"',signal23='"+pref[23]+"',signal24='"+pref[24]+"' where general_users_id=?");
    stmt.setInt(1,uid);
    stmt.executeUpdate(); 
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
	DatabaseMetaData meta = cn.getMetaData();
    ResultSet res = meta.getTables(null,"DB2ADMIN", tname, null);
   if(!res.next()) {
	   String sql2="create table "+tname+" like jan1_13";
		String sql1="INSERT into "+tname+" SELECT * FROM MAR1_13";
		Statement st1=cn.createStatement();
		st1.execute(sql2);
		PreparedStatement ps=cn.prepareStatement(sql1);
		ps.executeUpdate();
    }
		  for(int k=1;k<n;k++){
		  if((cal.get(Calendar.HOUR_OF_DAY)>=7)&&(cal.get(Calendar.HOUR_OF_DAY)<9)){
		    sql="SELECT r17_9a,r27_9a,r37_9a,r47_9a FROM "+tname+" WHERE signal_id=?";
		    }
		    if((cal.get(Calendar.HOUR_OF_DAY)>=9)&&(cal.get(Calendar.HOUR_OF_DAY)<11)){
		    sql="SELECT r19_11a,r29_11a,r39_11a,r49_11a FROM "+tname+" WHERE signal_id=?";
		    }
		    if((cal.get(Calendar.HOUR_OF_DAY)>=11)&&(cal.get(Calendar.HOUR_OF_DAY)<13)){
		    sql="SELECT r111_1p,r211_1p,r311_1p,r411_1p FROM "+tname+" WHERE signal_id=?";
		    }
		    if((cal.get(Calendar.HOUR_OF_DAY)>=13)&&(cal.get(Calendar.HOUR_OF_DAY)<15)){
		    sql="SELECT r11_3p,r21_3p,r31_3p,r41_3p FROM "+tname+" WHERE signal_id=?";
		    }
		    if((cal.get(Calendar.HOUR_OF_DAY)>=15)&&(cal.get(Calendar.HOUR_OF_DAY)<17)){
		    sql="SELECT r13_5p,r23_5p,r33_5p,r43_5p FROM "+tname+" WHERE signal_id=?";
		    }
		    if((cal.get(Calendar.HOUR_OF_DAY)>=17)&&(cal.get(Calendar.HOUR_OF_DAY)<19)){
		    sql="SELECT r15_7p,r25_7p,r35_7p,r45_7p FROM "+tname+" WHERE signal_id=?";
		    }
		    if((cal.get(Calendar.HOUR_OF_DAY)>=19)&&(cal.get(Calendar.HOUR_OF_DAY)<21)){
		    sql="SELECT r17_9p,r27_9p,r37_9p,r47_9p FROM "+tname+" WHERE signal_id=?";
		    }
		    if((cal.get(Calendar.HOUR_OF_DAY)>=21)&&(cal.get(Calendar.HOUR_OF_DAY)<=23)){
		    sql="SELECT r19_11p,r29_11p,r39_11p,r49_11p FROM "+tname+" WHERE signal_id=?";
		    }
		    //*****write down all the other cases*****
		    PreparedStatement ps1=cn.prepareStatement(sql);
		  PreparedStatement ps2=cn.prepareStatement(sql);
		  ps1.setInt(1,prefroute[k-1]);
		  ResultSet rs1=ps1.executeQuery();
		  ps2.setInt(1,prefroute[k]);
		  ResultSet rs2=ps2.executeQuery();
		  rs1.next();
		  rs2.next();
		  if(prefroute[k]>prefroute[k-1])
		  {
			if(prefroute[k]-prefroute[k-1]==1)
			{
				t1=rs1.getInt(3);
			    t2=rs2.getInt(1);
			    q=1;
			}   
			else
			{
				t1=rs1.getInt(4);
				t2=rs2.getInt(2);
				q=2;
			}
		  }
		  else{
			  if(prefroute[k-1]-prefroute[k]==1)
			  {
					t1=rs1.getInt(1);
				    t2=rs2.getInt(3);
				    q=3;
			  }  
					else
			  {
					t1=rs1.getInt(2);
					t2=rs2.getInt(4);
					q=4;
			  }  
		  }
		  t=(t1+t2)/2;
		  speed=(60-((t-1)*40)/9)*5/18;
		  Emergency e=new Emergency();
		  int len=e.map[prefroute[k-1]][prefroute[k]];
		  time+=(int)(len/speed);

		  }
		  PreparedStatement p=cn.prepareStatement("UPDATE userpreftime set totaltime=? where general_users_id=?");
		  p.setInt(1,time);
		  p.setInt(2,uid);
		  p.executeUpdate();
		  
    }
    catch(Exception e){
    e.getMessage();
    }
  response.sendRedirect("userPreferences.jsp");
 %>

</body>
</html>