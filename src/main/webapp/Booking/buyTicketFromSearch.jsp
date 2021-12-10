<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
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
.dropbtn {
  background-color: #B066D4;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}
.dropdown:hover .dropbtn {
  background-color: #A544D5;
}

</style>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<ul>
    <li><a class="active" href="flightSearch.jsp">Book Flights</a></li>
    <li><a href="../faq.jsp">FAQ</a></li>
    <li><a href="../profile.jsp">Profile</a></li>
</ul>

<script>
	function check(){
		if(document.getElementById("filterlist").value == "price"){
			document.getElementById("filtertextfield").placeholder = "Enter Max Price";
		} else if (document.getElementById("filterlist").value == "airline"){
			document.getElementById("filtertextfield").placeholder = "Ex. AA, DL, JB";
		} else if (document.getElementById("filterlist").value == "departuretime"){
		 	document.getElementById("filtertextfield").placeholder = "HH:mm:ss";
		} else if (document.getElementById("filterlist").value == "arrivaltime"){
			document.getElementById("filtertextfield").placeholder = "HH:mm:ss";
		}
	}	
</script>
<%
    String getDepartureAirport = request.getParameter("departingairport");
    String getDestinationAirport = request.getParameter("destinationairport");   

    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
    Date departureDate = dateFormat.parse(request.getParameter("departuretime"));
    
	
	Date date = new Date();   
    SimpleDateFormat dateFormatt = new SimpleDateFormat("MM/dd/yyyy HH:mm");
    String stringCurrentDate = dateFormatt.format(date.getDate());
    
    ResultSet departureFlights;
    ResultSet returnFlights;
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement stmt = con.createStatement();
    
    if(request.getParameter("returndate") != null){
        Date returndate = dateFormat.parse(request.getParameter("returndate"));
        
        departureFlights = stmt.executeQuery("select * from flight, daysofoperation where flight.departureairport='"+ getDepartureAirport+"' and flight.destinationairport='" + getDestinationAirport + "' and '" + departureDate.getDay() + "'in (daysofoperation.monday,daysofoperation.tuesday,daysofoperation.wednesday,daysofoperation.thursday,daysofoperation.friday,daysofoperation.saturday,daysofoperation.sunday) and flight.dooid = daysofoperation.dooid");
        returnFlights = stmt.executeQuery("select * from flight, daysofoperation where flight.departureairport='"+ getDestinationAirport+"' and flight.destinationairport='" + getDepartureAirport + "' and '" + returndate.getDay() + "'in (daysofoperation.monday,daysofoperation.tuesday,daysofoperation.wednesday,daysofoperation.thursday,daysofoperation.friday,daysofoperation.saturday,daysofoperation.sunday) and flight.dooid = daysofoperation.dooid ");
        
    } else {
    	departureFlights = stmt.executeQuery("select * from flight, daysofoperation where flight.departureairport='"+ getDepartureAirport+"' and flight.destinationairport='" + getDestinationAirport + "' and '" + departureDate.getDay() + "'in (daysofoperation.monday,daysofoperation.tuesday,daysofoperation.wednesday,daysofoperation.thursday,daysofoperation.friday,daysofoperation.saturday,daysofoperation.sunday) and flight.dooid = daysofoperation.dooid");
    	
    	%>
		<form method="get" action="sortedFlights.jsp">
			Sort by:
			<select name="sortby" size=1>
				<option value="price">Price</option>
				<option value="departuretime">Departure Time</option>
				<option value="arrivaltime">Arrival Time</option>
				<option value="duration">Duration</option>
			</select>
			<input type="submit" value="Submit">
			<input type="hidden" name=departureairport value="<%=getDepartureAirport%>">
			<input type="hidden" name=destinationairport value="<%=getDestinationAirport%>">
			<input type="hidden" name=departuretime value="<%=request.getParameter("departuretime")%>">
			
		</form>
		
		<form method="get" action="filteredFlights.jsp">
			Filter by:
			<select id="filterlist" name="filterby" size=1  onChange="check();">
				<option value="price">Price</option>
				<option value="departuretime">Departure Time No Later Than: </option>
				<option value="arrivaltime">Arrival Time No Later Than:</option>
				<option value="airline">Airline</option>
			</select>
			<input type=text name="filtertextfield" id="filtertextfield" placeholder="Enter Max Price" value="">
			<input type="submit" value="Submit">
			
			<input type="hidden" name=departureairport value="<%=getDepartureAirport%>">
			<input type="hidden" name=destinationairport value="<%=getDestinationAirport%>">
			<input type="hidden" name=departuretime value="<%=request.getParameter("departuretime")%>">
		</form>
    	
    	If flight is full, click on the waitlist button to be added to the waiting queue.
    	<br>
    	<%
 
	    while(departureFlights.next()){
	    	String flightid = departureFlights.getString(1);
	
	    	String departuretime = departureFlights.getString(3);
	    	String arrivaltime = departureFlights.getString(2);
	    	
	    	String departureairport = departureFlights.getString(4);
	    	String destinationairport = departureFlights.getString(5);
	    	String aircraftid = departureFlights.getString(7);
	    	
	    	String econfare = departureFlights.getString(9);
	    	String busfare = departureFlights.getString(10);
	    	String firstfare = departureFlights.getString(11);
	    	String availableseats = departureFlights.getString(13);
	    	String duration = departureFlights.getString(14);

	        String departurefulldate = request.getParameter("departuretime") + " " + departuretime;
	        String arrivalfulldate = request.getParameter("departuretime") + " " + arrivaltime;
	        
	    	%>
	    	
	    	<table class="table table-bordered table-striped">
			    <thead>
			      <tr>
			        <th>Flight ID</th>
			        <th>Departure Airport</th>
			        <th>Departing Date</th>
			        <th>Arriving Airport</th>
			        <th>Arriving Date</th>
			        <th>Duration</th>
			        <th>Aircraft</th>
			        <th>Available Seats</th>
			      </tr>
			    </thead>
				    <tbody id="flightList">
						<tr>
							<td><%= flightid %></td>
							<td><%= departureairport %></td>
							<td><%= departuretime %></td>
							<td><%= destinationairport %></td>
							<td><%= arrivaltime %></td>
							<td><%= duration %></td>
							<td><%= aircraftid %></td>
							<td><%= availableseats %></td>	
						</tr>	
				    </tbody>
			</table>
			
			<% if(availableseats.contains("0")){ %>
					<form action="flightWaitlistConfirmation.jsp">
						<input type="submit" name="button_clicked" value="Waiting Queue">
						<input type="hidden" name=flightid value="<%=flightid%>">
					</form>	
				<%} else { %>	
					<form action="buyTicketConfirmation.jsp">
						<input type="submit" name="buyButtonClicked" id = buyEcon value="Buy Economy Class - $<%=econfare%>">
						<input type="submit" name="buyButtonClicked" id = buyBus value="Buy Business Class - $<%=busfare%>">
						<input type="submit" name="buyButtonClicked" id = buyFirst value="Buy First Class - $<%=firstfare%>">

						<input type="hidden" name=flightid value="<%=flightid%>">
						<input type="hidden" name=departurefulldate value="<%=departurefulldate%>">
						<input type="hidden" name=arrivalfulldate value="<%=arrivalfulldate%>">
						<input type="hidden" name=departureairport value="<%=departureairport%>">
						<input type="hidden" name=departuretime value="<%=departuretime%>">
						<input type="hidden" name=destinationairport value="<%=destinationairport%>">
						<input type="hidden" name=arrivaltime value="<%=arrivaltime%>">
						<input type="hidden" name=aircraftid value="<%=aircraftid%>">
						<input type="hidden" name=econfare value="<%=econfare%>">
						<input type="hidden" name=busfare value="<%=busfare%>">
						<input type="hidden" name=firstfare value="<%=firstfare%>">
						<input type="hidden" name=availableseats value="<%=availableseats%>">
					</form>	
				<%} %>	
	    	<%} 
	         db.closeConnection(con);
	     }%>
</body>
</html>