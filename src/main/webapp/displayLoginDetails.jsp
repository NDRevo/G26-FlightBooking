<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelBusiness","root", "NDuran");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        response.sendRedirect("mainpage.jsp");
    } else {
        out.println("Invalid password <a href='login.html'>try again</a>");
    }
%>