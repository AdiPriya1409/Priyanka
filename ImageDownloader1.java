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
 * Servlet implementation class ImageDownloader1
 */
@WebServlet("/ImageDownloader1")
public class ImageDownloader1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 int id=Integer.parseInt(request.getParameter("id"));
		  ServletOutputStream os = null;
			ImageDao Dao=null;
		    Dao = new ImageDao();
		    byte[] image = Dao.getImage1(id);
		    os = response.getOutputStream();
		    os.write(image);
		    os.flush();
		    os.close(); 
	}

}
