package com.admin.servlets;

import java.io.IOException;

import com.connection.DbConnection;
import com.dao.SpecialistsDao;
import com.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add-specialist")
public class AddSpecialistServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String specName = req.getParameter("spec_name");
		
		SpecialistsDao dao = new SpecialistsDao(DbConnection.getConnection());
		
		boolean specialist = dao.addSpecialist(specName);
		
		HttpSession session = req.getSession();
		
		
		if(specialist)
		{
		    session.setAttribute("successMessage", "SPECIALIST ADDED SUCCESSFULLY !!");
			session.setAttribute("adminObj", new User());
			resp.sendRedirect("admin/index.jsp");
		}
		else
		{
			resp.sendRedirect("admin/index.jsp");
			session.setAttribute("errorMessage", "SOMETHING WENT WRONG !!");
		}
		
		
		
	}

}
