<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
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

		<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement waitlistStatement = con.createStatement();
			Statement upcomingFlightsStatement = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp

			//Run the query against the database.
			Object user = session.getAttribute("user");
			ResultSet waitlist = db.getWaitlist(waitlistStatement, user.toString());
			ResultSet upcomingFlights = db.getUpcomingFlights(upcomingFlightsStatement, user.toString());
		%>

<ul>
    <li><a href="Booking/flightSearch.jsp">Book Flights</a></li>
    <li><a href="faq.jsp">FAQ</a></li>
    <li><a class="active" href="profile.jsp">Profile</a></li>
</ul>

<div class="container-fluid">
  <h1>My Profile</h1>
  
	<table class="table table-bordered table-striped">
	    <thead>
		      <tr>
		        <th>Upcoming Flights</th>
		      </tr>
		      <tr>
		        <th>Ticket ID</th>
		        <th>Flight Number</th>
		        <th>Departure Time</th>
		        <th>Departure Airport</th>
		        <th>Destination Airport</th>
		        <th>Arrival Time</th>
		        <th>Class</th>
		        <th>Seat Number</th>
		        <th>Total Fare</th>
		      </tr>
	    </thead>
		<tbody id="upcomingFlights">
			<%
				//parse out the results
				while (upcomingFlights.next()) { %>
					<tr>    
						<td>#<%= upcomingFlights.getString("ticketid") %></td>
						<td><%= upcomingFlights.getString("flightid") %></td>
						<td><%= upcomingFlights.getString("departuretime") %></td>
						<td><%= upcomingFlights.getString("departureairport") %></td>
						<td><%= upcomingFlights.getString("destinationairport") %></td>
						<td><%= upcomingFlights.getString("arrivaltime") %></td>
						<td><%= upcomingFlights.getString("class") %></td>
						<td>#<%= upcomingFlights.getString("seatnumber") %></td>
						<td>$<%= upcomingFlights.getString("totalfare") %></td>
										
						<%
							if(!upcomingFlights.getString("class").contains("Economy")){
								%>
								<td>
									<form method="POST" action="Booking/deleteTicket.jsp"><button class="btn btn-primary ">Delete</button>
										<input type="hidden" name=ticketid value="<%=upcomingFlights.getString("ticketid")%>">
										<input type="hidden" name=flightid value="<%=upcomingFlights.getString("flightid")%>">
										<input type="hidden" name=seatsavailable value="<%=upcomingFlights.getString("seatsavailable") %>">
									</form>
								</td>
							<%}
						
						%>
						<td></td>
					</tr>
				<% }
			%>
	    </tbody>
	</table>
	
	<table class="table table-bordered table-striped">
	    <thead>
		      <tr>
		        <th>Flight History</th>
		      </tr>
	    </thead>
		<tbody id="flightHistory">
				
	    </tbody>
	</table>
	
	
	<table class="table table-bordered table-striped">
	    <thead>
		      <tr>
		        <th>Waitlist</th>
		      </tr>
		      <tr>
		        <th>Flight Number</th>
		        <th>Departure Date</th>
		        <th>Departing Airport</th>
		        <th>Arriving Airport</th>
		        <th>Return Date</th>
		        <th>Seats Available</th>
		      </tr>
	    </thead>
		<tbody id="waitList">
				    		<%
				//parse out the results
				while (waitlist.next()) { %>
					<tr>    
						<td><%= waitlist.getString("flightid") %></td>
						<td><%= waitlist.getString("departuretime") %></td>
						<td><%= waitlist.getString("departureairport") %></td>
						<td><%= waitlist.getString("destinationairport") %></td>
						<td><%= waitlist.getString("arrivaltime") %></td>
						<td><%= waitlist.getString("seatsavailable") %></td>
					</tr>
				<% }
				//close the connection.
				db.closeConnection(con); } 
				catch (Exception e) {
					out.print(e);
				}
			%>
	    </tbody>
	</table>
	
</div>

<form method="POST" action= "Account/accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>

</body>
</html>