<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="javax.servlet.*"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<% 

    Connection cn;
    PreparedStatement stmt,stmt1;
    ResultSet rs,rs1;
    String que=request.getParameter("data"),dat="",code="";
    String username=(String)request.getSession().getAttribute("username");
    code=request.getQueryString();
    out.print(code);
        try {
            Class.forName("com.ibm.db2.jcc.DB2Driver"); 
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc"; 
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu"); 
            stmt1=cn.prepareStatement("select * from general_users where username='"+username+"'");
            rs1=stmt1.executeQuery();
            rs1.next();
            int id1=rs1.getInt(1);
            java.sql.Date dt=new java.sql.Date(new java.util.Date().getTime());
            dat=dt.toString();
            Calendar cal=Calendar.getInstance();
            cal.setTime(dt);
            cal.add(Calendar.DATE,2);
            java.sql.Date dat1=new java.sql.Date(cal.getTime().getTime());
            
            out.print(dat1);
            if(rs1.getString(4).equals("N")){out.print("jjj");
            stmt=cn.prepareStatement("INSERT INTO topic VALUES('"+code+"',?,'"+que+"','"+dat+"',?,0,' ',' ',' ')");
            stmt.setInt(1,id1);
            stmt.setDate(2,dat1);
            stmt.executeUpdate();
            }
            else out.print("Sorry you have been flagged.");
            cn.close();
            response.sendRedirect("forum.jsp");
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
