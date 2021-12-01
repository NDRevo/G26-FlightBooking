<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
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
    <li><a class="active" href="#book">Book Flights</a></li>
    <li><a href="#faq">FAQ</a></li>
    <li><a href="#home">home</a></li>
    <li><a href="#profile">Profile</a></li>
</ul>

<label class="checkbox-inline"><input type="checkbox" value="">One Way</label>
<label class="checkbox-inline"><input type="checkbox" value="">Round Trip</label>
<label class="checkbox-inline"><input type="checkbox" value="">One Way Flexible</label>
<label class="checkbox-inline"><input type="checkbox" value="">Round Trip Flexible</label>


<div class="form-group row">
    <div class="form-group">
        <label class="control-label" for="date">Departing Date</label>
        <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>
      </div>
    <div class="form-group">
         <label class="control-label" for="date">Arriving Date</label>
         <input class="form-control" id="date2" name="date2" placeholder="MM/DD/YYY" type="text"/>
      </div>
  <div class="col-xs-2">
    <label for="ex1">col-xs-2</label>
    <input class="form-control" id="airport1" type="Departing Airport">
  </div>
  <div class="col-xs-3">
    <label for="ex2">col-xs-3</label>
    <input class="form-control" id="airport2" type="Arriving Airport">
  </div>
  <button class="btn btn-primary " name="submit" type="submit">Submit</button>
</div>

<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Departure Date</th>
        <th>Departing Airport</th>
        <th>Arriving Airport</th>
        <th>Return Date</th>
        <th>Departing Airport</th>
        <th>Arriving Airport</th>
        <th>Cost</th>
      </tr>
    </thead>
    <tbody id="flightList">
      <tr>
        <th>'5/5/21'</th>
        <th>NWK</th>
        <th>LAX</th>
        <th>'5/7/21'</th>
        <th>LAX</th>
        <th>NWK</th>
        <th>$500</th>
      </tr>
      <tr>
        <th>'5/5/21'</th>
        <th>NWK</th>
        <th>LAX</th>
        <th>'N/A'</th>
        <th>'N/A'</th>
        <th>'N/A'</th>
        <th>$200</th>
      </tr>
    </tbody>
  </table>

</body>
</html>