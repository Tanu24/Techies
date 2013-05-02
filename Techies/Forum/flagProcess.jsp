<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String fby=(String)session.getAttribute("username");
out.print(fby);
String uname=request.getParameter("user");
out.print(uname);
String topicid=request.getParameter("tpcid");
out.print(topicid);
String rid=request.getParameter("repid");
out.print(rid);
int userflag=0;

			Class.forName("com.ibm.db2.jcc.DB2Driver");
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc";
            Connection cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu");
            PreparedStatement stmt1,stmt2,stmt,stmt3,stmt4,stmt5,stmt6,stmt7;
			ResultSet rs1,rs2,rs3,rs5;
            stmt=cn.prepareStatement("select * from reply where reply_id='"+rid+"'");
            //stmt.setInt(1,rid);                     
            stmt7=cn.prepareStatement("select * from general_users where username='"+uname+"'");
            rs3=stmt7.executeQuery();
            rs3.next();
            userflag=rs3.getInt(6);
            
            ResultSet rs=stmt.executeQuery();
            rs.next();
            out.print(rs.getString(7));
            if(!fby.equals(rs.getString(7))&&!fby.equals(rs.getString(8))&&!fby.equals(rs.getString(9))){
            userflag++;
            int count=rs.getInt(6);
            count++;
            if(rs.getString(7).equals(" ")){
            stmt1=cn.prepareStatement("UPDATE reply SET flags=? where reply_id='"+rid+"'");
            stmt2=cn.prepareStatement("UPDATE reply SET name1='"+fby+"' where reply_id='"+rid+"'");
            stmt3=cn.prepareStatement("UPDATE general_users set flags=? where username='"+uname+"'");
            stmt1.setInt(1,count);
           // stmt1.setInt(2,rid);
           // stmt2.setInt(1,rid);
            stmt3.setInt(1,userflag);
            stmt1.executeUpdate();
            stmt2.executeUpdate();
            stmt3.executeUpdate();
            }
            else if(rs.getString(8).equals(" ")&&!rs.getString(7).equals(fby)){
            stmt1=cn.prepareStatement("UPDATE reply SET flags=? where reply_id='"+rid+"'");
            stmt2=cn.prepareStatement("UPDATE reply SET name2='"+fby+"' where reply_id='"+rid+"'");
            stmt3=cn.prepareStatement("UPDATE general_users set flags=? where username='"+uname+"'");
            stmt1.setInt(1,count);
            stmt3.setInt(1,userflag);
            stmt1.executeUpdate();
            stmt2.executeUpdate();
            stmt3.executeUpdate();
            }
            else if(rs.getString(9).equals(" ")&&!rs.getString(8).equals(fby)&&!rs.getString(7).equals(fby)){
            stmt1=cn.prepareStatement("UPDATE reply SET flags=? where reply_id='"+rid+"'");
            stmt2=cn.prepareStatement("UPDATE reply SET name3='"+fby+"' where reply_id='"+rid+"'");
            stmt3=cn.prepareStatement("UPDATE general_users set flags=? where username='"+uname+"'");
            stmt1.setInt(1,count);
            stmt3.setInt(1,userflag);
            stmt1.executeUpdate();
            stmt2.executeUpdate();
            stmt3.executeUpdate();
            }
            stmt4=cn.prepareStatement("select * from reply where reply_id='"+rid+"'");
            ResultSet rs4=stmt4.executeQuery();
            rs4.next();
            if(rs4.getInt(6)==3){          
            stmt5=cn.prepareStatement("delete from reply where reply_id='"+rid+"'");
            //stmt5.setInt(1,rid);
            stmt5.executeUpdate();
            }
            rs5=stmt7.executeQuery();
            rs5.next();
            if(rs5.getInt(6)>=30){
            stmt6=cn.prepareStatement("UPDATE general_users set blocked='Y' where username='"+uname+"'");
            stmt6.executeUpdate();
            }
            }
            response.sendRedirect("forum.jsp");
            %>

</body>
</html>