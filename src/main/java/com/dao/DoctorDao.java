package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



import com.entities.Doctor;

public class DoctorDao {

	private Connection connection;

	public DoctorDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean registerDoctor(Doctor doctor) {
		boolean flag = false;

		try {

			String sql = "insert into doctor(full_name, dob, qualification, specialist, email, mobno, password)values(?,?,?,?,?,?,?);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, doctor.getFullName());
			preparedStatement.setString(2, doctor.getDob());
			preparedStatement.setString(3, doctor.getQualification());
			preparedStatement.setString(4, doctor.getSpecialist());
			preparedStatement.setString(5, doctor.getEmail());
			preparedStatement.setString(6, doctor.getMobNo());
			preparedStatement.setString(7, doctor.getPassword());
			int result = preparedStatement.executeUpdate();

			if (result == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

	public List<Doctor> getAllDoctors() {
		List<Doctor> list = new ArrayList<Doctor>();

		Doctor doctor = null;

		try {

			String sql = "Select * from doctor order by id desc;";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				doctor = new Doctor();

				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setDob(resultSet.getString(3));
				doctor.setQualification(resultSet.getString(4));
				doctor.setSpecialist(resultSet.getString(5));
				doctor.setEmail(resultSet.getString(6));
				doctor.setMobNo(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));

				list.add(doctor);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Doctor getDoctorById(int id) {

		Doctor doctor = null;

		try {

			String sql = "Select * from doctor where id = ?;";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				doctor = new Doctor();

				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setDob(resultSet.getString(3));
				doctor.setQualification(resultSet.getString(4));
				doctor.setSpecialist(resultSet.getString(5));
				doctor.setEmail(resultSet.getString(6));
				doctor.setMobNo(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctor;
	}

	public boolean updateDoctor(Doctor doctor) {
		boolean flag = false;

		try {

			String sql = "update doctor set full_name = ?, dob = ?, qualification = ?, specialist = ?, email = ?, mobno = ?, password = ? where id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, doctor.getFullName());
			preparedStatement.setString(2, doctor.getDob());
			preparedStatement.setString(3, doctor.getQualification());
			preparedStatement.setString(4, doctor.getSpecialist());
			preparedStatement.setString(5, doctor.getEmail());
			preparedStatement.setString(6, doctor.getMobNo());
			preparedStatement.setString(7, doctor.getPassword());
			preparedStatement.setInt(8, doctor.getId());

			int result = preparedStatement.executeUpdate();

			if (result == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

	public boolean deleteDoctor(int id) {
		boolean flag = false;

		try {
			String sql = "delete from doctor where id = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			int i = preparedStatement.executeUpdate();
			System.out.println(i);

			if (i == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public Doctor loginDoctor(String email, String password) {
		Doctor doctor = null;

		try {
			String sql = "select * from doctor where email = ? and password = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			ResultSet res = preparedStatement.executeQuery();

			while (res.next()) {
				
				doctor = new Doctor();

				doctor.setId(res.getInt(1));
				doctor.setFullName(res.getString(2));
				doctor.setDob(res.getString(3));
				doctor.setQualification(res.getString(4));
				doctor.setSpecialist(res.getString(5));
				doctor.setEmail(res.getString(6));
				doctor.setMobNo(res.getString(7));
				doctor.setPassword(res.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctor;
	}
	
	
	public int countDoctor()
	{
		int i = 0;
		
		try {
			String sql = "Select * from doctor;";
			PreparedStatement preparedStatement= connection.prepareStatement(sql);
		     ResultSet resultSet = preparedStatement.executeQuery();
		     while(resultSet.next())
		     {
		    	 i++;
		     }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countAppointment()
	{
		int i = 0;
		
		try {
			String sql = "Select * from appointment;";
			PreparedStatement preparedStatement= connection.prepareStatement(sql);
		     ResultSet resultSet = preparedStatement.executeQuery();
		     while(resultSet.next())
		     {
		    	 i++;
		    	 System.out.println(i);
		     }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	
	public int countUser()
	{
		int i = 0;
		
		try {
			String sql = "Select * from users;";
			PreparedStatement preparedStatement= connection.prepareStatement(sql);
		     ResultSet resultSet = preparedStatement.executeQuery();
		     while(resultSet.next())
		     {
		    	 i++;
		     }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	public int countSpecialist()
	{
		int i = 0;
		
		try {
			String sql = "Select * from specialist;";
			PreparedStatement preparedStatement= connection.prepareStatement(sql);
		     ResultSet resultSet = preparedStatement.executeQuery();
		     while(resultSet.next())
		     {
		    	 i++;
		     }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int countAppointmentByDoctorId(int docId)
	{
		int i = 0;
		
		try {
			String sql = "Select * from appointment where doctor_Id = ?;";
			PreparedStatement preparedStatement= connection.prepareStatement(sql);
			preparedStatement.setInt(1, docId);
		     ResultSet resultSet = preparedStatement.executeQuery();
		     
		     while(resultSet.next())
		     {
		    	 i++;
		    	 System.out.println(i);
		     }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	
	
	

}
