package wumbo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wumbo.model.Person;

@WebServlet("/AdminCourse")
public class AdminCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminCourseController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person user = (Person) session.getAttribute("user");
		String code = request.getParameter("hidden");
		String coordinator = request.getParameter("coordinator");
		boolean available = false;
		
		if (request.getParameter("a") != null) {
			available = true;
		}

		if (user.isAdmin() && user != null) {
			
			// retrieve data from database
			Connection c = null;
			try {
				// connect
				String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
				String username = "cs3337stu04";
				String password = "f9k.cwxn";
				c = DriverManager.getConnection(url, username, password);

				String sql = "update courses set coordinator = ?, available = ? where code = ?";
				PreparedStatement p = c.prepareStatement(sql);
				p.setString(1, coordinator);
				p.setBoolean(2, available);
				p.setString(3, code);
				p.executeUpdate();

			} catch (SQLException e) {
				throw new ServletException(e);
			} finally {
				try {
					if (c != null)
						c.close();
				} catch (SQLException e) {
					throw new ServletException(e);
				}
			}

			response.sendRedirect("AdminHome");
		} else {
			response.sendRedirect("Login");
		}
	}

}
