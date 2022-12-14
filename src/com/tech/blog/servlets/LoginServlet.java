package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//out.println("<h1>"+email+"</h1>");
		//out.println("<h1>"+password+"</h1>");
		
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		
		User user = userdao.getUserByEmailAndPassword(email, password);
		
		if(user==null) {
			//out.println("<h1>Something went Wrong!!!, try Again...</h1>");
			Message msg = new Message("Invalid details, try another one..","error","alert-danger");
			
			HttpSession s= request.getSession();
			s.setAttribute("msg", msg);
			
			response.sendRedirect("Login_Page.jsp");
			
		}
		else {
			
			out.println("<h1>Go to profile page</h1>");
			HttpSession s =  request.getSession();
			s.setAttribute("currentUser", user);
			response.sendRedirect("Profile.jsp");
			
		}
		
		
		
		
		
		
		
	}

}
