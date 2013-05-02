package was.common;

import java.sql.*; 
import java.util.Calendar;
import java.util.Random;
import java.util.TimeZone;

public class TrafficAlgorithm {
    public static void main(String[] args){  
Traffic oj=new Traffic();
Thread t[]=new Thread[24];
for(int j=0;j<24;j++){
  t[j]=new Thread(oj);
	t[j].setName("t"+j);
    t[j].start();
}
    }
}

class Traffic implements Runnable
{ 

Calendar cal=Calendar.getInstance();
TimeZone tz=TimeZone.getTimeZone("IST");
Random a = new Random();	
public static String tname;
//min+rand(max)%(max-min+1)
@SuppressWarnings("static-access")
Traffic(){cal.setTimeZone(tz);
	String driverClass = "com.ibm.db2.jcc.DB2Driver";
	 String dbUrl = "jdbc:db2://localhost:50000/tgmc";
	 String dbUser = "db2admin";
		String dbPassword = "tanu"; 
    Connection con =  null;
    try{
    	Class.forName(driverClass); 
    	con = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
    Statement st1=con.createStatement();
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
	//tname=month+cal.get(Calendar.DAY_OF_MONTH)+"_"+"13";
	//tname=tname.toUpperCase();
	tname="MARCH31_13";
	DatabaseMetaData meta = con.getMetaData();
    ResultSet res = meta.getTables(null,"DB2ADMIN", tname, null);
   if(!res.next()) {
	   String sql="create table "+tname+" like jan1_13";
		String sql1="INSERT into "+tname+" SELECT * FROM MAR1_13";
		st1.execute(sql);
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.executeUpdate();
    }
    }
    catch (Exception e) {
		e.getMessage();
	}
	
}
@SuppressWarnings("static-access")
public void test(int j){
	String driverClass = "com.ibm.db2.jcc.DB2Driver";
	 String dbUrl = "jdbc:db2://localhost:50000/tgmc";
	 String dbUser = "db2admin";
		String dbPassword = "tanu";
    Connection con = null;
    try{
    	Class.forName(driverClass); 
    	con = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
    int[] intensity=new int[4];
    for(int i=0;i<4;i++)
    	intensity[i]=999;
    float sum;
    double t1,t2,t3,t4,t;
    if((cal.get(Calendar.HOUR_OF_DAY)>=7)&&(cal.get(Calendar.HOUR_OF_DAY)<9))
    {
    	System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    PreparedStatement ps2=con.prepareStatement("UPDATE timer SET time1=20,time2=20,time3=20,time4=20 WHERE signal_id=?");
    ps2.setInt(1, j);
    ps2.executeUpdate(); 
    }
    
    if((cal.get(Calendar.HOUR_OF_DAY)>=9)&&(cal.get(Calendar.HOUR_OF_DAY)<11)){
    	System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    	sum=0;
    	for(int i=0;i<4;i++){
    		intensity[i]=-1+a.nextInt(2);
    		sum+=intensity[i];
    	}
    	PreparedStatement ps1=con.prepareStatement("SELECT r19_11a,r29_11a,r39_11a,r49_11a from "+tname+" WHERE signal_id=?");
    	ps1.setInt(1,j);
    	ResultSet rs=ps1.executeQuery();
    	rs.next();
    	sum+=rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getInt(4);
    PreparedStatement ps=con.prepareStatement("UPDATE "+tname+" SET r19_11a=?,r29_11a=?,r39_11a=?,r49_11a=? WHERE signal_id=?");
    ps.setInt(1, rs.getInt(1)+intensity[0]);
    ps.setInt(2,rs.getInt(2)+intensity[1]);
    ps.setInt(3,rs.getInt(3)+ intensity[2]);
    ps.setInt(4,rs.getInt(4)+intensity[3]);
    ps.setInt(5, j);
    ps.executeUpdate(); 
    String str="UPDATE timer SET time1=?,time2=?,time3=?,time4=? WHERE signal_id=?";
    PreparedStatement ps2=con.prepareStatement(str);
    t=(3.5+((sum-12)*2)/12)*60;
    t1=((rs.getInt(1)+intensity[0])/sum)*t;
    t2=((rs.getInt(2)+intensity[1])/sum)*t;
    t3=(((rs.getInt(3)+intensity[2]))/sum)*t;
    t4=(((rs.getInt(4)+intensity[3]))/sum)*t;
    ps2.setDouble(1,t1);
    ps2.setDouble(2,t2);
    ps2.setDouble(3,t3);
    ps2.setDouble(4,t4);
    ps2.setInt(5,j);
    ps2.executeUpdate(); 
    int x=(int)(t*1000);
    try{
    	Thread.currentThread().sleep(x);
    	}
    	catch(InterruptedException ex){System.out.println("Interripted Exception");
    	}
    }
    
    if((cal.get(Calendar.HOUR_OF_DAY)>=11)&&(cal.get(Calendar.HOUR_OF_DAY)<13)){
    	System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    	sum=0;
    	for(int i=0;i<4;i++){
    		intensity[i]=-1+a.nextInt(2);
    		sum+=intensity[i];
    	}
    	PreparedStatement ps1=con.prepareStatement("SELECT r111_1p,r211_1p,r311_1p,r411_1p from "+tname+" WHERE signal_id=?");
    	ps1.setInt(1,j);
    	ResultSet rs=ps1.executeQuery();
    	rs.next();
    	sum+=rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getInt(4);	
    PreparedStatement ps=con.prepareStatement("UPDATE "+tname+" SET r111_1p=?,r211_1p=?,r311_1p=?,r411_1p=? WHERE signal_id=?");
    ps.setInt(1,rs.getInt(1)+ intensity[0]);
    ps.setInt(2, rs.getInt(2)+intensity[1]);
    ps.setInt(3,rs.getInt(3)+ intensity[2]);
    ps.setInt(4, rs.getInt(4)+intensity[3]);
    ps.setInt(5, j);
    ps.executeUpdate(); 
    String str="UPDATE timer SET time1=?,time2=?,time3=?,time4=? WHERE signal_id=?";
    PreparedStatement ps2=con.prepareStatement(str);
    t=(2.5+((sum-12)*1)/12)*60;
    t1=((rs.getInt(1)+ intensity[0])/sum)*t;
    t2=((rs.getInt(2)+ intensity[1])/sum)*t;
    t3=((rs.getInt(3)+ intensity[2])/sum)*t;
    t4=((rs.getInt(4)+ intensity[3])/sum)*t;
    ps2.setDouble(1,t1);
    ps2.setDouble(2,t2);
    ps2.setDouble(3,t3);
    ps2.setDouble(4,t4);
    ps2.setInt(5,j);
    ps2.executeUpdate(); 
    int x=(int)(t*1000);
    try{
    	Thread.currentThread().sleep(x);
    	}
    	catch(InterruptedException ex){System.out.println("Interripted Exception");
    	}
    }
    
    if((cal.get(Calendar.HOUR_OF_DAY)>=13)&&(cal.get(Calendar.HOUR_OF_DAY)<15)){
    	System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    	sum=0;
    	for(int i=0;i<4;i++){
    		intensity[i]=-1+a.nextInt(2);
    		sum+=intensity[i];
    	}
    	PreparedStatement ps1=con.prepareStatement("SELECT r11_3p,r21_3p,r31_3p,r41_3p from "+tname+" WHERE signal_id=?");
    	ps1.setInt(1,j);
    	ResultSet rs=ps1.executeQuery();
    	rs.next();
    	sum+=rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getInt(4);
    PreparedStatement ps=con.prepareStatement("UPDATE "+tname+" SET r11_3p=?,r21_3p=?,r31_3p=?,r41_3p=? WHERE signal_id=?");
    ps.setInt(1, rs.getInt(1)+intensity[0]);
    ps.setInt(2, rs.getInt(2)+intensity[1]);
    ps.setInt(3, rs.getInt(3)+intensity[2]);
    ps.setInt(4, rs.getInt(4)+intensity[3]);
    ps.setInt(5, j);
    ps.executeUpdate(); 
    String str="UPDATE timer SET time1=?,time2=?,time3=?,time4=? WHERE signal_id=?";
    PreparedStatement ps2=con.prepareStatement(str);
    t=(2.5+((sum-12)*1)/12)*60;
    t1=((rs.getInt(1)+intensity[0])/sum)*t;
    t2=((rs.getInt(2)+intensity[1])/sum)*t;
    t3=((rs.getInt(3)+intensity[2])/sum)*t;
    t4=((rs.getInt(4)+intensity[3])/sum)*t;
    ps2.setDouble(1,t1);
    ps2.setDouble(2,t2);
    ps2.setDouble(3,t3);
    ps2.setDouble(4,t4);
    ps2.setInt(5,j);
    ps2.executeUpdate();
    int x=(int)(t*1000);
    try{
    	Thread.currentThread().sleep(x);
    	}
    	catch(InterruptedException ex){System.out.println("Interripted Exception");
    	}
    }
    
    if((cal.get(Calendar.HOUR_OF_DAY)>=15)&&(cal.get(Calendar.HOUR_OF_DAY)<17)){
    	System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    	sum=0;
    	for(int i=0;i<4;i++){
    		intensity[i]=-1+a.nextInt(2);
    		sum+=intensity[i];
    	}
    	PreparedStatement ps1=con.prepareStatement("SELECT r13_5p,r23_5p,r33_5p,r43_5p from "+tname+" WHERE signal_id=?");
    	ps1.setInt(1,j);
    	ResultSet rs=ps1.executeQuery();
    	rs.next();
    	sum+=rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getInt(4);
    PreparedStatement ps=con.prepareStatement("UPDATE "+tname+" SET r13_5p=?,r23_5p=?,r33_5p=?,r43_5p=? WHERE signal_id=?");
    ps.setInt(1, rs.getInt(1)+intensity[0]);
    ps.setInt(2, rs.getInt(2)+intensity[1]);
    ps.setInt(3, rs.getInt(3)+ intensity[2]);
    ps.setInt(4, rs.getInt(4)+intensity[3]);
    ps.setInt(5, j);
    ps.executeUpdate(); 
    String str="UPDATE timer SET time1=?,time2=?,time3=?,time4=? WHERE signal_id=?";
    PreparedStatement ps2=con.prepareStatement(str);
    t=(2.5+((sum-12)*1)/12)*60;
    t1=((rs.getInt(1)+intensity[0])/sum)*t;
    t2=((rs.getInt(2)+intensity[1])/sum)*t;
    t3=((rs.getInt(3)+intensity[2])/sum)*t;
    t4=((rs.getInt(4)+intensity[3])/sum)*t;
    ps2.setDouble(1,t1);
    ps2.setDouble(2,t2);
    ps2.setDouble(3,t3);
    ps2.setDouble(4,t4);
    ps2.setInt(5,j);
    ps2.executeUpdate();
    int x=(int)(t*1000);
    try{
    	Thread.currentThread().sleep(x);
    	}
    	catch(InterruptedException ex){System.out.println("Interripted Exception");
    	}
    }

    if((cal.get(Calendar.HOUR_OF_DAY)>=17)&&(cal.get(Calendar.HOUR_OF_DAY)<19)){
    	System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    	sum=0;
    	for(int i=0;i<4;i++){
    		intensity[i]=-1+a.nextInt(2);
    		sum+=intensity[i];
    	}
    	PreparedStatement ps1=con.prepareStatement("SELECT r15_7p,r25_7p,r35_7p,r45_7p from "+tname+" WHERE signal_id=?");
    	ps1.setInt(1,j);
    	ResultSet rs=ps1.executeQuery();
    	rs.next();
    	sum+=rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getInt(4);
    PreparedStatement ps=con.prepareStatement("UPDATE "+tname+" SET r15_7p=?,r25_7p=?,r35_7p=?,r45_7p=? WHERE signal_id=?");
    ps.setInt(1,rs.getInt(1)+ intensity[0]);
    ps.setInt(2,rs.getInt(2)+ intensity[1]);
    ps.setInt(3,rs.getInt(3)+ intensity[2]);
    ps.setInt(4,rs.getInt(4)+ intensity[3]);
    ps.setInt(5, j);
    ps.executeUpdate(); 
    String str="UPDATE timer SET time1=?,time2=?,time3=?,time4=? WHERE signal_id=?";
    PreparedStatement ps2=con.prepareStatement(str);
    t=(3.5+((sum-12)*2)/12)*60;
    t1=((rs.getInt(1)+ intensity[0])/sum)*t;
    t2=((rs.getInt(2)+ intensity[1])/sum)*t;
    t3=((rs.getInt(3)+ intensity[2])/sum)*t;
    t4=((rs.getInt(4)+ intensity[3])/sum)*t;
    ps2.setDouble(1,t1);
    ps2.setDouble(2,t2);
    ps2.setDouble(3,t3);
    ps2.setDouble(4,t4);
    ps2.setInt(5,j);
    ps2.executeUpdate(); 
    int x=(int)(t*1000);
    try{
    	Thread.currentThread().sleep(x);
    	}
    	catch(InterruptedException ex){System.out.println("Interripted Exception");
    	}
    }
    
    if((cal.get(Calendar.HOUR_OF_DAY)>=19)&&(cal.get(Calendar.HOUR_OF_DAY)<21)){
    	System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    	sum=0;
    	for(int i=0;i<4;i++){
    		intensity[i]=-1+a.nextInt(2);
    		sum+=intensity[i];
    	}
    	PreparedStatement ps1=con.prepareStatement("SELECT r17_9p,r27_9p,r37_9p,r47_9p from "+tname+" WHERE signal_id=?");
    	ps1.setInt(1,j);
    	ResultSet rs=ps1.executeQuery();
    	rs.next();
    	sum+=rs.getInt(1)+rs.getInt(2)+rs.getInt(3)+rs.getInt(4);
    PreparedStatement ps=con.prepareStatement("UPDATE "+tname+" SET r17_9p=?,r27_9p=?,r37_9p=?,r47_9p=? WHERE signal_id=?");
    ps.setInt(1,rs.getInt(1)+ intensity[0]);
    ps.setInt(2,rs.getInt(2)+ intensity[1]);
    ps.setInt(3,rs.getInt(3)+ intensity[2]);
    ps.setInt(4, rs.getInt(4)+intensity[3]);
    ps.setInt(5, j);
    ps.executeUpdate(); 
    String str="UPDATE timer SET time1=?,time2=?,time3=?,time4=? WHERE signal_id=?";
    PreparedStatement ps2=con.prepareStatement(str);
    t=(2.5+((sum-12)*1)/12)*60;
    t1=((rs.getInt(1)+ intensity[0])/sum)*t;
    t2=((rs.getInt(2)+ intensity[1])/sum)*t;
    t3=((rs.getInt(3)+ intensity[2])/sum)*t;
    t4=((rs.getInt(4)+ intensity[3])/sum)*t;
    ps2.setDouble(1,t1);
    ps2.setDouble(2,t2);
    ps2.setDouble(3,t3);
    ps2.setDouble(4,t4);
    ps2.setInt(5,j);
    ps2.executeUpdate(); 
    int x=(int)(t*1000);
    try{
    	Thread.currentThread().sleep(x);
    	}
    	catch(InterruptedException ex){System.out.println("Interripted Exception");
    	}
    }

    if((cal.get(Calendar.HOUR_OF_DAY)>=21)&&(cal.get(Calendar.HOUR_OF_DAY)<23))
    {System.out.print(cal.get(Calendar.HOUR_OF_DAY));
    PreparedStatement ps2=con.prepareStatement("UPDATE timer SET time1=20,time2=20,time3=20,time4=20 WHERE signal_id=?");
    ps2.setInt(1, j);
    ps2.executeUpdate(); 
    }
    }
    catch(Exception e){
    	System.out.println("SQL Exception");
    }
            }


public void run() {
	 int no=1;
	 if((cal.get(Calendar.HOUR_OF_DAY)>=9&&cal.get(Calendar.HOUR_OF_DAY)<11)||(cal.get(Calendar.HOUR_OF_DAY)>=11&&cal.get(Calendar.HOUR_OF_DAY)<13&&cal.get(Calendar.DAY_OF_WEEK)==2)||(cal.get(Calendar.HOUR_OF_DAY)>=13&&cal.get(Calendar.HOUR_OF_DAY)<15&&cal.get(Calendar.DAY_OF_WEEK)==4)||(cal.get(Calendar.HOUR_OF_DAY)>=15&&cal.get(Calendar.HOUR_OF_DAY)<17&&cal.get(Calendar.DAY_OF_WEEK)==2)||(cal.get(Calendar.HOUR_OF_DAY)>=17&&cal.get(Calendar.HOUR_OF_DAY)<19)||(cal.get(Calendar.HOUR_OF_DAY)>=19&&cal.get(Calendar.HOUR_OF_DAY)<21&&cal.get(Calendar.DAY_OF_WEEK)==1))
	 {
  for(;;){
	  if(Thread.currentThread().getName().equals("t0")){
		  no=1;
		  test(no);
	  }	 
	  else if(Thread.currentThread().getName().equals("t1")){
		  no=2;
		  test(no);
	  }
      else if(Thread.currentThread().getName().equals("t2")){
		  no=3;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t3")){
		  no=4;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t4")){
		  no=5;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t5")){
		  no=6;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t6")){
		  no=7;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t7")){
		  no=8;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t8")){
		  no=9;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t9")){
		  no=10;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t10")){
		  no=11;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t11")){
		  no=12;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t12")){
		  no=13;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t13")){
		  no=14;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t14")){
		  no=15;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t15")){
		  no=16;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t16")){
		  no=17;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t17")){
		  no=18;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t18")){
		  no=19;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t19")){
		  no=20;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t20")){
		  no=21;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t21")){
		  no=22;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t22")){
		  no=23;
		  test(no);
	  }
	  else if(Thread.currentThread().getName().equals("t23")){
		  no=24;
		  test(no);
	  }
  }
  }
}
}
