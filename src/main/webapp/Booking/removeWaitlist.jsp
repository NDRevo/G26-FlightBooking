<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

	String flightid = request.getParameter("flightid");
	Object user = session.getAttribute("user");
	
	
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement deleteUserFromWaitlist = con.createStatement();
    
    
    try {
    	deleteUserFromWaitlist.executeUpdate("delete from waitlist where username='"+user.toString()+"' and flightid = '"+flightid+"'");
        response.sendRedirect("../profile.jsp");
    } catch(Exception e){
    	out.println("Delete failed, <a href='../profile.jsp'>try again</a>," + e);
    }


    
%>