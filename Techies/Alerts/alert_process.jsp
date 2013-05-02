<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="javax.servlet.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<% 

    Connection cn;
    PreparedStatement stmt,stmt1;
    ResultSet rs,rs1;
    String warning[]=new String[25];

    String d1,d2,d1a,d1b,d1c,d2a,d2b,d2c,type,time;
    type=request.getParameter("alert");
    d1a=request.getParameter("date1a");
    d1b=request.getParameter("date1b");
    d1c=request.getParameter("date1c");
    time=request.getParameter("time");
    if(d1a.length()==1)
    d1a="0"+d1a;
    d1=d1a+"-"+d1b+"-"+d1c;
    d2a=request.getParameter("date2a");
    d2b=request.getParameter("date2b");
    d2c=request.getParameter("date2c");
    if(d2a.length()==1)
    d2a="0"+d2a;
    d2=d2a+"-"+d2b+"-"+d2c;
   SimpleDateFormat df ;
   Date conD1=new Date();
   Date conD2=new Date();
    try {
  
 df = new SimpleDateFormat("dd-MMM-yy");
  conD1 = (Date)df.parse(d1);  
  conD2 = (Date)df.parse(d2);  
  } catch (Exception e)
  {System.out.println("Exception :"+e);  }  
 
    java.sql.Date dnew1=new java.sql.Date(conD1.getTime());
    java.sql.Date dnew2=new java.sql.Date(conD2.getTime());    
    for(int y=1;y<25;y++){
    if(request.getParameter("cb"+""+y)==null){
    warning[y]="N";
    }
    else
    warning[y]="Y";
    }
    int sno=0;
    String username=(String)request.getSession().getAttribute("username");
    String logintype=(String)request.getSession().getAttribute("loginType");
        try {
       if(logintype.equals("general")){
            response.sendRedirect("alerts.jsp");
            out.print("You can't issue an alert");
            return;
            }
            Class.forName("com.ibm.db2.jcc.DB2Driver"); 
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc"; 
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu"); 
            Statement st=cn.createStatement();
            stmt1=cn.prepareStatement("select user_incharge_id from user_incharge where username='"+username+"'");
            rs1=stmt1.executeQuery();
            rs=st.executeQuery("SELECT alert_id from alerts");
            while(rs.next()){sno=rs.getInt(1);}
            sno+=1;
            rs1.next();            
            int id1=rs1.getInt(1);
            stmt=cn.prepareStatement("INSERT into alerts values(?,'"+warning[1]+"','"+warning[2]+"','"+warning[3]+"','"+warning[4]+"','"+warning[5]+"','"+warning[6]+"','"+warning[7]+"','"+warning[8]+"','"+warning[9]+"','"+warning[10]+"','"+warning[11]+"','"+warning[12]+"','"+warning[13]+"','"+warning[14]+"','"+warning[15]+"','"+warning[16]+"','"+warning[17]+"','"+warning[18]+"','"+warning[19]+"','"+warning[20]+"','"+warning[21]+"','"+warning[22]+"','"+warning[23]+"','"+warning[24]+"',?,'"+type+"',?,?,'"+time+"')");
            stmt.setInt(1,sno);
            stmt.setInt(2,id1);
            stmt.setDate(3,dnew1);
            stmt.setDate(4,dnew2);
            stmt.executeUpdate();
            cn.close();
            response.sendRedirect("alerts.jsp");
             }

        catch(Exception e) {
            e.printStackTrace();
        }




%>

<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
Hi process is going on.... 
</body>
</html>
