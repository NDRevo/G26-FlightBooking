<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Reservation</title>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();


		int ticketid = Integer.valueOf(request.getParameter("ticketid"));
		int seatnumber = Integer.valueOf(request.getParameter("seatnumber"));
		String flightclass = request.getParameter("class");


		//Make an update statement for the flghtforticket table:
		String update = "UPDATE flightforticket \nSET seatnumber=" + seatnumber + ", class=" + flightclass + "\nWHERE ticketid=" + ticketid;
		PreparedStatement ps = con.prepareStatement(update);


		ps.setInt(1, seatnumber);
		ps.setString(2, flightclass);
		ps.executeUpdate();


		con.close();

		out.print("Update succeeded!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Update failed :()");
	}
%>
</body>
</html>