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

	If flight is full, click on the waitlist button to be added to the waiting queue.
	<br>
<%
    String getDepartureAirport = request.getParameter("departingairport");
    String getDestinationAirport = request.getParameter("destinationairport");   

    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
    Date departureDate = dateFormat.parse(request.getParameter("departuretime"));
    
    if(request.getParameter("returndate") != null){
        Date returndate = dateFormat.parse(request.getParameter("returndate"));
    }
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement stmt = con.createStatement();

    
    ResultSet rs1;
   
    rs1 = stmt.executeQuery("select * from flight, daysofoperation where flight.departureairport='"+ getDepartureAirport+"' and flight.destinationairport='" + getDestinationAirport + "' and '" + departureDate.getDay() + "'in (daysofoperation.monday,daysofoperation.tuesday,daysofoperation.wednesday,daysofoperation.thursday,daysofoperation.friday,daysofoperation.saturday,daysofoperation.sunday) and flight.dooid = daysofoperation.dooid ");
 

  
    while(rs1.next()){
    	String flightid = rs1.getString(1);

    	
    	String departuretime = rs1.getString(3);
    	String arrivaltime = rs1.getString(2);
    	
    	
    	String departureairport = rs1.getString(4);
    	String destinationairport = rs1.getString(5);
    	String aircraftid = rs1.getString(7);
    	
    	String econfare = rs1.getString(9);
    	String busfare = rs1.getString(10);
    	String firstfare = rs1.getString(11);
    	String availableseats = rs1.getString(13);
    	
    	out.println(flightid);
    	out.println(departureairport);
    	out.println(departuretime);
    	out.println(destinationairport);
    	out.println(arrivaltime);	
    	out.println(aircraftid);
    	out.println(econfare);
    	out.println(busfare);
    	out.println(firstfare);
    	out.println(availableseats);
    	
    	%>
    	<form action="buyTicketConfirmation.jsp">
	    	<input type="submit" name="buyButtonClicked" value="Buy Economy Class">
	    	<input type="submit" name="buyButtonClicked" value="Buy Business Class">
	    	<input type="submit" name="buyButtonClicked" value="Buy First Class">
	    	
	    	<input type="hidden" name=flightid value="<%=flightid%>">
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
    	
    	<form action="flightWaitlistConfirmation.jsp">
	    	<input type="submit" name="button_clicked" value="Waiting Queue">
	    	<input type="hidden" name=flightid value="<%=flightid%>">
    	</form>
    	
    	<%} %>
</body>
</html>