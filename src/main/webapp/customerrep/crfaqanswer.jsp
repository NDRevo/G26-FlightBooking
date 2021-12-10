<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%


	String questionid = request.getParameter("questionid");
	Object user = session.getAttribute("user");
	String responsetext = request.getParameter("responsetext");
	
	
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement statement = con.createStatement();

    try {
    	statement.executeUpdate("insert into responses (questionid, username, text, isreply) value ('"+questionid +
				 "','" +  user + "','" + responsetext + "', 1)");
		 
        response.sendRedirect("crfaq.jsp");
    } catch(Exception e){
    	out.println("Insert failed, <a href='crfaq.jsp'>try again</a>, " + e);
    }


    
%>