<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<% 
 Connection cn;
 int repid=1;
    PreparedStatement stmt,stmt4,stmt2;
    ResultSet rs1,rs2;
    String ans=request.getParameter("data"),dat="",code="",n=" ";
 String username=(String)request.getSession().getAttribute("username");

%>


<%     
        
try {
            
Class.forName("com.ibm.db2.jcc.DB2Driver"); 
            
String jdbcUri = "jdbc:db2://localhost:50000/tgmc"; 
            
cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu"); 

code=request.getQueryString();
stmt4=cn.prepareStatement("select * from general_users where username='"+username+"'");
out.println(n);
stmt2=cn.prepareStatement("select * from reply");
rs2=stmt2.executeQuery();
while(rs2.next())
repid=rs2.getInt(2);
repid++;
out.print(repid);
rs1=stmt4.executeQuery();
rs1.next();
Date dt=new Date();
dat=dt.toString();
if(rs1.getString(4).equals("N")){
stmt=cn.prepareStatement("INSERT into reply values('"+code+"',?,?,'"+ans+"','"+dat+"',0,'"+n+"','"+n+"','"+n+"')");
out.print("repid"+repid);
out.print(dat);
out.print("code"+code);
out.print("userid"+rs1.getInt(1));
stmt.setInt(1,repid);
stmt.setInt(2,rs1.getInt(1));
stmt.executeUpdate();
}
else{
out.print("Sorry, you have been blocked");
}
        
cn.close();
            
response.sendRedirect("forum_ans.jsp?"+code);
            
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