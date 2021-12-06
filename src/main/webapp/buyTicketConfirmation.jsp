<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*"%>
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

 	Thank you for booking your flight!
 	
<% 	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
   
    String buttonClicked = request.getParameter("buyButtonClicked");
    
    String userid = (String) session.getAttribute("user");
	String flightid = request.getParameter("flightid");
   	
   	String departureairport = request.getParameter("departureairport");
	String departuretime = request.getParameter("departuretime");
	
	String arrivaltime = request.getParameter("arrivaltime");
	String destinationairport = request.getParameter("destinationairport");
   	
 	int econfare = Integer.parseInt(request.getParameter("econfare"));
	int busfare = Integer.parseInt(request.getParameter("busfare"));
	int firstfare = Integer.parseInt(request.getParameter("firstfare"));
	int availableseats = Integer.parseInt(request.getParameter("availableseats"));
	
	Random rnd = new Random();
	int ticketid = 100000 + rnd.nextInt(900000);
	
	java.util.Date currentDate = new java.util.Date();

	if("Buy Economy Class".equals(buttonClicked)){
		 ResultSet rs1 = stmt.executeQuery("select current_timestamp");
		// ResultSet rs2 = stmt.executeQuery("select extract(month from current_timestamp )");
		 
		 rs1.next();
		 String curr = rs1.getString("current_timestamp");
		 String cl = "Economy Class";
		 String bookingfee = Integer.toString(100);
		 String totalfare = Integer.toString(econfare + 100);
		 
		 int x = stmt.executeUpdate("insert into ticketfor (userid, ticketid, purchasedate, bookingfee, totalfare) value ('" +userid +
				 "','" +ticketid+ "' ,'" +currentDate+ "' ,'" + bookingfee + "','" +totalfare+ "')");
	}
	
%>
</body>
</html>