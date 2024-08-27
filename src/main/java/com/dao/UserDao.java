package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.User;

public class UserDao {

	private Connection connection;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean userRegister(User user) {
		boolean flag = false;
		try {

			String sql = "insert into users(name,email,password) values(?,?,?);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getFullName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());
			int executeUpdate = preparedStatement.executeUpdate();
			if (executeUpdate == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public User login(String email, String password) {

		User user = null;

		try {

			String query = "select * from users where email= ? and password = ?;";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			ResultSet executeQuery = preparedStatement.executeQuery();
			while (executeQuery.next()) {
				user = new User();
				user.setId(executeQuery.getInt(1));
				user.setFullName(executeQuery.getString(2));
				user.setEmail(executeQuery.getString(3));
				user.setPassword(executeQuery.getString(4));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}
	
	
	public boolean checkOldPassword(int userId, String oldPassword)
	{
		boolean flag = false;
		
		try {
			String sql= "select * from users where id = ? and password = ?;";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, userId);
			preparedStatement.setString(2, oldPassword);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	
	public boolean changePassword(int userId, String newPassword)
	{
		boolean flag = false;
		
		try {
			String sql= "update users set password = ? where id = ?;";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, newPassword);
			preparedStatement.setInt(2, userId);
			
			int i =  preparedStatement.executeUpdate();
			
			if(i==1)
			{
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	

}
