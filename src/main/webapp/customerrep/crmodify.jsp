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
<form method="POST" action= "accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
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

<div id="aircraftEditForm">
<form action="">
  <label for="numSeats">Number of Seats:</label><br>
  <input type="text" id="numSeats" name="numSeats" value="IDK"><br>
  <input type="submit" value="Submit">
</form>
</div>

<div id="airportEditForm">
<form action="">
  <label for="airportID">Airport ID:</label><br>
  <input type="text" id="airportID" name="airportID" value="IDK"><br>
  <input type="submit" value="Submit">
</form>
</div>

<div id="flightEditForm">
<form action="">
  <label for="departureTime">Departure Time:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="arrivalTime">Arrival Time:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="flightID">Flight ID:</label><br>
  <input type="text" id="lname" name="lname" value="Doe"><br>
  <label for="daysOfWeek">Days of Week:</label><br>
    <label class="checkbox-inline">
        <input type="checkbox" value="">Monday
      </label>
      <label class="checkbox-inline">
        <input type="checkbox" value="">Tuesday
      </label>
      <label class="checkbox-inline">
        <input type="checkbox" value="">Wednesday
      </label>
      <label class="checkbox-inline">
        <input type="checkbox" value="">Thursday
      </label>
      <label class="checkbox-inline">
        <input type="checkbox" value="">Friday
      </label>
      <label class="checkbox-inline">
        <input type="checkbox" value="">Saturday
      </label>
      <label class="checkbox-inline">
        <input type="checkbox" value="">Sunday
      </label>
      <br>
  <label for="destinationAirport">Destination Airport:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="departureAirport">Departure Airport:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="domesticOrInternational">Domestic or International Flight:</label><br>
  <label class="radio-inline"><input type="radio" name="flightType" checked>International</label>
  <label class="radio-inline"><input type="radio" name="flightType">Domestic</label>
  <br>
  <input type="submit" value="Submit">
</form>
</div>

<script>
function editAircraft() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>

<script>
function editAirport() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>

<script>
function editFlight() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>


 </html>