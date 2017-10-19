package wumbo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//import org.apache.common.fileupload.fileItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import sun.rmi.log.LogOutputStream;
import wumbo.model.Student;

@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Home() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String fullName = request.getParameter("name"); 
		String password = request.getParameter("password");
		Student name = (Student) request.getSession().getAttribute("user");
		
		HttpSession session = request.getSession();
		Student  student = new Student("bob", "bob1", "bob@yahoo.com", 1234, "bread"); 
		session.setAttribute("student", student);
		
		request.setAttribute("name", name);
		request.getRequestDispatcher("/WEB-INF/jsp/Home.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if(!ServletFileUpload.isMultipartContent(request)){
//			return;
//		}
//		FileItemFactory itemFactory = new DiskFileItemFactory();
//		ServletFileUpload upload = new ServletFileUpload(itemFactory);
//		try{
//			List <FileItem> items = upload.parseRequest(request);
//		}
//		catch{
//			
//		}
		
		
		Connection c = null;
		try {
			String url = "jdbc:mysql://localhost/cs3337stu04?useSSL=false";
			String username = "cs3337stu04";
			String password = "f9k.cwxn";
			c = DriverManager.getConnection(url, username, password);
			//getting info for student
			String sql = "Select * From students";
			
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
		
		doGet(request, response);
		
	}

}
