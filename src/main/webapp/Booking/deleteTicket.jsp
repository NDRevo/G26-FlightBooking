<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

	String flightid = request.getParameter("flightid");
	String ticketid = request.getParameter("ticketid");
	Object user = session.getAttribute("user");
	
	
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement deleteFlightFromTicket = con.createStatement();
    Statement deleteEntireTicket = con.createStatement();
    
    try {
        deleteFlightFromTicket.executeUpdate("delete from flightforticket where ticketid='"+ticketid+"' and flightid = '"+flightid+"'");
        deleteEntireTicket.executeUpdate("delete from ticketfor where ticketid NOT IN (select ticketid from flightforticket)");
        
        response.sendRedirect("../profile.jsp");
    } catch(Exception e){
    	out.println("Delete failed, <a href='../profile.jsp'>try again</a>," + e);
    }


    
%>