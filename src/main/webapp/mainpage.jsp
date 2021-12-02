<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
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
    <li><a class="active" href="mainpage.jsp">Home</a></li>
    <li><a href="flightSearch.jsp">Book Flights</a></li>
    <li><a href="faq.jsp">FAQ</a></li>
    <li><a href="profile.jsp">Profile</a></li>
</ul>

<form method="POST" action= "accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>


</body>
</html>