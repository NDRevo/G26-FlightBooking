<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%


	String questionText = request.getParameter("newFaq");
	Object user = session.getAttribute("user");
	
	
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement statement = con.createStatement();

	Random rnd = new Random();
	int questionid = 100000 + rnd.nextInt(900000);
    
    try {
    	statement.executeUpdate("insert into responses (questionid, username, text, isreply) value ('"+questionid +
				 "','" +  user + "','" + questionText + "', 0)");
		 
        response.sendRedirect("faq.jsp");
    } catch(Exception e){
    	out.println("Insert failed, <a href='faq.jsp'>try again</a>," + e);
    }


    
%>