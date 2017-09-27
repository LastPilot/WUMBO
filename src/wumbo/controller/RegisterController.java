package wumbo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
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

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/Register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get info from registration page
		String user = request.getParameter("username");
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

			// create student
			String insert = "insert into students (username, email, cin, password) values (?, ?, ?, ?)";
			PreparedStatement ps01 = c.prepareStatement(insert);
			ps01.setString(1, user);
			ps01.setString(2, email);
			ps01.setInt(3, cin);
			ps01.setString(4, pass);
			ps01.executeUpdate();

			// update cin to used so it cannot be used by a new user
			String used = "update cins set is_used = true where cin = ?";
			PreparedStatement ps02 = c.prepareStatement(used);
			ps02.setInt(1, cin);
			ps02.executeUpdate();

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
