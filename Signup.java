package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.Dao.LoginDao;
import com.login.Dao.SignupDao;

import at.favre.lib.crypto.bcrypt.BCrypt;

@WebServlet("/Signup") 
public class Signup extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reg=request.getParameter("reg");
		
		
		String uname=request.getParameter("uname");
		String lname=request.getParameter("lname");
		String pass=request.getParameter("pass");
		//String hashpass = BCrypt.hashpw(pass, BCrypt.gensalt());
		//BCrypt.Verifier();
		
		String email=request.getParameter("email");
		BigDecimal mobile=new BigDecimal(request.getParameter("mobile"));
		String hostel=request.getParameter("hostel");
		int room= Integer.parseInt(request.getParameter("room"));
		//String cpass=request.getParameter("cpass");
		//LoginDao loginDao = new LoginDao();
		SignupDao Dao = new SignupDao();
		 System.out.println("I'm in Signup");
		 HttpSession session = request.getSession();
		 if(Dao.check(reg))
	        {
			    String message = "This registration no. already exists.";
				
				session.setAttribute("alreadyRegister", message);
				response.sendRedirect("signup.jsp"); 	
	        }
			else
			{
				int a=Dao.insert(reg,uname,lname,email,mobile,hostel,pass,room);
				if(a>0) {
				session.setAttribute("username", uname);
				response.sendRedirect("welcome.jsp");
				//PrintWriter ot= response.getWriter();
				//response.setContentType("text/html");
				//ot.println("<a href=\"index.jsp\"><h1><center>Account Created......Go to Home page to login in to your account</center><h1></a>");
				   //ot.println("Account Created");
				}
				else
				{
					String message = "data too long for some fields";
					session.setAttribute("signupException", message); 
					response.sendRedirect("signup.jsp"); 
				}
			}
		 
		 
		
		
		
	}

}
