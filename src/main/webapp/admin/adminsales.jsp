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
    <li><a href="admin.jsp">Modify</a></li>
    <li><a class="active" href="adminsummary.jsp">Summary</a></li>
    <li><a href="adminsales.jsp">Sales</a></li>
</ul>

<div class="container">
  <h2>Monthly Sales Report</h2>
  <form>
    <div class="form-group">
      <label for="selMonth">Select Month:</label>
      <select class="form-control" id="selMonth">
        <option>January</option>
        <option>February</option>
        <option>March</option>
        <option>April</option>
        <option>May</option>
        <option>June</option>
        <option>July</option>
        <option>August</option>
        <option>September</option>
        <option>October</option>
        <option>November</option>
        <option>December</option>
      </select>
      <br>

          <input type="submit" id="monthSalesBTN" name="monthSales" value="Submit"/>

      </form>
      </div>

<div class="container">
  <h2>Revenue by Flight</h2>
  <form action="">
    <div class="form-group">
      <label for="FlightID">FlightID:</label>
      <input type="text" class="form-control" id="flightID" placeholder="Enter Flight ID" name="flightID">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>


<div class="container">
  <h2>Revenue by Airline</h2>
  <form action="">
    <div class="form-group">
      <label for="AirlineName">Airline Name:</label>
      <input type="text" class="form-control" id="AirlineName" placeholder="Enter Airline Name" name="Airline Name">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

<div class="container">
  <h2>Revenue by Customer</h2>
  <form action="">
    <div class="form-group">
      <label for="customerName">Airline Name:</label>
      <input type="text" class="form-control" id="customerName" placeholder="Enter Customer Name" name="customerName">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

<form method="POST" action= "">
    <input type="submit" id="custMostRev" name="custMostRevBTN" value="Highest Revenue Generating Customer"/>
</form>

<form method="POST" action= "accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
</body>
</html>

