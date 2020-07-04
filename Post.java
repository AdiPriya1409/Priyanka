package com.getImage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getImageDao.ImageDao;

/**
 * Servlet implementation class Post
 */
@WebServlet("/Post")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.sendRedirect("post.jsp");
		 int id=Integer.parseInt(request.getParameter("id"));
		  ServletOutputStream os = null;
			ImageDao Dao=null;
		    Dao = new ImageDao();
		    byte[] image = Dao.getImage(id);
		    os = response.getOutputStream();
		    os.write(image);
		    os.flush();
		    os.close(); 
	}

}
