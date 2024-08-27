package com.user.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user-logout")
public class UserLogout extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        HttpSession httpSession = req.getSession();
		
	    httpSession.removeAttribute("userObj");
		
	    httpSession.setAttribute("successMessage", "USER LOGGED OUT !!");
	    resp.sendRedirect("user.jsp");
		
		
	}

}
