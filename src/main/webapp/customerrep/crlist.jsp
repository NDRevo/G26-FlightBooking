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
<form method="POST" action= "accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
<div class="container">
  <h2>Lists</h2>
  <form class="form-inline" action="">
    <div class="form-group">
      <label for="flightNum">Waitlist by flight:</label>
      <input type="text" class="form-control" id="flightNum" placeholder="Enter flight number" name="flightNum">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>

   <form class="form-inline" action="">
      <div class="form-group">
        <label for="allFlights">Flights by departing airport:</label>
        <input type="text" class="form-control" id="departingAirport" placeholder="Enter departing airport" name="departingAirport">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>

    <form class="form-inline" action="">
          <div class="form-group">
            <label for="allFlights">Flights by arriving airport:</label>
            <input type="text" class="form-control" id="arrivingAirport" placeholder="Enter arriving airport" name="arrivingAirport">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form>
        </div>
</div>


 </html>