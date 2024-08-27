package com.user.servlets;

import java.io.IOException;

import com.connection.DbConnection;
import com.dao.AppointmentDao;
import com.entities.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		int userId = Integer.parseInt(req.getParameter("userId")); 
		String fullname = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appointDate = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phone = req.getParameter("phno");
		String disease = req.getParameter("disease");
		int doctorId = Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");
		
		Appointment appointment = new Appointment(userId, fullname, gender, age, appointDate, email, phone, disease, doctorId, address, "Pending");

		AppointmentDao dao = new AppointmentDao(DbConnection.getConnection());
		
		HttpSession httpSession = req.getSession();
		
		if(dao.addAppointment(appointment))
		{
			httpSession.setAttribute("successMessage", "Appointment Booked !!");
			resp.sendRedirect("appointment.jsp");
		}
		else
		{
			httpSession.setAttribute("errorMessage", "Appointment Booking Failed !!");
			resp.sendRedirect("appointment.jsp");
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
