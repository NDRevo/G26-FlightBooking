<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date, java.text.*, java.time.*, java.util.concurrent.TimeUnit"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Add Flight</title>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement seatsStatement = con.createStatement();
		Statement flightStatement = con.createStatement();
		
		

		String flightid = "";
		String departuretime = request.getParameter("departuretime");
		String arrivaltime = request.getParameter("arrivaltime");
		
		String departureairport = request.getParameter("departureairport");
		String destinationairport = request.getParameter("arrivalairport");
		
		
		String companyid = request.getParameter("companyid");
		String aircraftid = request.getParameter("aircraftid");
		
		ResultSet seatsforcraft = seatsStatement.executeQuery("select numberseats from aircrafts where aircraftid = '" + aircraftid +"'");
		ResultSet numFlightsCompany = flightStatement.executeQuery("select companyid, count(*) from flight where companyid = '" + companyid +"' group by companyid");
		
		String numberseats = "";
		if(seatsforcraft.next()){
			numberseats = seatsforcraft.getString(1);
		}
		
		if(numFlightsCompany.next()){
			flightid = companyid + (numFlightsCompany.getInt(2) +1);
		}
		
		String dooid = request.getParameter("dooid");
		int econfare = Integer.valueOf(request.getParameter("econfare"));
		int busfare = Integer.valueOf(request.getParameter("busfare"));
		int firstfare = Integer.valueOf(request.getParameter("firstfare"));
		String traveltype = request.getParameter("traveltype");
		
	    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	    Date arrivaldate = dateFormat.parse(arrivaltime);
	    Date departuredate = dateFormat.parse(departuretime);
	    
	    long time  = arrivaldate.getTime() - departuredate.getTime();
	    SimpleDateFormat dataformat = new SimpleDateFormat("HH:mm:ss");
	    String duration = String.format("%02d:%02d:%02d", 
				TimeUnit.MILLISECONDS.toHours(time),
				TimeUnit.MILLISECONDS.toMinutes(time) -  
				TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(time)), // The change is in this line
				TimeUnit.MILLISECONDS.toSeconds(time) - 
				TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(time)));   
	   
		
		
		

		String insert = "INSERT INTO flight(flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, dooid, econfare, busfare, firstfare, traveltype, seatsavailable, duration)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, flightid);
		ps.setString(2, arrivaltime);
		ps.setString(3, departuretime);
		ps.setString(4, departureairport);
		ps.setString(5, destinationairport);
		ps.setString(6, companyid);
		ps.setString(7, aircraftid);
		ps.setString(8, dooid);
		ps.setInt(9, econfare);
		ps.setInt(10, busfare);
		ps.setInt(11, firstfare);
		ps.setString(12, traveltype);
		ps.setString(13, numberseats);
		ps.setString(14, duration);

		ps.executeUpdate();
		response.sendRedirect("../crmodify.jsp");
		
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>