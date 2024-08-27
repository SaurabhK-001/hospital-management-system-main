package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Specialists;

public class SpecialistsDao {
	
	private Connection connection;

	public SpecialistsDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean addSpecialist(String spec_name)
	{
		boolean flag = false;
		
		
		try {
			
			String sql = "insert into specialist(spec_name) values(?);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, spec_name);
			int executeUpdate = preparedStatement.executeUpdate();
			
			if(executeUpdate==1)
			{
				flag = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return flag;
		
	}
	
	
	
	
	public List<Specialists> getAllSpecialist()
	{
		
		List<Specialists> list = new ArrayList<Specialists>();
		
		Specialists s = null;
		
		try {
			String sql = "Select * from specialist;";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet executeQuery = preparedStatement.executeQuery();
			
			
			while(executeQuery.next())
			{
				s = new Specialists();
				
				s.setId(executeQuery.getInt(1));
				s.setSpecialistName(executeQuery.getString(2));
				
				list.add(s);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

}
