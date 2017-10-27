package wumbo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wumbo.model.Course;
import wumbo.model.Person;

@WebServlet("/AdminHome")
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminHomeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person user = (Person) session.getAttribute("user");

		if (user.isAdmin()) {
			List<Person> students = new ArrayList<Person>();
			List<Course> courses = new ArrayList<Course>();
			// retrieve data from database
			Connection c = null;
			try {
				// connect
				String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
				String username = "cs3337stu04";
				String password = "f9k.cwxn";
				c = DriverManager.getConnection(url, username, password);

				String sql = " select * from persons p inner join cins c on p.cin = c.cin where p.is_admin = 0";
				Statement st = c.createStatement();
				ResultSet rs = st.executeQuery(sql);

				while (rs.next()) {
					students.add(
							new Person(rs.getString("person_name"), rs.getString("username"), rs.getString("email"),
									rs.getInt("cin"), rs.getString("password"), rs.getBoolean("is_admin"), rs.getDouble("gpa")));
				}

				session.setAttribute("students", students);
				
				String sql2 = "select * from courses";
				Statement st2 = c.createStatement();
				ResultSet rs2 = st2.executeQuery(sql2);

				// create while loop
				while (rs2.next()) // starts at top of table and goes down row each time its a boolean if there is
									// no next row it stops
				{
					Course course = new Course(rs2.getString("code"), rs2.getString("name"), rs2.getFloat("units"),
							rs2.getString("coordinator"), rs2.getBoolean("available"), rs2.getString("semester"),
							rs2.getString("prerequisites"), rs2.getFloat("year"));
					courses.add(course);
				}
				session.setAttribute("courses", courses);

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

			request.getRequestDispatcher("/WEB-INF/jsp/AdminHome.jsp").forward(request, response);
		} else {
			response.sendRedirect("Login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
