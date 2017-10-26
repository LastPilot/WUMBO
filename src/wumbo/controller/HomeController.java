package wumbo.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

//import org.apache.common.fileupload.fileItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import wumbo.model.Student;


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
		
		if (!user.isAdmin()) {
			request.getRequestDispatcher("/WEB-INF/jsp/Home.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("Login");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		Connection c = null;
//		try {
//			String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
//			String username = "cs3337stu04";
//			String password = "f9k.cwxn";
//			c = DriverManager.getConnection(url, username, password);
//			// getting info for student
//			// String sql = "Select * From students";
//
//		} catch (SQLException e) {
//			throw new ServletException(e);
//		} finally {
//			try {
//				if (c != null)
//					c.close();
//			} catch (SQLException e) {
//				throw new ServletException(e);
//			}
//		}

		doGet(request, response);

	}
}


