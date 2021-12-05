package com.group26project.pkg;

import java.sql.*;

public class ApplicationDB {
	
	public ApplicationDB(){
		
	}

	public Connection getConnection(){
		
		//Create a connection string
		String connectionUrl = "jdbc:mysql://localhost:3306/TravelBusiness";
		Connection connection = null;
		
		try {
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			//Create a connection to your DB
			connection = DriverManager.getConnection(connectionUrl,"root", "NDuran");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet getAllAvailableFlights(Statement stmt) throws SQLException {
		String str = 
				
				"SELECT  flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, econfare, 'Monday' as 'dow' "+
				"FROM  flight, daysofoperation " +
				"Where daysofoperation.monday = 1 and flight.dooid = daysofoperation.dooid " +

				" UNION " +

				"SELECT  flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, econfare, 'Tuesday' as 'dow' " +
				"FROM  flight, daysofoperation " +
				"Where daysofoperation.tuesday = 1 and flight.dooid = daysofoperation.dooid " +

				" UNION " +

				"SELECT  flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, econfare, 'Wednesday' as 'dow' " +
				"FROM  flight, daysofoperation " +
				"Where daysofoperation.wednesday = 1 and flight.dooid = daysofoperation.dooid " +

				" UNION " +

				"SELECT  flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, econfare, 'Thursday' as 'dow' " +
				"FROM  flight, daysofoperation " +
				"Where daysofoperation.thursday = 1 and flight.dooid = daysofoperation.dooid " +

				" UNION " +

				"SELECT  flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, econfare, 'Friday' as 'dow' " +
				"FROM  flight, daysofoperation " +
				"Where daysofoperation.friday = 1 and flight.dooid = daysofoperation.dooid " +

				" UNION " +

				"SELECT  flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, econfare, 'Saturday' as 'dow' " +
				"FROM  flight, daysofoperation " +
				"Where daysofoperation.saturday = 1 and flight.dooid = daysofoperation.dooid " +

				" UNION " +

				"SELECT  flightid, arrivaltime, departuretime, departureairport, destinationairport, companyid, aircraftid, econfare, 'Sunday' as 'dow' " +
				"FROM  flight, daysofoperation " +
				"Where daysofoperation.sunday = 1 and flight.dooid = daysofoperation.dooid ";
		
		 	return stmt.executeQuery(str);
	}
	
	
	
	
	
	public static void main(String[] args) {
		
		//SHOULD RUN LOGIN.HTML
		
		ApplicationDB dao = new ApplicationDB();
		Connection connection = dao.getConnection();
		
		System.out.println(connection);		
		dao.closeConnection(connection);
	}
	
	

}
