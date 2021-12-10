<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
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

.boxed {
  border: 1px solid green;
  padding: 16px;
}
.response{
	padding-top: 25px;
}
.customerrep{
	text-align: right;
}
.fullresponse{
	padding-top: 20px;
}
    </style>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<ul>
    <li><a href="../Booking/flightSearch.jsp">Book Flights</a></li>
    <li><a class="active" href="faq.jsp">FAQ</a></li>
    <li><a href="../profile.jsp">Profile</a></li>
</ul>

<h2>FAQ</h2>

<form action="faqSearchResult.jsp">

    <div class="form-group">
        <input class="form-control" id="searchtext" name="searchtext" placeholder="Search a question here!" type="text"/>
        <button id="submitbutton" class="btn btn-primary " name="submit" type="submit">Submit</button>
    </div>
</form>
<br>

	<%

   
    ResultSet questions;
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement stmt = con.createStatement();
    
    questions = stmt.executeQuery("select * from responses where responses.isreply = " + "'0'");
    
  
   	%>
   	
   	<br>
   	<%
    while(questions.next()){
    	String questionid = questions.getString("questionid");
    	String username = questions.getString("username");
    	String text = questions.getString("text");
    	
    	boolean isReply;
    	
    	if(questions.getString("isreply").equals("0")){
    		isReply = false;
    	} else {
    		isReply = true;
    	}
    	

        
    	%>
	    	
			<div class="fullresponse">
				<label>Question By: <%= username %></label>
				<div class="boxed">
				  <%= text %>
				  
				  	<%
					    Statement responsestatement = con.createStatement();    
					    ResultSet responses = responsestatement.executeQuery("select * from responses where responses.isreply = '1' and responses.questionid = '" + questionid +"'");
					    	    
					    
					    while(responses.next()){
				  	%>
					  	<div class="response">
							<div>
								<label>Answer</label>
							</div>
							
							<div class="boxed">
							   <%=  responses.getString("text") %>
							</div>
						</div>
				  	
				  	<%
					    }
				  	
				  	%>
				</div>
			</div>
			
		
			<%}
    	
         db.closeConnection(con); 
       %>



<br>

<form action="faqSubmit.jsp" method="POST">
    Cannot find your question? Ask it here:  <input type="text" name="newFaq"/> 
    <input type="Submit" value="Submit Question"/>
    
</form>

<form method="POST" action= "../Account/accountLogOut.jsp">
    <input type="submit" id="logOutBTN" name="Logout" value="Log Out"/>
</form>
</body>
</html>