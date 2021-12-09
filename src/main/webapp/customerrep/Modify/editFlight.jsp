<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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



		//Make an update statement for the FLIGHT table:
		String update = "UPDATE flight \nSET arrivaltime=" + arrivaltime + ", departuretime=" + departuretime +  ", departureairport=" + departureairport + ", destinationairport=" + destinationairport + ", aircraftid=" + aircraftid+ ", dooid=" + dooid+ ", econfare=" + econfare+ ", busfare=" + busfare+ ", firstfare=" + firstfare+ ", traveltype=" + traveltype+ ", seatsavailable=" + seatsavailable +"\nWHERE flightid=" + flightid;

		PreparedStatement ps = con.prepareStatement(update);


		ps.setString(1, arrivaltime);
		ps.setString(2, departuretime);
		ps.setString(3, departureairport);
		ps.setString(4, destinationairport);
		ps.setString(5, aircraftid);
		ps.setInt(6, dooid);
		ps.setInt(7, econfare);
		ps.setInt(8, busfare);
		ps.setInt(9, firstfare);
		ps.setString(10, traveltype);
		ps.setInt(11, seatsavailable);

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