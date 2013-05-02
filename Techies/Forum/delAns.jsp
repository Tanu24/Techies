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
Connection cn=null;
String ab=request.getParameter("edited");
String tid=request.getParameter("topicid");
String rid=request.getParameter("replyid");
//String user=(String)session.getAttribute("username");
try {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc";
            cn= DriverManager.getConnection(jdbcUri, "db2admin", "tanu");
            PreparedStatement st;
            st=cn.prepareStatement("delete from reply where topic_id='"+tid+"' and reply_id='"+rid+"'");
            
            st.execute();
            }
            catch(Exception e){
            e.getMessage();
            }
response.sendRedirect("forum_ans.jsp?"+tid);
 %>

</body>
</html>