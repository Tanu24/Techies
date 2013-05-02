<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="was.common.Validation" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<% 
int j=0;
Validation dbo=new Validation();
 if ((request.getParameter("user") == null) || (request.getParameter("user").length() == 0)) {
		 out.print("Username not valid");
		 j++;
		}
	if ((request.getParameter("Email") == null) || (request.getParameter("Email").length() == 0)) {
		   out.print("Email not valid");
		   j++;
		}
	if(!dbo.emailvalidate(request.getParameter("Email")))
	{
		out.print("Email not valid");
		j++;
	}
	
	if ((request.getParameter("address") == null) || (request.getParameter("address").length() == 0)) {
		 out.print("Address not valid");
		 j++;  
		}
	
	if ((request.getParameter("city") == null) || (request.getParameter("city").length() == 0)) {
		   out.print("City not valid");
		   j++;   
		}
		if ((request.getParameter("state") == null) || (request.getParameter("state").length() == 0)) {
		   out.print("State not valid"); 
		   j++;  
		}
	if ((request.getParameter("country") == null) || (request.getParameter("country").length() == 0)) {
		   out.print("Country not valid"); 
		   j++;  
		}
	if (!((request.getParameter("code").length()== 6) || (request.getParameter("code").length() == 0))||dbo.validate(request.getParameter("code"))==false){
		   out.print("Postal Code not valid"); 
		   j++;  
		}
	if (!((request.getParameter("contact").length()== 10) || (request.getParameter("contact").length() == 0))||dbo.validate(request.getParameter("contact"))==false){
		 out.print("Conatct number not valid");
		 j++;  
		}
		
if(j==0){
ResultSet res=null;
	Statement st=null;
	PreparedStatement st1=null;
	PreparedStatement st2=null;
	String sql=null,sql1=null,sql2=null;
    Connection con;
    String name=(String)request.getSession().getAttribute("username");
    String logintype=(String)request.getSession().getAttribute("loginType"); 
     
        try {
            Class.forName("com.ibm.db2.jcc.DB2Driver"); 
            String jdbcUri = "jdbc:db2://localhost:50000/tgmc"; 
            con= DriverManager.getConnection(jdbcUri, "db2admin", "tanu"); 
            	if(logintype.equals("general"))
		{sql="UPDATE general_users SET username='"+request.getParameter("user")+"' WHERE general_users_id=?";
		sql1="SELECT general_users_id FROM general_users WHERE username='"+name+"'";
		 sql2="UPDATE pdata SET birthdate='"+request.getParameter("dob")+"',email_id='"+request.getParameter("Email")+"',address='"+request.getParameter("address")+"',postal_code='"+request.getParameter("code")+"',contact_number='"+request.getParameter("contact")+"',city='"+request.getParameter("city")+"',state='"+request.getParameter("state")+"',country='"+request.getParameter("country")+"' WHERE general_users_id=?";
		}
	else
	{sql="UPDATE user_incharge SET username='"+request.getParameter("user")+"' WHERE user_incharge_id=?";
		sql1="SELECT user_incharge_id FROM user_incharge WHERE username='"+name+"'";
		 sql2="UPDATE pdata SET birthdate='"+request.getParameter("dob")+"',email_id='"+request.getParameter("Email")+"',address='"+request.getParameter("address")+"',postal_code='"+request.getParameter("code")+"',contact_number='"+request.getParameter("contact")+"',city='"+request.getParameter("city")+"',state='"+request.getParameter("state")+"',country='"+request.getParameter("country")+"' WHERE user_incharge_id=?";
		}
		
	int i=0;
        st=con.createStatement();
        res=st.executeQuery(sql1);
        res.next();
        	i=res.getInt(1);	
        
        st1=con.prepareStatement(sql);
        st1.setInt(1, i);
		st1.executeUpdate();
		st2=con.prepareStatement(sql2);
		st2.setInt(1, i);
		st2.executeUpdate();
            out.print("dfdf");
            con.close();
            response.sendRedirect("changeProfile.jsp");
             }

        catch(Exception e) {
            e.printStackTrace();
        }
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
