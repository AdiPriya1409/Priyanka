<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.login.Dao.SignupDao" %>
    <%@page import="java.sql.ResultSet" %>
    
    <%@page import="java.util.ArrayList" %>
	<%@page import="com.getImageDao.ImageDto" %>
	<%@page import="com.getImageDao.ImageDao" %>
	<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<title>Exchange_Hub</title>

	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CMuli:400,700" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <link type="text/css" rel="stylesheet" href="css/style.css" />

<style>
.tabbody{
margin-top: 10%;



}
</style>
</head>
<body>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5efb13e79e5f694422919282/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->


<% 
 response.setHeader("Cache-Control", "no-store");
if(session.getAttribute("username") == null)
	 response.sendRedirect("index.jsp");
%>

<sction class="html body">
	<!-- HEADER -->
	<header id="header">
		<!-- NAV -->
		<div id="nav">
             <!-- Top Nav -->
			<div id="nav-top">
				<div class="container">
					<!-- social -->
					<ul class="nav-social">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram"></i></a></li>
					</ul>
					<!-- /social -->

					<!-- logo -->
					<div class="nav-logo">
						<a href="index.jsp" class="logo"><img src="./img/logo.png" alt=""></a>
					</div>
					<!-- /logo -->

					<!-- search & aside toggle -->
					<div class="nav-btns">
                        <button class="search-btn"><i class="fa fa-search"></i></button>
                        <%
							String url="#staticBackdrop",dataToggle="modal",Hello="";
                        Object profile="Login";
                     
							if (session.getAttribute("username") == null)
							{
								url = "#staticBackdrop";
								dataToggle="modal";
								profile="Login";
								Hello="";
							}
							else
							{
								url = "profile.jsp";
								dataToggle="null";
								Hello="Hello! ";
								profile=session.getAttribute("username");
							}
							
							//pageContext.setAttribute("url", url);
					     %>
					     <a  style="font-size:20px; margin-left: 5px;" data-toggle=<%= dataToggle %>  href=<%= url %>  role="button" aria-expanded="false" ><%= Hello %><%= profile %> </a>
                        <a class="" href="ncart.jsp" style="margin-left: 35px;"><i class="fa fa-cart-arrow-down fa-2x"><i class="fa" style="font-size:15px;">cart</i></i></a>
					    <button class="aside-btn" style="margin-left: 35px;"><i class="fa fa-bars"></i></button>
                       
						<div id="nav-search">
							<form>
								<input class="input" name="search" placeholder="Enter your search...">
							</form>
							<button class="nav-close search-close">
								<span></span>
							</button>
						</div>
					</div>
                    <!-- /search & aside toggle -->
                   
				</div>
			</div>
			<!-- /Top Nav -->

			<!-- Main Nav -->
			

			<!-- Aside Nav -->
			<div id="nav-aside">
				<ul class="nav-aside-menu">
					<li><a href="index.jsp">Home</a></li>
					<li class="has-dropdown"><a>Categories</a>
						<ul class="dropdown">
							<li><a href="#">Lifestyle</a></li>
							<li><a href="#">Fashion</a></li>
							<li><a href="#">Technology</a></li>
							<li><a href="#">Travel</a></li>
							<li><a href="#">Health</a></li>
						</ul>
					</li>
					<li><a href="about.jsp">About Us</a></li>
					<li><a href="contact.jsp">Contact Us</a></li>
					<%
							//String url="#staticBackdrop",dataToggle="modal";
							if (session.getAttribute("username") == null)
							{
								url = "#staticBackdrop";
								dataToggle="modal";
							}
							else
							{
								url = "sell.jsp";
								dataToggle="null";
							}
							
							//pageContext.setAttribute("url", url);
					     %>
					    <li><a  style="font-size:15px;" data-toggle=<%= dataToggle %>  href=<%= url %>  role="button" aria-expanded="false" >SELL </a>
					
				</ul>
				<button class="nav-close nav-aside-close"><span></span></button>
			</div>
			<!-- /Aside Nav -->
		</div>
		<!-- /NAV -->
	</header>
	<!-- /HEADER -->

</sction>

<div class="container tabbody">
  <h2 class="text-center mt-5">USER PROFILE</h2>
  <br>
  <!-- Nav pills -->
  <ul class="nav nav-pills" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="pill" href="#home">User profile</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#menu1">Active ADS</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#menu2">Sold ADS</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#menu3">All ADS</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" data-toggle="pill" href="#menu4">Change password</a>
    </li>
    <li>
      <form action="Logout" method="post">
       <a class="nav-link "><input type="Submit" value="logout" ></a>
      </form>
     
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active">
    	 <div class="card mt-5">
            <div class="card-header">
            	<div class="row">
				  <div class="col-sm-3 text-center">
				  	<h5>User profile</h5>
				  </div>
				  <div class="col-sm-6"></div>
				  <div class="col-sm-3">
  				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"> Edit</button>
			  </div>
			</div>
			      				
 			 </div>
			<div class="row mt-6">
				<div class="col-md-12 text-center">
					<img src="profile.jpg" alt="Cinque Terre" width="15%">
				</div>
 			 <div class="col-md-6">


     <%
          String reg= session.getAttribute("reg").toString();
          SignupDao Dao=null;
          Dao = new SignupDao();
          ResultSet rs = Dao.getData(reg);
     %>


     <table class="table table-striped mt-5">
    
    <tbody>
      <tr>
        <td><b>User Name</b></td>
        <td><%= rs.getString("fname") %>  <%= rs.getString("lname") %></td>
      </tr>
      <tr>
        <td><b>Ragistration Number</b></td>
        <td><%= reg %></td>
      </tr>
      <tr>
        <td><b>Email ID</b></td>
        <td><%= rs.getString("email") %></td>
      </tr>
    </tbody>
  </table>
  </div>
  <div class="col-md-6">


     <table class="table table-striped mt-5">
    
    <tbody>
      <tr>
        <td><b>Mobile Number</b></td>
        <td><%= rs.getBigDecimal("mobile") %></td>
      
      </tr>
      <tr>
        <td><b>Hostel name</b></td>
        <td><%= rs.getString("hostelname") %></td>
      </tr>
      <tr>
        <td><b>Room Number</b></td>
        <td><%= rs.getInt("room_no") %></td>
      </tr>
    </tbody>
  </table>
  </div>
  </div>
  </div>

</div>
   

    <div id="menu1" class="container tab-pane fade"><br>
       <div class="card mt-5">
            <div class="card-header">
      				<h5>Active ADS</h5>
 			 </div>
			<div class="row mt-6">
 			
  <div class="col-md-12">
<table class="table table-striped">
    <thead>
      <tr>
        <th>SN</th>
        <th>Item name</th>
        <th>Item Id</th>
        <th>Date</th>
        <th>Price</th>

      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr>
      <tr>
        <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr>
      <tr>
       <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr>
    </tbody>
  </table>

     
  </div>
  </div>
  </div>

    </div>
    <div id="menu2" class="container tab-pane fade"><br>
       <div class="card mt-5">
            <div class="card-header">
      				<h5>Sold ADS</h5>
 			 </div>
			<div class="row mt-6">
 			
  <div class="col-md-12">
<table class="table table-striped">
    <thead>
      <tr>
        <th>SN</th>
        <th>Item name</th>
        <th>Item Id</th>
        <th>Date</th>
        <th>Price</th>

      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr>
      <tr>
        <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr>
      <tr>
       <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr>
    </tbody>
  </table>

     
  </div>
  </div>
  </div>

    </div>
       <div id="menu3" class="container tab-pane fade"><br>
       <div class="card mt-5">
            <div class="card-header">
      				<h5>ALL ADS</h5>
 			 </div>
			<div class="row mt-6">
 			
  <div class="col-md-12">
<table class="table table-striped">
    <thead>
      <tr>
        
        <th>Item name</th>
        <th>Item Id</th>
        <th>Date</th>
        <th>Price</th>

      </tr>
    </thead>
    <tbody>
    <%
       
        ImageDao imageDao=null;
	    imageDao = new ImageDao();
	    List<ImageDto> list = imageDao.getData(reg);
	    
	    ImageDto dto;
        for(int i=0;i<list.size();i++)
        {
        	ImageDao item=null;
    	    item = new ImageDao();
    	    dto=list.get(i);
	    	int id=dto.getId();
            ResultSet rs1=item.getItem(id);
        
    %>
      <tr>
        <td><%= rs1.getString("Ad_title") %></td>
        <td><%= id %></td>
        <td><%= rs1.getDate("date") %></td>

        <td><%= rs1.getString("set_a_price") %></td>

      </tr>
      
      <%
        }
      %>
    <!--    <tr>
        <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr>
      <tr>
       <td>1</td>
        <td>pen</td>
        <td>123</td>
        <td>1 july</td>

        <td>50</td>

      </tr> -->
    </tbody>
  </table>

     
  </div>
  </div>
  </div>

    </div>
       <div id="menu4" class="container tab-pane fade"><br>
       <div class="card mt-5">
            <div class="card-header">
      				<h5>Sold ADS</h5>
 			 </div>
			<div class="row mt-6">
 			
  <div class="col-md-12 mt-5 mb-5">
<form class="form-inline">
    <div class="form-group">
      <div class="form-group col-md-3">
      <label for="pwd">Old Password:</label>
      <input type="password" class="form-control mt-2" id="pwd" placeholder="Enter password" name="pswd">
    </div>
    <div class="form-group col-md-3">
      <label for="pwd">New Password:</label>
      <input type="password" class="form-control mt-2" id="pwd" placeholder="Enter password" name="pswd1">
    </div>
    <div class="form-group col-md-3">
      <label for="pwd">Confirm Password:</label>
      <input type="password" class="form-control mt-2" id="pwd" placeholder="Enter password" name="pswd2">
    </div>
    
    <button type="submit" class="btn btn-primary">Change password</button>
  </form>

     
  </div>
  </div>
  </div>

    </div>
  </div>

</div>

<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>


<!-- modal for edit
========================== -->

 <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Update profile</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">


         <form>
         	<div class="form-group col-md-8">
    <label for="email">Profile pic:</label>
   <input type="file" id="myfile" name="myfile">
  </div>
  <div class="form-group col-md-8">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email">
  </div>
  <div class="form-group col-md-8">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" placeholder="Enter password" id="pwd">
  </div>
  <div class="form-group col-md-8">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email">
  </div>
  <div class="form-group col-md-8">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email">
  </div>
  <div class="form-group col-md-8">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email">
  </div>
  <div class="form-group col-md-8">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email">
  </div>
  
  
</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
      <button type="submit" class="btn btn-primary">Update</button>
        </div>
        
      </div>
    </div>
  </div>