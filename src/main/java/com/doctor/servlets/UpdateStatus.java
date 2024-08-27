package com.doctor.servlets;

import java.io.IOException;

import com.connection.DbConnection;
import com.dao.AppointmentDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comment = req.getParameter("comment");
			HttpSession httpSession = req.getSession();
			
			AppointmentDao appointmentDao = new AppointmentDao(DbConnection.getConnection());
            if(appointmentDao.updateCommentStatus(comment, id, did)) {
            httpSession.setAttribute("successMessage", "Status Changed !!");
            resp.sendRedirect("doctor/patients.jsp");
            }
            else
            {
                httpSession.setAttribute("errorMessage", "Error !!");
                resp.sendRedirect("doctor/patients.jsp");

            }

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
