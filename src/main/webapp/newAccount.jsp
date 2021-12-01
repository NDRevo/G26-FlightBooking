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

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String newUser = request.getParameter("Newusername");
		String newFirstName = request.getParameter("firstname");
		String newLastName = request.getParameter("lastname");
		String newPass = request.getParameter("Newpassword");
		String role = ("customer");
		
		Integer userid = (Integer)session.getAttribute("userid");
		if ( userid == null ) { 
			userid = new Integer(1); 
			session.setAttribute("userid", userid); 
		} else {	userid = new Integer(userid.intValue() + 1);
			session.setAttribute("userid", userid); 
		}
	
		
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO users(userid, username, password, firstname, lastname, role)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setInt(1, userid);
		ps.setString(2, newUser);
		ps.setString(3, newPass);
		ps.setString(4, newFirstName);
		ps.setString(5, newLastName);
		ps.setString(6, "customer");

		//Run the query against the DB
		ps.executeUpdate();
		//Run the query against the DB
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		response.sendRedirect("mainpage.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>
</html>