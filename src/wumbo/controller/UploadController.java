package wumbo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import wumbo.model.Person;

@WebServlet("/UploadController")
public class UploadController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UploadController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Person user = (Person) session.getAttribute("user");

		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// The directory we want to save the uploaded files to.
		String fileDir = getServletContext().getRealPath("/img/profile");

		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				// If the item is not a form field - meaning it's an uploaded
				// file, we save it to the target dir
				if (!item.isFormField()) {
					// item.getName() will return the full path of the uploaded
					// file, e.g. "C:/My Documents/files/test.txt", but we only
					// want the file name part, which is why we first create a
					// File object, then use File.getName() to get the file
					// name.
					String fileName = (new File(item.getName())).getName();
					
					// get suffix
					String suffix = "";
					int i = fileName.lastIndexOf('.');
					suffix = fileName.substring(i);
					
					// create file
					File file = new File(fileDir, user.getCin() + suffix);
					item.write(file);
					
					if (user.isAdmin()) {
						response.sendRedirect("AdminHome");
					} else {
						response.sendRedirect("Home");
					}

				}
			}

		} catch (Exception e) {
			throw new IOException(e);
		}
	}

}