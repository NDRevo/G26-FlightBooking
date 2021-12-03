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

<div class="alert alert-success">
  <strong>Success!</strong> A seat is available on one of your Wait List flights.
</div>

<ul>
    <li><a href="mainpage.jsp">Home</a></li>
    <li><a href="flightSearch.jsp">Book Flights</a></li>
    <li><a href="faq.jsp">FAQ</a></li>
    <li><a class="active" href="profile.jsp">Profile</a></li>
</ul>

<div class="container-fluid">
  <h1>My Profile</h1>
  <div class="row">
    <div class="col-sm-4" style="background-color:lightgrey;">Flight History</div>
    <div class="col-sm-4" style="background-color:white;">Upcoming Flights</div>
    <div class="col-sm-4" style="background-color:lightgrey;">Wait List</div>
  </div>
</div>

</body>
</html>