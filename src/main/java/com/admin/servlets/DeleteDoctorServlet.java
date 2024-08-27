package com.admin.servlets;

import java.io.IOException;

import com.connection.DbConnection;
import com.dao.DoctorDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteDoctor")
public class DeleteDoctorServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));

		HttpSession session = req.getSession();

		DoctorDao dao = new DoctorDao(DbConnection.getConnection());
		if (dao.deleteDoctor(id)) {
			//System.out.println("H");
			session.setAttribute("successMessage", "Doctor Deleted Successfully !!");
			resp.sendRedirect("admin/view_doctor.jsp");
		} else {
			//System.out.println("Error");
			session.setAttribute("errorMessage", "Error !!");
			resp.sendRedirect("admin/view_doctor.jsp");
		}

	}

}
