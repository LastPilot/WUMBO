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

@WebServlet("/ValidateCIN")
public class ValidateCIN extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ValidateCIN() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get cin
		String cin = request.getParameter("cin");
		boolean cinSame = false;
		
		// retrieve data from database
		Connection c = null;
		try {
			// connect
			String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
			String username = "cs3337stu04";
			String password = "f9k.cwxn";
			c = DriverManager.getConnection(url, username, password);

			// See if cin exists
			String check = "select cin from cins where cin = ? and is_used = false";
			PreparedStatement ps = c.prepareStatement(check);
			ps.setString(1, cin);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				cinSame = true;
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
		
		if (cinSame) {			
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
