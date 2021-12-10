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
    <li><a href="customerRepresentative.jsp">Reservations</a></li>
    <li><a class="active" href="crmodify.jsp">Modify</a></li>
    <li><a href="crlist.jsp">List</a></li>
    <li><a href="crfaq.jsp">FAQ</a></li>
</ul>
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();	
%>

<div class="container">
  <h2>Lists</h2>
  <form class="form-inline" action="">
    <div class="form-group">
      <label for="modifyAircraft">Edit Aircraft:</label>
      <input type="text" class="form-control" id="aircraftNum" placeholder="Enter aircraft ID" name="aircraft">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>

   <form class="form-inline" action="">
      <div class="form-group">
        <label for="modifyAirport">Edit Airport:</label>
        <input type="text" class="form-control" id="airportName" placeholder="Enter airport ID" name="airportName">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>

    <form class="form-inline" action="">
          <div class="form-group">
            <label for="modifyFlight">Edit Flight</label>
            <input type="text" class="form-control" id="flightNum" placeholder="Enter flight ID" name="flightNum">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form>
        </div>

</div>

<div id="aircraftAddForm">
<h2>Add Aircraft</h2>
	<form action="Modify/addAircraft.jsp">
	  <label for="aircraftid">AircraftID:</label><br>
	  <input type="text" id="aircraftid" name="aircraftid" placeholder="'Airbus 105'"><br>
	  <label for="numberseats">Number Of Seats:</label><br>
	  <input type="text" id="numberseats" name="numberseats" placeholder="'5'"><br><br>
	  <input type="submit" value="Submit">
	</form>
</div>
<br>
<div id="airportAddForm">
<h2>Add Airport</h2>
	<form action="Modify/addAirport.jsp">
	  <label for="airportid">AirportID:</label><br>
	  <input type="text" id="airportid" name="airportid" placeholder="'EWR'"><br><br>
	  <input type="submit" value="Submit">
	</form>
</div>

<br>

<div id="flightAddForm">
<h2>Add Flight</h2>
	<form action="Modify/addFlight.jsp">
	  
	  	<label for="departuretime">Departure Time:</label><br>
	  	<input type="text" id="departuretime" name="departuretime" placeholder="'12:00:00'"><br>
	  
	  	<label for="arrivaltime">Arrival Time:</label><br>
	  	<input type="text" id="arrivaltime" name="arrivaltime" placeholder="'12:00:00'"><br>

	  	<label for="departureairport">Departure Airport:</label><br>
		  	<select name="departureairport">
			<%	
	    	Statement airportstatement = con.createStatement();
	    	ResultSet airportlist = airportstatement.executeQuery("select airportid from airport");
	    	
	    	while(airportlist.next()){
	    		String airportid = airportlist.getString(1);
			%>
				<option value= <%= airportid %>><%= airportid %></option>
			<%
	    	}
			%>
			</select><br>
	  
	  	<label for="arrivalairport">Arrival Airport:</label><br>
		  	<select name="arrivalairport">
			
			<%	
		   	Statement arrivalairportstatement = con.createStatement();
		   	ResultSet arrivalairportlist = arrivalairportstatement.executeQuery("select airportid from airport");
		   	
		   	while(arrivalairportlist.next()){
		   		String airportid = arrivalairportlist.getString(1);
			%>
				<option value= <%= airportid %>><%= airportid %></option>
			<%
		   	}
			%>
			</select><br>
	  
	  <label for="companyid">Airline ID:</label><br>
		<select name="companyid">
		
		<%	
    	Statement company = con.createStatement();
    	ResultSet companylist = company.executeQuery("select companyid from airlinecompany");
    	
    	while(companylist.next()){
    		String companyid = companylist.getString(1);
		%>
			<option value= <%= companyid %>><%= companyid %></option>
		<%
    	}
		%>
		</select><br>
		 
	 
	 
	  <label for="aircraftid">Aircraft ID:</label><br>
	  <select name="aircraftid">
		
		<%	
    	Statement aircraftstatement = con.createStatement();
    	ResultSet aircraftlist = aircraftstatement.executeQuery("select aircraftid from aircrafts");
    	
    	while(aircraftlist.next()){
    		String aircraftid = aircraftlist.getString(1);
		%>
			<option value= '<%= aircraftid %>'><%= aircraftid %></option>
		<%
    	}
		%>
		</select><br>
	  
	  <label for="dooid">Days Of Operation (7 Digit, Starts on Monday, 1 Signifies it flies on that day)</label><br>
	  <select name="dooid">
		
		<%	
    	Statement dooidstatement = con.createStatement();
    	ResultSet dooidlist = aircraftstatement.executeQuery("select dooid from daysofoperation");
    	
    	while(dooidlist.next()){
    		String dooid = dooidlist.getString(1);
		%>
			<option value= <%= dooid %>><%= dooid %></option>
		<%
    	}
    	
    	con.close();
		%>
		</select><br>
	  
	  
	  <label for="econfare">Economy Fair:</label><br>
	  <input type="text" id="econfare" name="econfare" placeholder="'120'"><br>
	  <label for="busfare">Business Fair:</label><br>
	  <input type="text" id="busfare" name="busfare" placeholder="'220'"><br>
	  <label for="firstfare">First Fair:</label><br>
	  <input type="text" id="firstfare" name="firstfare" placeholder="'320'"><br>
	  
	  <label for="traveltype">Travel Type:</label><br> 
	  <select name="traveltype">
			<option value= domestic>domestic</option>
			<option value= international>international</option>
		</select><br><br>
	  
	  
	  <input type="submit" value="Submit">
	</form>
</div>

<br>
<form method="POST" action= "accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
</body>
 </html>