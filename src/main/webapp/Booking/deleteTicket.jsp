<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

	int availableseats = Integer.parseInt(request.getParameter("seatsavailable"));
	String flightid = request.getParameter("flightid");
	String ticketid = request.getParameter("ticketid");

	Object user = session.getAttribute("user");
	
	
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement deleteFlightFromTicket = con.createStatement();
    Statement deleteEntireTicket = con.createStatement();
    Statement updateFlight = con.createStatement();
    
    
    try {
        deleteFlightFromTicket.executeUpdate("delete from flightforticket where ticketid='"+ticketid+"' and flightid = '"+flightid+"'");
        deleteEntireTicket.executeUpdate("delete from ticketfor where ticketid NOT IN (select ticketid from flightforticket)");
        updateFlight.executeUpdate("update flight set seatsavailable = " + Integer.toString(availableseats+1) + " where flightid = '" + flightid + "'");
        
        response.sendRedirect("../profile.jsp");
    } catch(Exception e){
    	out.println("Delete failed, <a href='../profile.jsp'>try again</a>," + e);
    }


    
%>