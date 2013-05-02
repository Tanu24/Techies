package was.common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.TimeZone;

public class TimerAlgorithm{
  public static void main(String[] args){  
		Timer oj=new Timer();
		Thread t=new Thread(oj);
		t.start();
		}
		
}
class Timer implements Runnable{

	 public	Connection con=null;
	 String driverClass = "com.ibm.db2.jcc.DB2Driver";
	 String dbUrl = "jdbc:db2://localhost:50000/tgmc";
	 String dbUser = "db2admin";
		String dbPassword = "tanu";
   	 public int z=0;
   	 public int c=0;
    public void run() {
    	Calendar cal=Calendar.getInstance();
    	TimeZone tz=TimeZone.getTimeZone("IST");
    	cal.setTimeZone(tz);
    	//System.out.print(cal.get(Calendar.HOUR_OF_DAY));
		    	 while((cal.get(Calendar.HOUR_OF_DAY)>=7)&&(cal.get(Calendar.HOUR_OF_DAY)<=23)){ 
		    	try {
		    	cal=Calendar.getInstance();
		    	Class.forName(driverClass); 
		    	con = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		    	int hr=cal.get(Calendar.HOUR_OF_DAY);
		    	int min=cal.get(Calendar.MINUTE); 
		    	int sec=cal.get(Calendar.SECOND);
		    	hr=hr-7;
		    	int time=hr*3600+min*60+sec;
		    	int i=0;
				int time1=0,time2;
				for(int j=1;j<25;j++)
				{
				PreparedStatement stmt=con.prepareStatement("SELECT * FROM timer WHERE signal_id=?");
		    	stmt.setInt(1, j);
		    	ResultSet rs=stmt.executeQuery();
		    	rs.next();
		    	time2=time%((int)(rs.getDouble(2)+rs.getDouble(2)+rs.getDouble(2)+rs.getDouble(2)));
		    	if(time2<(int)(rs.getDouble(2)))
		    	{ 
		    		i=1;
		    		time1=(int)(rs.getDouble(2))-time2;
		    	}	
		    	if(time2>=(int)(rs.getDouble(2))&&time2<(int)(rs.getDouble(2))+(int)(rs.getDouble(3)))
		    	{ 
		    		i=2;
		    		time1=(int)(rs.getDouble(2))+(int)(rs.getDouble(3))-time2;
		    		
		    	}
		    	if(time2>=((int)(rs.getDouble(2))+(int)(rs.getDouble(3)))&&time2<(int)(rs.getDouble(2))+(int)(rs.getDouble(3))+(int)(rs.getDouble(4)))
		    	{ 
		    		i=3;
		    		time1=(int)(rs.getDouble(2))+(int)(rs.getDouble(3))+(int)(rs.getDouble(4))-time2;
		    		
		    	}  
		    	if(time2>=(int)(rs.getDouble(2))+(int)(rs.getDouble(3))+(int)(rs.getDouble(4))&&time2<=(int)(rs.getDouble(2))+(int)(rs.getDouble(3))+(int)(rs.getDouble(4))+(int)(rs.getDouble(5)))
		    	{ 
		    		i=4;
		    		time1=(int)(rs.getDouble(2))+(int)(rs.getDouble(3))+(int)(rs.getDouble(4))+(int)(rs.getDouble(5))-time2;
		    	}
		    	
		    	if(rs.getInt(10)==0)
		    	{PreparedStatement st=con.prepareStatement("UPDATE timer SET active=?,time_value=? WHERE signal_id=?");
		    	st.setInt(1, i);
		    	st.setInt(2, time1);
		    	st.setInt(3, j);
		    	st.executeUpdate();    	
		    	}
		    	}
		    	}
		    	catch(Exception e) { 
		    	      System.err.print("Exception: "); 
		    	      System.err.println(e.getMessage()); 
		    	  } 
		    	 }
		    	
		    	}
}
