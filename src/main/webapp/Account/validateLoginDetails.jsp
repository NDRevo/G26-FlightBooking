<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.group26project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
   
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        response.sendRedirect("../Booking/flightSearch.jsp");
    } else {
        out.println("Invalid password <a href='../login.jsp'>try again</a>");
    }
%>