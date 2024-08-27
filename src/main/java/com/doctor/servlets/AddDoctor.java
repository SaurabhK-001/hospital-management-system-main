package com.doctor.servlets;



import java.io.IOException;

import com.connection.DbConnection;
import com.dao.DoctorDao;
import com.entities.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		
		String fullName = req.getParameter("fullName");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String spec = req.getParameter("spec");
		String email = req.getParameter("email");
		String mobNo = req.getParameter("mobile");
		String password = req.getParameter("password");
		
		Doctor doctor = new Doctor(fullName, dob, qualification, spec, email, mobNo, password);
		System.out.println(doctor);
		DoctorDao dao = new  DoctorDao(DbConnection.getConnection());
		
		HttpSession session = req.getSession();
		
		if(dao.registerDoctor(doctor))
		{
			session.setAttribute("successMessage", "Doctor Added Successfully !!");
			resp.sendRedirect("admin/doctor.jsp");
		}
		else {
			session.setAttribute("errorMessage", "Error !!");

		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

}
