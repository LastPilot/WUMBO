package wumbo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wumbo.model.Course;
import wumbo.model.Person;


@WebServlet("/Home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person user = (Person) session.getAttribute("user");

		if (!user.isAdmin() && user != null) {
			Map<Integer, List<Course>> semesters = new TreeMap<Integer, List<Course>>();
			
			// retrieve data from database
			Connection c = null;
			try {
				// connect
				String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
				String username = "cs3337stu04";
				String password = "f9k.cwxn";
				c = DriverManager.getConnection(url, username, password);				
				
				for (int i = 1; i <= 10; i++) {
					List<Course> courses = new ArrayList<Course>();
					
					// retrieves all courses for a semester for current user.
					String sql = "select * from courses c inner join semester s1 inner join persons p "
							+ "on p.cin = s1.cin and c.code = s1.c1 or c.code = s1.c2 or c.code = s1.c3 or c.code = s1.c4"
							+ " where s1.sem = " + i + " and p.cin = " + user.getCin();
					Statement st = c.createStatement();
					ResultSet rs = st.executeQuery(sql);
					
					int geCounter = 0;
					Course geRemainder = null;

					while (rs.next()) {
						geCounter++;
						Course course = new Course(rs.getString("code"), rs.getString("name"), rs.getFloat("units"),
								rs.getString("coordinator"), rs.getBoolean("available"), rs.getString("semester"),
								rs.getString("prerequisites"), rs.getFloat("year"));
						courses.add(course);
						
						if (rs.getString("code").equals("GE")) {
							geRemainder = course;
						}
					}
					
					// sql only retrieves one GE. This assures that the remaining are GEs.
					switch (geCounter) {
					case 3:
						courses.add(geRemainder);
						break;
					case 2:
						for (int j = 0; j < 2; j++) {
							courses.add(geRemainder);
						}
						break;
					case 1:
						for (int j = 0; j < 3; j++) {
							courses.add(geRemainder);
						}
						break;
					default:
						break;
					}
					
					semesters.put(i, courses);
				}
				
				session.setAttribute("semesters", semesters);

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

			request.getRequestDispatcher("/WEB-INF/jsp/Home.jsp").forward(request, response);
		} else {
			response.sendRedirect("Login");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}


