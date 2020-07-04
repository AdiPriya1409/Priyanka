package com.login.Dao;

import java.math.BigDecimal;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

//import com.mysql.cj.jdbc.DatabaseMetaData;
import com.connection.*;
import com.login.Signup;
public class SignupDao {
private	String sql = "insert into accounts_profile() values(?,?,?,?,?,?,?,?,?)";
private String getD = "select * from accounts_profile where reg_no=?";
	Signup sign = new Signup();
	int a;
	 public int insert(String reg,String uname,String lname, String email,BigDecimal mobile,String hostel,String pass, int room)
	 {
		try {
			
			Connection con = ConnectionProvider.getConnection();
			System.out.println("I'm in SignupDao");
			
			
			
			 
			 java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			
		    PreparedStatement st= con.prepareStatement(sql);
			st.setString(1,reg);
			st.setString(2, uname);
			st.setString(3, lname);
			st.setString(4, email);
			st.setBigDecimal(5, mobile);
			st.setString(6,hostel);
			st.setString(7,pass);
			st.setTimestamp(8, date);
			st.setInt(9, room);
			 System.out.println("I'm in SignupDao after");
			 a= st.executeUpdate();
			 if(a>0)
				 
				 System.out.println("table updated");
			 else {
				 System.out.println("Not updated");
				 
			 }
		
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return a; 
	 }
	 
	 //Check for already registered user
	 
	 public boolean check(String reg)
	 {
		try {
			String sqlf = "select * from accounts_profile where reg_no=?";
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement st= con.prepareStatement(sqlf);
			st.setString(1,reg);
		
			ResultSet rs = st.executeQuery();
			
			//System.out.println("reg_no"+ re);
			//System.out.println("reg_no"+ps );
			if(rs.next())
			{
				/*String re= rs.getString(1);
				String ps=rs.getString(6);
				System.out.println("reg_no"+ re);
				System.out.println("reg_no"+ ps);*/
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		 
	 }

	public ResultSet getData(String reg)
	{
		ResultSet rs=null;
		try {
			
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement st= con.prepareStatement(getD);
			st.setString(1,reg);
		
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
