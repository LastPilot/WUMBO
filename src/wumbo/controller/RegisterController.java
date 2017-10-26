package wumbo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/Register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get info from registration page
		String user = request.getParameter("username");
		String name = request.getParameter("studentName");
		String email = request.getParameter("email");
		int cin = Integer.parseInt(request.getParameter("cin"));
		String pass = request.getParameter("password");

		// retrieve data from database
		Connection c = null;
		try {
			// connect
			String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
			String username = "cs3337stu04";
			String password = "f9k.cwxn";
			c = DriverManager.getConnection(url, username, password);
			
			// Check if user entered email is connected to the email in the cin table
			String validate = "select email from cins where email = ?";
			PreparedStatement ps01 = c.prepareStatement(validate);
			ps01.setString(1, email);
			ResultSet rs = ps01.executeQuery();
			
			if (!rs.next()) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();

				out.println("<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>");
				out.println("<script>");
				out.println("$(function() {$('#emailmatching').show();});");
				out.println("</script>");

				request.getRequestDispatcher("/WEB-INF/jsp/Register.jsp").include(request, response);
				return;
			}

			// create student
			String insert = "insert into students (username, student_name, email, cin, password) values (?, ?, ?, ?, ?)";
			PreparedStatement ps02 = c.prepareStatement(insert);
			ps02.setString(1, user);
			ps02.setString(2, name);
			ps02.setString(3, email);
			ps02.setInt(4, cin);
			ps02.setString(5, pass);
			ps02.executeUpdate();

			// update cin to used so it cannot be used by a new user
			String used = "update cins set is_used = true where cin = ?";
			PreparedStatement ps03 = c.prepareStatement(used);
			ps03.setInt(1, cin);
			ps03.executeUpdate();

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

		response.sendRedirect("Login");

	}

}
