package wumbo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

import wumbo.model.Person;

@WebServlet("/AdminCourse")
public class AdminCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// private List<Course> shifters = new ArrayList<Course>();

	public AdminCourseController() {
		super();
	}

	// @SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person user = (Person) session.getAttribute("user");
		String code = request.getParameter("hidden");
		String coordinator = request.getParameter("coordinator");
		String semester = request.getParameter("sem");

		if (user.isAdmin() && user != null) {
			// retrieve data from database
			Connection c = null;
			try {
				// connect
				String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
				String username = "cs3337stu04";
				String password = "f9k.cwxn";
				c = DriverManager.getConnection(url, username, password);

				// main algorithm for shifting
				List<Integer> courseSem = new ArrayList<Integer>();
				List<String> courseID = new ArrayList<String>();
				List<String> change = new ArrayList<String>();
				String sql = "select * from semester s inner join courses c on c.code = s.c1 or c.code = s.c2"
						+ " or c.code = s.c3 or c.code = s.c4 where c.code = ?";
				PreparedStatement p = c.prepareStatement(sql);
				p.setString(1, code);
				ResultSet rs1 = p.executeQuery();

				int sem = 0;
				boolean isPre = true;
				String prereq = code;

				if (rs1.next()) {
					change.add(prereq);
					sem = rs1.getInt("sem");

					if (rs1.getString("code").equals(rs1.getString("c1"))) {
						courseSem.add(sem);
						courseID.add("c1");
					} else if (rs1.getString("code").equals(rs1.getString("c2"))) {
						courseSem.add(sem);
						courseID.add("c2");
					} else if (rs1.getString("code").equals(rs1.getString("c3"))) {
						courseSem.add(sem);
						courseID.add("c3");
					} else {
						courseSem.add(sem);
						courseID.add("c4");
					}
				}

				while (isPre && semester.equals("Spring")) {
					sem++;
					String sql2 = "select * from semester s inner join courses c on c.code = s.c1 or c.code = s.c2"
							+ " or c.code = s.c3 or c.code = s.c4 where c.prerequisites = ? and sem = " + sem;
					PreparedStatement p2 = c.prepareStatement(sql2);
					p2.setString(1, prereq);
					ResultSet rs = p2.executeQuery();

					if (rs.next()) {
						prereq = rs.getString("code");
						change.add(prereq);

						if (rs.getString("code").equals(rs.getString("c1"))) {
							courseSem.add(rs.getInt("sem"));
							courseID.add("c1");
						} else if (rs.getString("code").equals(rs.getString("c2"))) {
							courseSem.add(rs.getInt("sem"));
							courseID.add("c2");
						} else if (rs.getString("code").equals(rs.getString("c3"))) {
							courseSem.add(rs.getInt("sem"));
							courseID.add("c3");
						} else {
							courseSem.add(rs.getInt("sem"));
							courseID.add("c4");
						}
					} else {
						isPre = false;

						String sql3 = "select * from semester s inner join courses c on c.code = s.c1 or c.code = s.c2"
								+ " or c.code = s.c3 or c.code = s.c4 where c.code like 'CSE%' and sem = " + sem;
						Statement st = c.createStatement();
						ResultSet rs3 = st.executeQuery(sql3);

						if (rs3.next()) {
							change.add(rs3.getString("code"));

							if (rs3.getString("code").equals(rs3.getString("c1"))) {
								courseSem.add(rs3.getInt("sem"));
								courseID.add("c1");
							} else if (rs3.getString("code").equals(rs3.getString("c2"))) {
								courseSem.add(rs3.getInt("sem"));
								courseID.add("c2");
							} else if (rs3.getString("code").equals(rs3.getString("c3"))) {
								courseSem.add(rs3.getInt("sem"));
								courseID.add("c3");
							} else {
								courseSem.add(rs3.getInt("sem"));
								courseID.add("c4");
							}
						}
					}
				}

				for (int i = 0; i < change.size(); i++) {
					String course = courseID.get(i);
					int newSem = courseSem.get(i);
					
					if (i == 0) {
						String classCode = change.get(change.size() - 1);
						String updater = "update semester set " + course + " = '" + classCode + "' where sem = " + newSem;
						Statement st2 = c.createStatement();
						st2.executeUpdate(updater);
					} else {
						String classCode = change.get(i - 1);
						String updater = "update semester set " + course + " = '" + classCode + "' where sem = " + newSem;
						Statement st2 = c.createStatement();
						st2.executeUpdate(updater);
					}
				}

				String sql4 = "update courses set coordinator = ?, semester = ? where code = ?";
				PreparedStatement p4 = c.prepareStatement(sql4);
				p4.setString(1, coordinator);
				p4.setString(2, semester);
				p4.setString(3, code);
				p4.executeUpdate();

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
