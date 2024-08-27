package com.admin.servlets;

import java.io.IOException;

import com.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

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
			
			
			if("admin@gmail.com".equals(email) && "admin123".equals(password))
			{
			    session.setAttribute("successMessage", "LOGIN SUCCESSFULL !!");
				session.setAttribute("adminObj", new User());
				resp.sendRedirect("admin/index.jsp");
			}
			else
			{
				resp.sendRedirect("admin.jsp");
				session.setAttribute("errorMessage", "INVALID USERNAME AND PASSWORD !!");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
