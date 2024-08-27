package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Appointment;

public class AppointmentDao {

	private Connection connection;

	public AppointmentDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addAppointment(Appointment appointment) {
		boolean flag = false;

		try {
			String sql = "insert into appointment(user_Id, fullname, gender, age, appointDate, email, phone, disease, doctor_Id, addrress, status)values(?,?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, appointment.getUserId());
			preparedStatement.setString(2, appointment.getFullName());
			preparedStatement.setString(3, appointment.getGender());
			preparedStatement.setString(4, appointment.getAge());
			preparedStatement.setString(5, appointment.getAppointmentDate());
			preparedStatement.setString(6, appointment.getEmail());
			preparedStatement.setString(7, appointment.getPhNo());
			preparedStatement.setString(8, appointment.getDisease());
			preparedStatement.setInt(9, appointment.getDoctorId());
			preparedStatement.setString(10, appointment.getAddress());
			preparedStatement.setString(11, appointment.getStatus());

			int i = preparedStatement.executeUpdate();

			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
	
	public List<Appointment> getAllAppointmentUser(int userId)
	{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		try {
			String sql = "Select * from appointment where user_Id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, userId);
			ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next())
			{
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointmentDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhNo(rs.getString(8));
				appointment.setDisease(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));
				
				list.add(appointment);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	public List<Appointment> getAllAppointmentDoctor(int doctorId)
	{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		try {
			String sql = "Select * from appointment where doctor_Id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, doctorId);
			ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next())
			{
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointmentDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhNo(rs.getString(8));
				appointment.setDisease(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));
				
				list.add(appointment);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	public Appointment getAllAppointmentById(int appointmentId)
	{
		Appointment appointment = null;
		
		try {
			String sql = "Select * from appointment where id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, appointmentId);
			ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next())
			{
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointmentDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhNo(rs.getString(8));
				appointment.setDisease(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return appointment;
	}
	
	public boolean updateCommentStatus(String comment, int id, int docId)
	{
		boolean flag = false;
		
		try {
			String sql = "Update appointment set status = ? where id = ? and doctor_Id = ?;";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, comment);
			preparedStatement.setInt(2, id);
			preparedStatement.setInt(3, docId);
			
			int i = preparedStatement.executeUpdate();
			
			if(i==1)
			{
				flag = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	public List<Appointment> getAllAppointment()
	{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment appointment = null;
		
		try {
			String sql = "Select * from appointment order by id desc";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next())
			{
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointmentDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhNo(rs.getString(8));
				appointment.setDisease(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));
				
				list.add(appointment);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	

}
