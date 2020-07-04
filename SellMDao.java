package com.sellMDao;

import java.io.IOException;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.math.BigDecimal;

import com.connection.ConnectionProvider;
import com.sell.Bike;
import com.sell.Coding;
import com.sell.Electronic;
import com.sell.Exam;
import com.sell.Sports;
import com.sell.Study;
import com.sell.Technology;

/**
 * Servlet implementation class SellMDao
 */
@WebServlet("/SellMDao")

    public class SellMDao{
	Exam ex =new Exam();
	Study stu =new Study();
	Technology tc=new Technology();
	Electronic ec= new Electronic();
	Coding co =new Coding();
	Bike b=new Bike();
	Sports spo=new Sports();
	public String insert(String brand,String Reg,String choose,String published_year,String yea,String Ad_title,BigDecimal Mobile_no,String set_a_price,String Description,InputStream img1,InputStream img2 )
	{
		Connection con = null; 
        String message = null;
		try {
			 con =ConnectionProvider.getConnection();
			System.out.println("I m in sell Dao");
            String sql = "INSERT INTO sell(brand,Reg,choose,published_year,yea,Ad_title,Mobile_no,set_a_price,Description,img1,img2,date) values (?,?,?,?,?,?,?,?,?,?,?,?)";
            
            
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			 PreparedStatement st= con.prepareStatement(sql);
			    st.setString(1, brand);
			    st.setString(2,Reg);
			   // st.setInt(3,Item);
			    st.setString(3,choose);
			   st.setString(4, published_year);
	            st.setString(5, yea);
	            st.setString(6, Ad_title);
	            st.setBigDecimal(7, Mobile_no);
	            st.setString(8, set_a_price);
	            st.setString(9, Description);
	            
				

				if (img1 != null) {
		               
	                st.setBlob(10,img1);
	            }
				if (img2 != null) {
		               
	                st.setBlob(11,img2);
	            }
				st.setTimestamp(12, date);

				
				int a= st.executeUpdate();
				 if(a>0)
					 {
					 System.out.println("table updated");
					 message = "File uploaded and saved into database";
		             return message;
					}
				 else
					 System.out.println("Not updated");
				
			} catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();

				ex.printStackTrace();
			}
		 return message;     


			
		}

	
	public ResultSet getData(int id)
	{
		ResultSet rs=null;
		try {
			String getD="select * from sell where Item=?";
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement st= con.prepareStatement(getD);
			st.setInt(1,id);
		
			 rs = st.executeQuery();
			
			//System.out.println("reg_no"+ re);
			//System.out.println("reg_no"+ps );
			if(rs.next())
			{
				/*String re= rs.getString(1);
				String ps=rs.getString(6);
				System.out.println("reg_no"+ re);
				System.out.println("reg_no"+ ps);*/
				return rs;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
		 
	}

      
    }

	


