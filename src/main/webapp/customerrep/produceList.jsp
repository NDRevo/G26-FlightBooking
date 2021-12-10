<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
    <li><a href="customerRepresentative.jsp">Reservations</a></li>
    <li><a href="crmodify.jsp">Modify</a></li>
    <li><a class="active" href="crlist.jsp">List</a></li>
    <li><a href="crfaq.jsp">FAQ</a></li>
</ul>
	
	<%
	
			String buttonClicked = request.getParameter("submitbuttonclicked");
			String inputFlightId = request.getParameter("flightid");
			String inputDepartingAirport = request.getParameter("departingAirport");
			String inputArrivingAirport = request.getParameter("arrivingAirport");
	

			ResultSet producedlist;
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			
			if(buttonClicked.contains("waitlist")){
				producedlist = stmt.executeQuery("select * FROM waitlist where flightid =  '"+ inputFlightId + "'");		    
				
			%>				
				<table class="table table-bordered table-striped">
			    <thead>
			      <tr>
			        <th>Flight ID</th>
			        <th>Username</th>
			      </tr>
			    </thead>
				    <tbody id="flightList">
				    		<%
								//parse out the results
								while (producedlist.next()) { %>
									<tr>    
										<td><%= producedlist.getString("flightid") %></td>
										<td><%= producedlist.getString("username") %></td>	
									</tr>
								<% } %>
					
				    </tbody>
				</table>
			<% }
			
			
			
			
			
			else if(buttonClicked.contains("departing")){
				producedlist = stmt.executeQuery("select * FROM flight where departureairport =  '"+ inputDepartingAirport + "'");		    
				
			%>				
				<table class="table table-bordered table-striped">
			    <thead>
			      <tr>
			        <th>Flight Number</th>
				    <th>Departure Time</th>
			        <th>Departing Airport</th>
			        <th>Arriving Airport</th>
			        <th>Arrival Time</th>
			      </tr>
			    </thead>
				    <tbody id="flightList">
				    		<%
								//parse out the results
								while (producedlist.next()) { %>
									<tr>    
										<td><%= producedlist.getString("flightid") %></td>
										<td><%= producedlist.getString("departuretime") %></td>
										<td><%= producedlist.getString("departureairport") %></td>
										<td><%= producedlist.getString("destinationairport") %></td>
										<td><%= producedlist.getString("arrivaltime") %></td>
									</tr>
								<% } %>
					
				    </tbody>
				</table>
			<% }
			
			
			else if(buttonClicked.contains("arriving")){
				producedlist = stmt.executeQuery("select * FROM flight where destinationairport =  '"+ inputArrivingAirport + "'");		    
				
			%>				
				<table class="table table-bordered table-striped">
			    <thead>
			      <tr>
				        <th>Flight Number</th>
				        <th>Departure Time</th>
				        <th>Departing Airport</th>
				        <th>Arriving Airport</th>
				        <th>Arrival Time</th>
			      </tr>
			    </thead>
				    <tbody id="flightList">
				    		<%
								//parse out the results
								while (producedlist.next()) { %>
									<tr>    
										<td><%= producedlist.getString("flightid") %></td>
										<td><%= producedlist.getString("departuretime") %></td>
										<td><%= producedlist.getString("departureairport") %></td>
										<td><%= producedlist.getString("destinationairport") %></td>
										<td><%= producedlist.getString("arrivaltime") %></td>
									</tr>
								<% } %>
					
				    </tbody>
				</table>
			<% }
			
%>

</body>
 </html>
 