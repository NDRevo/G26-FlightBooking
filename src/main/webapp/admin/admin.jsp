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
    <li><a class="active" href="admin.jsp">Modify</a></li>
    <li><a href="adminsummary.jsp">Summary</a></li>
    <li><a href="adminsales.jsp">Sales</a></li>
</ul>


<div class="container-fluid">
  <div class="row">
     <div class="col-sm-4" style="background-color:lavender;">

     <h2> Modify </h2>
      <form action="">
         <div class="form-group">
           <label for="modifyCustomer">Edit Customer:</label>
           <input type="text" class="form-control" id="customerID" placeholder="Enter customer ID" name="customerID">
         </div>



           <div class="form-group">
             <label for="modifyCustRep">Edit Customer Representative:</label>
             <input type="text" class="form-control" id="custRepID" placeholder="Enter Customer Representative ID" name="custRepID">
           </div>

     <div id="editForm">
       <label for="userID">Edit UserID:</label><br>
       <input type="text" id="userID" name="userID" value="12345"><br>
       <label for="username">Edit Username:</label><br>
         <input type="text" id="username" name="username" value="jsmith"><br>
         <label for="password">Edit Password:</label><br>
           <input type="text" id="password" name="password" value="password"><br>
           <label for="firstName">Edit First Name:</label><br>
             <input type="text" id="firstName" name="firstName" value="John"><br>
             <label for="lastName">Edit lastName:</label><br>
               <input type="text" id="lastName" name="lastName" value="Smith"><br>
       <button type="submit" class="btn btn-default">Submit</button>
     </form>

     </div>
     </div>
     <div class="col-sm-4" style="background-color:lavenderblush;">
      <h2> Add </h2>
           <form action="">


                <div class="radio">
                  <label><input type="radio" name="optradio" checked>Add Customer</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="optradio">Add Customer Representative</label>
                </div>

          <div id="addForm">
            <label for="userID">Edit UserID:</label><br>
            <input type="text" id="userID" name="userID" value="12345"><br>
            <label for="username">Edit Username:</label><br>
              <input type="text" id="username" name="username" value="jsmith"><br>
              <label for="password">Edit Password:</label><br>
                <input type="text" id="password" name="password" value="password"><br>
                <label for="firstName">Edit First Name:</label><br>
                  <input type="text" id="firstName" name="firstName" value="John"><br>
                  <label for="lastName">Edit lastName:</label><br>
                    <input type="text" id="lastName" name="lastName" value="Smith"><br>
            <button type="submit" class="btn btn-default">Submit</button>
          </form>


</div>
     </div>
     <div class="col-sm-4" style="background-color:lavender;">
         <h2> Delete </h2>
           <form action="">
              <div class="form-group">
                <label for="modifyUser">Delete User:</label>
                <input type="text" class="form-control" id="userID" placeholder="Enter User ID" name="userID">
                  <button type="submit" class="btn btn-default">Submit</button>
              </div>

     </div>








<form method="POST" action= "../Account/accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
</body>
</html>