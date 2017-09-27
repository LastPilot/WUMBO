package wumbo.validate;

import java.io.IOException;
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

@WebServlet("/ValidateUser")
public class ValidateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ValidateStudent() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get user name
		String user = request.getParameter("user");
		boolean userSame = false;
		
		// retrieve data from database
		Connection c = null;
		try {
			// connect
			String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
			String username = "cs3337stu04";
			String password = "f9k.cwxn";
			c = DriverManager.getConnection(url, username, password);

			// See if user exists
			String check = "select username from students where username = ?";
			PreparedStatement ps = c.prepareStatement(check);
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				userSame = true;
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

		response.setContentType( "text/plain" );
		
		if (userSame) {			
	        response.getWriter().print(1);
		} else {
	        response.getWriter().print(0);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
