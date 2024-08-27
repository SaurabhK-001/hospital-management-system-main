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

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			HttpSession session = req.getSession();
			 DoctorDao dao = new  DoctorDao(DbConnection.getConnection());
		    Doctor login = dao.loginDoctor(email, password);
			

			if (login!=null) {
				session.setAttribute("successMessage", "DOCTOR LOGIN SUCCESSFULL !!");
				session.setAttribute("docObj", login);
				resp.sendRedirect("doctor/index.jsp");
			} else {
				resp.sendRedirect("doctor.jsp");
				session.setAttribute("errorMessage", "INVALID USERNAME AND PASSWORD !!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
