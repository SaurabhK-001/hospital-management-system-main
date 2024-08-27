package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	private static Connection connection;
	
	public static Connection getConnection()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/servlet";
			String username = "root";
			String password = "Harish@123";
			
			connection = DriverManager.getConnection(url,username,password);
			
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return connection;
	}

}
