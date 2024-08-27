package com.user.servlets;

import java.io.IOException;

import com.connection.DbConnection;
import com.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userPassword")
public class ChangePassword extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int id = Integer.parseInt(req.getParameter("id"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		HttpSession session = req.getSession();
		UserDao dao = new UserDao(DbConnection.getConnection());
		if(dao.checkOldPassword(id, oldPassword))
		{
		   
		    if(dao.changePassword(id, newPassword))
		    {
		    	 session.setAttribute("successMessage", "Password Changed Successfully !!");	
		    	 resp.sendRedirect("change_password.jsp");
		    }
		    else{
		    	session.setAttribute("errorMessage", "Something went wrong !!");
			    resp.sendRedirect("change_password.jsp");

		    }
		}
		else
		{
		    session.setAttribute("errorMessage", "Old Password Incorrect !!");
		    resp.sendRedirect("change_password.jsp");

		}
		
	}

}
