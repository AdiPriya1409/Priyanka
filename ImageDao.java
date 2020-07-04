package com.getImageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.connection.ConnectionProvider;

public class ImageDao {
private final String  sql="select * from sell";
private final String  getImageQuery="select * from sell where Item=?";
	Connection con=null;
	PreparedStatement st=null;
	ResultSet rs=null;
	//Connection con=ConnectionProvider.getConnection(); 
	
public List<ImageDto> getData()
{
	System.out.println("I'm in imageDao");
ImageDto imageDto = null;
List<ImageDto> imageList=new ArrayList<ImageDto>();
	//List<Integer> imageList =(List<Integer>) new ArrayList<Integer>();
	//int imageList[];    //declaring array
	//imageList = new int[20];
	try {
		con=ConnectionProvider.getConnection();
		st=con.prepareStatement(sql);
		rs = st.executeQuery();
		int i=0;
		while(rs.next())
		{
			imageDto=new ImageDto();
			imageDto.setId(rs.getInt("Item"));
			 //imageDto.add(rs.getInt("Item"));
			imageList.add(imageDto);
			System.out.println("id"+imageDto);
			 i++;
			//rs.next();
		}
		System.out.println(i);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	System.out.println("no. of images "+imageList.size());
	return imageList;
}

public byte[] getImage(int id)
{
	byte[] image=null;
	try {
		con=ConnectionProvider.getConnection();
		st=con.prepareStatement(getImageQuery);
		st.setInt(1, id);
		rs= st.executeQuery();
		if(rs.next())
		{
			image = rs.getBytes("img1");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return image;
}

public byte[] getImage1(int id)
{
	byte[] image=null;
	try {
		con=ConnectionProvider.getConnection();
		st=con.prepareStatement(getImageQuery);
		st.setInt(1, id);
		rs= st.executeQuery();
		if(rs.next())
		{
			image = rs.getBytes("img2");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return image;
}
public String getPrice(int id)
{
	String price=null;
	try {
		con=ConnectionProvider.getConnection();
		st=con.prepareStatement(getImageQuery);
		st.setInt(1, id);
		rs= st.executeQuery();
		if(rs.next())
		{
			price = rs.getString("set_a_price");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return price;
}
public String getTitle(int id)
{
	String title=null;
	try {
		con=ConnectionProvider.getConnection();
		st=con.prepareStatement(getImageQuery);
		st.setInt(1, id);
		rs= st.executeQuery();
		if(rs.next())
		{
			title = rs.getString("Ad_title");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return title;
}

/* To get Item ids for all ads*/
public List<ImageDto> getData(String reg)
{
	System.out.println("I'm in imageDao");
ImageDto imageDto = null;
List<ImageDto> imageList=new ArrayList<ImageDto>();
  String  getId="select * from sell where Reg=?";
	try {
		
		con=ConnectionProvider.getConnection();
		st=con.prepareStatement(getId);
		st.setString(1, reg);
		rs = st.executeQuery();
		int i=0;
		while(rs.next())
		{
			imageDto=new ImageDto();
			imageDto.setId(rs.getInt("Item"));
			 //imageDto.add(rs.getInt("Item"));
			imageList.add(imageDto);
			System.out.println("id"+imageDto);
			 i++;
			//rs.next();
		}
		System.out.println(i);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	System.out.println( "no. of images "+imageList.size());
	return imageList;
}

public ResultSet getItem(int id)
{
	ResultSet rs=null;
	try {
		String getItem="select * from sell where Item=?";
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement st= con.prepareStatement(getItem);
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
