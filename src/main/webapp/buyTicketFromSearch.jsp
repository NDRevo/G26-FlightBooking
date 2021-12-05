<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
    </style>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<ul>
    <li><a href="mainpage.jsp">Home</a></li>
    <li><a class="active" href="flightSearch.jsp">Book Flights</a></li>
    <li><a href="faq.jsp">FAQ</a></li>
    <li><a href="profile.jsp">Profile</a></li>
</ul>

<%@ page import ="java.sql.*" %>
	If flight is full, click on the waitlist button to be added to the waiting queue.
	<br>
<%
    String departingairport = request.getParameter("departingairport");   

    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement stmt = con.createStatement();
  
    
    ResultSet rs1;
   
    rs1 = stmt.executeQuery("select * from flight where flight.departureairport='"+ departingairport+"'");
 

  
    while(rs1.next()){
    	String airlineid = rs1.getString(1);
    	String aircraftid = rs1.getString(2);
    	
    	String dair = rs1.getString(3);
    	String ddate = rs1.getString(4);
    	String dtime = rs1.getString(5);
    	String aair = rs1.getString(6);
    	
    	String econPrice = rs1.getString(11);
    	String busPrice = rs1.getString(12);
    	
    	out.println(rs1.getString(1) + rs1.getString(2));
    	out.println(rs1.getString(3));
    	out.println(rs1.getString(4));
    	out.println(rs1.getString(5));
    	out.println(rs1.getString(6));
    	out.println(rs1.getString(7));
    	out.println(rs1.getString(8));
    	out.println(rs1.getString(9));
    	out.println(rs1.getString(10));
    	out.println(rs1.getString(11));
    	out.println(rs1.getString(12));
    	
    	%>
    	<form action="buyTicketConfirmation.jsp">
	    	<input type="submit" name="button_clicked" value="Buy Economy Class">
	    	<input type="submit" name="button_clicked" value="Buy Business Class">
	    	<input type="submit" name="button_clicked" value="Buy First Class">

    	</form>
    	
    	<form action="flightWaitlistConfirmation.jsp">
	    	<input type="submit" name="button_clicked" value="Waiting Queue">
	    	<input type="hidden" name=airline_id value="<%=airlineid%>">
	    	<input type="hidden" name=aircraft_id value="<%=aircraftid%>">
	    	<input type="hidden" name=dep_date value="<%=ddate%>">
    	</form>
    	
    	
    	<%} %>
</body>
</html>