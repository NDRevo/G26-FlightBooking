<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
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

		String aircraftid = request.getParameter("aircraftid");
		int numberseats = Integer.valueOf(request.getParameter("numberseats"));


		//Make an insert statement for the aircrafts table:
		String insert = "INSERT INTO aircrafts(aircraftid, numberseats)"
				+ "VALUES (?, ?)";

		PreparedStatement ps = con.prepareStatement(insert);

		
		ps.setString(1, aircraftid);
		ps.setInt(2, numberseats);
		ps.executeUpdate();


		con.close();
		
		response.sendRedirect("../crmodify.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
%>
</body>
</html>