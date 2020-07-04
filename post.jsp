<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.sellMDao.SellMDao" %>
     <%@page import="com.login.Dao.SignupDao" %>
    <%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Exchange Hub</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--  link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CMuli:400,700" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <style>
       .item{
    height: 550px;
    } 
.item img{
 width: auto;
 height: 245px;
 max-height: 550px;
 margin: auto; 
 display: block;
 }
    </style>
    
</head>
<body>

<% 
 response.setHeader("Cache-Control", "no-store");
%>
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
			<div id="nav-bottom">
				<div class="container">
					<!-- nav -->
					<ul class="nav-menu">
						<li><a href="index.jsp">Home</a></li>
						
						<li class="has-dropdown megamenu">
							<a href="#">All Categories</a>
							<div class="dropdown">
								<div class="dropdown-body">
									<div class="row">
										<div class="col-md-3">
											<h4 class="dropdown-heading">Categories</h4>
											<ul class="dropdown-list">
												<li><a href="#">Lifestyle</a></li>
												<li><a href="#">Fashion</a></li>
												<li><a href="#">Technology</a></li>
												<li><a href="#">Health</a></li>
												<li><a href="#">Travel</a></li>
											</ul>
										</div>
										<div class="col-md-3">
											<h4 class="dropdown-heading">Lifestyle</h4>
											<ul class="dropdown-list">
												<li><a href="#">Lifestyle</a></li>
												<li><a href="#">Fashion</a></li>
												<li><a href="#">Health</a></li>
											</ul>
											<h4 class="dropdown-heading">Technology</h4>
											<ul class="dropdown-list">
												<li><a href="#">Lifestyle</a></li>
												<li><a href="#">Travel</a></li>
											</ul>
										</div>
										<div class="col-md-3">
											<h4 class="dropdown-heading">Fashion</h4>
											<ul class="dropdown-list">
												<li><a href="#">Fashion</a></li>
												<li><a href="#">Technology</a></li>
											</ul>
											<h4 class="dropdown-heading">Travel</h4>
											<ul class="dropdown-list">
												<li><a href="#">Lifestyle</a></li>
												<li><a href="#">Healtth</a></li>
												<li><a href="#">Fashion</a></li>
											</ul>
										</div>
										<div class="col-md-3">
											<h4 class="dropdown-heading">Health</h4>
											<ul class="dropdown-list">
												<li><a href="#">Technology</a></li>
												<li><a href="#">Fashion</a></li>
												<li><a href="#">Health</a></li>
												<li><a href="#">Travel</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li><a href="#">Study Material</a></li>
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
					    <li><a class="primary-button " style="font-size:15px;" data-toggle=<%= dataToggle %>  href=<%= url %>  role="button" aria-expanded="false" >SELL </a>
                     	<!-- li id="user-name" class="nav-bar-menu tablet-hide"><a class="track-header-profile-box" href="https://www.hackerearth.com/@priyanka2024"><img src="https://he-s3.s3.amazonaws.com/media/avatars/priyanka2024/resized/30/fe4e25dimg-20180902-wa0004.jpg" alt="priyanka2024" width="30" height="30" onerror="if(typeof handle_avatar_error=='function'){handle_avatar_error(this);}" /></a></li-->		
						
						
					</ul>
					<!-- /nav -->
				</div>
			</div>
			<!-- /Main Nav -->

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

<!-- Carousel -->

<%
int id1=Integer.parseInt(request.getParameter("id"));
%>

<div class="container">
   
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="position:absolute;left:20px; top:170px; width:50%;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img class="center-block" src="./ImageDownloader?id=<%= id1 %>" alt="Los Angeles" style=" position:relative; height:auto; width:100%;">
      </div>

      <div class="item">
        <img src=" ./ImageDownloader1?id=<%= id1 %>" alt="Not Available" style="width:100%;">
      </div>
    
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>



<!-- /Carousel -->

<!-- Section -->

<%
    //String user1=session.getAttribute("reg").toString();

String doChat="./post.jsp";
SellMDao Dao=null;
Dao = new SellMDao();
/*Get Data of item with id = id1*/
ResultSet rs= Dao.getData(id1);
String Reg=rs.getString("Reg");
String user1=null;
SignupDao dao=null;
dao = new SignupDao();

/*Get Data of Seller*/
ResultSet rs1=dao.getData(Reg);
String user2=null;
user2=rs1.getString("fname");

	if (session.getAttribute("reg") == null)
	{
   %>
   <div class="alert alert-danger my-auto" style="position:absolute;left:20px;">
  <strong>Warning!</strong> Please! First log in to your account.
</div>
   
   <%
		
	}
	else
	{
		user1=session.getAttribute("username").toString();
		doChat = "User";
		
	}
  
	String des=null;
		des = rs.getString("Description");
%>

<div class="container" >
<div >
<h1 style="width:20%; float:right; position:absolute; left:900px;top:170px;">Rs. <%= rs.getString("set_a_price")%></h1>
</div>
<div >
<p style="width:20%; float:right; position:absolute; left:900px;top:200px;font-size:30px;">Item name: <%= rs.getString("Ad_title")%></p>
<p style="width:20%;  position:absolute; left:900px;top:240px;font-size:20px;">Item brand: <%= rs.getString("brand")%></p>
<p style="width:20%; float:right; position:absolute; left:900px;top:280px;font-size:20px;">Description: <%= des%></p>

</div>
<div >
<h1 style="width:20%; float:right; position:absolute; left:900px;top:320px;">About Student</h1>
</div>
<div>
<p style="width:20%; float:right; position:absolute; left:900px;top:360px;font-size:20px;"><b> <%= user2 %> <%= rs1.getString("lname") %> </b></p>
<p style="width:20%; float:right; position:absolute; left:900px;top:380px;font-size:20px;"> <%= rs1.getString("hostelname") %> Hostel, Room no. <%= rs1.getInt("room_no") %></p>

</div>

< <form method="get" action= <%= doChat %>>
<input type="text" value="<%= id1 %>" name="id" style="display:none;">
<input type="text" value="<%= user1 %>" name="username" style="display:none;">
<input type="text" value="<%= user2 %>" name="seller" style="display:none;">
<button type="submit" class="btn btn-success btn-lg btn-block" style="width:40%; float:right; position:absolute; right:20px;top:420px;" >Chat with <%= user2 %></button>
</form>
</div>

<!-- /Section -->

<!-- Modal -->
	<div class="modal visible" id="staticBackdrop" data-backdrop="static"  data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="staticBackdropLabel" style="margin-bottom:0px;">Sign In</h3>
					<button style="position:absolute;top:9px;left:552px; color:black;" type="button" class="close fa fa-3x" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                 
					<%
				     //String message = request.getAttribute("wrongcred").toString();
				    if(session.getAttribute("wrongcred") != null)
				    {
				    	//System.out.println(message);
				   %>
				<h4 style="color:red ; font-family: Calibri;"> *${wrongcred} </h4>
				<%
				    }
				    
				%>
				</div>
				
				<div class="modal-body">
					<form action="Login" method="post">
						<div class=" form-group">
							<label for="exampleInputEmail1"><i class="fa fa-user" aria-hidden="true"></i>Registration Number<span class=" required">*</span></label> 
							<input type="text" class="form-control" name="uname" required> 
						</div>
						<div class=" form-group">
							<label for="exampleInputPassword1"><i class="fa fa-lock" aria-hidden="true"></i>Password<span class="required">*</span></label>
							<input type="password" class="form-control" name="pass" required>
						</div>
						<div class="form-group form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1"> <label class="form-check-label" for="exampleCheck1">Remember me</label>
						</div>
						
				</div>
              
				<div class="modal-footer ">
				
				<button type="submit" class="btn btn-primary" style="position:absolute; left:15px;margin:-5px 0px;width:100px" >Login</button>
						 
					</form>
					<div class="">
					Don't have an account?<a href="signup.jsp">Sign Up</a>
				</div>
				</div>
			</div>
		</div>
		<%
		session.removeAttribute("wrongcred");
	   // session.invalidate();
		%>
	</div>
	
<!-- /Modal -->



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
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
    