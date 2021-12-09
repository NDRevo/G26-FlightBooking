<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date, java.text.*"%>
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
			Statement availableWaitlist = con.createStatement();
			Statement historyOfFlightsStatement = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp

			//Run the query against the database.
			Object user = session.getAttribute("user");
			ResultSet upcomingFlights = db.getUpcomingFlights(upcomingFlightsStatement, user.toString());
			ResultSet waitlist = db.getWaitlist(waitlistStatement, user.toString());
			ResultSet historyFlights = db.getHistoryOfFlights(historyOfFlightsStatement, user.toString());
			
			ResultSet availableFlightInWaitlist = db.getAvailableWaitlist(availableWaitlist, user.toString());
			
			if(availableFlightInWaitlist.next()){ %>
				<div class="alert alert-success">
				  	A seat is available on one of your Wait List flights.
				</div>
			<% }
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
				while (upcomingFlights.next()) { 
				    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				    Date fulldeparturedate = dateFormat.parse(upcomingFlights.getString("departuredate"));
				    Date fullarrivaldate = dateFormat.parse(upcomingFlights.getString("arrivaldate"));

					%>
					<tr>    
						<td>#<%= upcomingFlights.getString("ticketid") %></td>
						<td><%= upcomingFlights.getString("flightid") %></td>
						<td><%= fulldeparturedate %></td>
						<td><%= upcomingFlights.getString("departureairport") %></td>
						<td><%= upcomingFlights.getString("destinationairport") %></td>
						<td><%= fullarrivaldate %></td>
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
		<tbody id="flightHistory">
							<%
				//parse out the results
				while (historyFlights.next()) { 
				    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				    Date fulldeparturedate = dateFormat.parse(historyFlights.getString("departuredate"));
				    Date fullarrivaldate = dateFormat.parse(historyFlights.getString("arrivaldate"));

					%>
					<tr>    
						<td>#<%= historyFlights.getString("ticketid") %></td>
						<td><%= historyFlights.getString("flightid") %></td>
						<td><%= fulldeparturedate %></td>
						<td><%= historyFlights.getString("departureairport") %></td>
						<td><%= historyFlights.getString("destinationairport") %></td>
						<td><%= fullarrivaldate %></td>
						<td><%= historyFlights.getString("class") %></td>
						<td>#<%= historyFlights.getString("seatnumber") %></td>
						<td>$<%= historyFlights.getString("totalfare") %></td>
										
						<td>
							<form method="POST" action="Booking/deleteTicket.jsp"><button class="btn btn-primary ">Delete</button>
								<input type="hidden" name=ticketid value="<%=historyFlights.getString("ticketid")%>">
								<input type="hidden" name=flightid value="<%=historyFlights.getString("flightid")%>">
								<input type="hidden" name=seatsavailable value="<%=historyFlights.getString("seatsavailable") %>">
							</form>
						</td>
						
					</tr>
				<% }
			%>
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
						<td>
							<form method="POST" action="Booking/removeWaitlist.jsp">
								<button class="btn btn-primary ">Remove</button>
								<input type="hidden" name=flightid value="<%=waitlist.getString("flightid")%>">
							</form>
						</td>
					</tr>
				<% }
					//close the connection.
					db.closeConnection(con); 
				} 
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