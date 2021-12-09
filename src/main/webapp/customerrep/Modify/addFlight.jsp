<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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

		Statement stmt = con.createStatement();

		String flightid = request.getParameter("flightid");
		String arrivaltime = request.getParameter("arrivaltime");
		String departuretime = request.getParameter("departuretime");
		String departureairport = request.getParameter("departureairport");
		String destinationairport = request.getParameter("destinationairport");
		String companyid = request.getParameter("companyid");
		String aircraftid = request.getParameter("aircraftid");
		int dooid = Integer.valueOf(request.getParameter("dooid"));
		int econfare = Integer.valueOf(request.getParameter("econfare"));
		int busfare = Integer.valueOf(request.getParameter("busfare"));
		int firstfare = Integer.valueOf(request.getParameter("firstfare"));
		String traveltype = request.getParameter("traveltype");
		int seatsavailable = Integer.valueOf(request.getParameter("seatsavailable"));

		String insert = "INSERT INTO flight(flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, dooid, econfare, busfare, firstfare, traveltype, seatsavailable)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the UPDATE statement itself
		ps.setString(1, flightid);
		ps.setString(2, arrivaltime);
		ps.setString(3, departuretime);
		ps.setString(4, departureairport);
		ps.setString(5, destinationairport);
		ps.setString(6, companyid);
		ps.setString(7, aircraftid);
		ps.setInt(8, dooid);
		ps.setInt(9, econfare);
		ps.setInt(10, busfare);
		ps.setInt(11, firstfare);
		ps.setString(12, traveltype);
		ps.setInt(13, seatsavailable);

		ps.executeUpdate();

		con.close();

		out.print("Insert succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>