package wumbo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wumbo.model.Person;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
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
		request.getRequestDispatcher("/WEB-INF/jsp/Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get user name and password
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		boolean isStudent = false;
		boolean isAdmin = false;

		// retrieve data from database
		Connection c = null;
		try {
			// connect
			String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
			String username = "cs3337stu04";
			String password = "f9k.cwxn";
			c = DriverManager.getConnection(url, username, password);

			// verify login for student
			String student = "select * from persons p inner join cins c on p.cin = c.cin where p.username = ? and password = ? and p.is_admin = 0";
			PreparedStatement p = c.prepareStatement(student);
			p.setString(1, user);
			p.setString(2, pass);
			ResultSet rs = p.executeQuery();

			if (rs.next()) {
				Person currentUser = new Person(rs.getString("person_name"), rs.getString("username"),
						rs.getString("email"), rs.getInt("cin"), rs.getString("password"), rs.getBoolean("is_admin"),
						rs.getDouble("gpa"));
				HttpSession session = request.getSession();
				session.setAttribute("user", currentUser);
				isStudent = true;
			}

			// verify login for administrator
			String admin = "select * from persons p inner join cins c on p.cin = c.cin where p.username = ? and password = ? and p.is_admin = 1";
			PreparedStatement p2 = c.prepareStatement(admin);
			p2.setString(1, user);
			p2.setString(2, pass);
			ResultSet rs2 = p2.executeQuery();

			if (rs2.next()) {
				Person currentUser = new Person(rs2.getString("person_name"), rs2.getString("username"),
						rs2.getString("email"), rs2.getInt("cin"), rs2.getString("password"),
						rs2.getBoolean("is_admin"));
				HttpSession session = request.getSession();
				session.setAttribute("user", currentUser);
				isAdmin = true;
			}

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

		if (isStudent) {
			response.sendRedirect("Home");
		} else if (isAdmin) {
			response.sendRedirect("AdminHome");
		} else {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			out.println("<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>");
			out.println("<script>");
			out.println("$(function() {$('#matching').show();});");
			out.println("</script>");

			request.getRequestDispatcher("/WEB-INF/jsp/Login.jsp").include(request, response);
		}
	}

}
