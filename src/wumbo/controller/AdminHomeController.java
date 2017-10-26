package wumbo.controller;

import java.io.IOException;

//import org.apache.common.fileupload.fileItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import wumbo.model.Student;
import javax.servlet.http.HttpSession;

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
