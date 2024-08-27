package com.user.servlets;

import java.io.IOException;

import com.connection.DbConnection;
import com.dao.UserDao;
import com.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user-register")
public class UserRegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User user = new User(name,email,password);
			
			UserDao dao = new UserDao(DbConnection.getConnection());
			boolean userRegister = dao.userRegister(user);
			
			HttpSession httpSession = req.getSession();
			
			
			if(userRegister)
			{
				httpSession.setAttribute("successMessage", "USER REGISTERED SUCCESSFULLY !!");
				resp.sendRedirect("register.jsp");
			}
			else
			{
				httpSession.setAttribute("errorMessage", "USER REGISTERED FAILED !!");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
