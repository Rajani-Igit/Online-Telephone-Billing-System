<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History</title>
</head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
table,th,td{
padding
}
</style>

<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<body>
 <% 
  HttpSession ses = request.getSession(false);
  String uname = (String)ses.getAttribute("uname");
  Class.forName("com.mysql.jdbc.Driver");
  java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nishant?autoReconnect=true&useSSL=false","root","root"); 
  Statement st= con.createStatement();
  Statement st1= con.createStatement();
  Statement st2= con.createStatement();
  ResultSet n2=st.executeQuery("select * from cutomer_record where uname='"+uname+"'");	
  String pno1=null;
  while(n2.next())
  {
	pno1=n2.getString("pno");
  }
  
   %><h3 class = "text-center">Hello USER </h3> Data history for your number : <%out.println(pno1); %> ===><%;
  ResultSet rs=st.executeQuery("select * from gsmmeter where pno = '"+pno1+"' order by date desc");
  ResultSet rs1=st1.executeQuery("select * from wcdmameter where pno = '"+pno1+"' order by date desc");
  int Gsmrate=0;
  int Wcdmarate=0;
  ResultSet rs2=st2.executeQuery("select * from datarate");
  while(rs2.next())
  {
	Gsmrate= rs2.getInt("Gsm_rate") ;
	Wcdmarate= rs2.getInt("Wcdma_rate") ;
  }
  int Gsm_Usage = 0;
  int Wcdma_Usage1 = 0;
  int Wcdma_Usage = 0;
  int Gsm_Usage1=0;
  String date  = null;
  %>
<br>
<br>
   <table class = "table table-condensed">
	   <tr class = "danger">
	     <th class = "danger">
	        date
	      </th>
	      <th>
	       GSM USAGE (KB)
	      </th>
	      
	   </tr>
	   <%
  while(rs.next())
  {
	  
	  Gsm_Usage1 = rs.getInt("Gsm_Usage");
	  
	  Gsm_Usage=Gsm_Usage1*Gsmrate;
	  try{
	  date = rs.getString("date");
	  }catch(Exception e){
		  out.println("Error occured \n you haven't register or something went wrong");
	  }
	  %>
	 <tr class = "success">
	   <td><% out.println(date);%></td>
	   <td><% out.println(Gsm_Usage);%></td>
	  </tr>
	  <%
  }
  
 %>
 
 <br>
<br>
   <table class = "table table-condensed">
	   <tr class = "danger">
	     <th class = "danger">
	        date
	      </th>
	      <th>
	       WCDMA USAGE (KB)
	      </th>
	      
	   </tr>
    <%
  while(rs1.next())
  {
	  
	  Wcdma_Usage1 = rs1.getInt("Wcdma_Usage");
	  Wcdma_Usage=Wcdma_Usage1*Wcdmarate;
	  try{
	  date = rs1.getString("date");
	  }catch(Exception e){
		  out.println("Error occured \n you haven't register or something went wrong");
	  }
	  %>
	 <tr class = "success">
	  <td><% out.println(date);%></td>
	 
	 <td><% out.println(Wcdma_Usage);%></td>
	  
	  </tr>
	  <%
  }
  
 %>
 
  </table>
 <form> <input type="button" value="BACK" onclick="window.location.href='http://localhost:8080/login/index1.jsp'" /> </form> 
			
		      
</body>
</html>