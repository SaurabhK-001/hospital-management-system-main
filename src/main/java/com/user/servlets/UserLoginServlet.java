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

@WebServlet("/user-login")
public class UserLoginServlet extends HttpServlet {

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
			UserDao dao = new UserDao(DbConnection.getConnection());
			User login = dao.login(email, password);
			

			if (login!=null) {
				session.setAttribute("successMessage", "USER LOGIN SUCCESSFULL !!");
				session.setAttribute("userObj", login);
				resp.sendRedirect("index.jsp");
			} else {
				resp.sendRedirect("user.jsp");
				session.setAttribute("errorMessage", "INVALID USERNAME AND PASSWORD !!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
