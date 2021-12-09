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
		List<String> list = new ArrayList<String>();

		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();

			String airport = request.getParameter("airportid");
			
			//Make a SELECT query from the flight table with the airportid
			String str = "SELECT departureairport, destinationairport FROM flight WHERE departureairport = " + airport + " OR destinationairport = " + airport;

			ResultSet result = stmt.executeQuery(str);


			out.print("<table>");


			out.print("<tr>");

			out.print("<td>");

			out.print("departureairport");
			out.print("</td>");

			out.print("<td>");
			out.print("destinationairport");
			out.print("</td>");


			while (result.next()) {

				out.print("<tr>");

				out.print("<td>");


				out.print(result.getString("departureairport"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("destinationairport"));
				out.print("</td>");
				out.print("<td>");

			}
			out.print("</table>");
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>