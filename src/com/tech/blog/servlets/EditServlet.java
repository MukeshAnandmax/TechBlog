package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		PrintWriter out = response.getWriter();

		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String gender = request.getParameter("user_gender");
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");

		Part part = request.getPart("user_profile");

		String imgName = part.getSubmittedFileName();

		// get user from session

		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");

		user.setName(name);
		user.setEmail(email);
		user.setGender(gender);
		user.setPassword(password);
		user.setAbout(about);
		String oldfile = user.getProfile();
		
		// while editing profile  details if we don't change photo then we will get ""(blank img name from profile.jsp)
		if (!imgName.equals("")) {
			user.setProfile(imgName);
		}else {
			user.setProfile(oldfile);
		}

		// Update Database

		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		boolean f = userdao.updateUser(user);

		if (f) {
			
			String path = request.getRealPath("/") + "Profilepic" + File.separator + user.getProfile();
			
			String oldfilepath = request.getRealPath("/") + "Profilepic" + File.separator + oldfile;
			

			if (!imgName.equals("")) {

				if (!(oldfile.equalsIgnoreCase("Femaledefault.png") || oldfile.equalsIgnoreCase("Maledefault.png"))) {
					Helper.deleteFile(oldfilepath);
				}

				if (Helper.saveFile(part.getInputStream(), path) || f) {
					// out.println("Profile Updated.");

					Message msg = new Message("Profile Updated...", "success", "alert-success");

					s.setAttribute("msg", msg);

					response.sendRedirect("Profile.jsp");
				} else {

					Message msg = new Message("Profile Not Updated...", "error", "alert-danger");

					s.setAttribute("msg", msg);

					response.sendRedirect("Profile.jsp");

				}
			}else {
				Message msg = new Message("Profile Updated...", "success", "alert-success");

				s.setAttribute("msg", msg);

				response.sendRedirect("Profile.jsp");
				
			}

		} else {
			Message msg = new Message("Profile Not Updated...", "error", "alert-danger");

			s.setAttribute("msg", msg);

			response.sendRedirect("Profile.jsp");
		}

	}

}
