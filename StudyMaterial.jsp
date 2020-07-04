<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Order form</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      height: 100%;
      }
      body, input, select { 
      padding: 0;
      margin: 0;
      outline: 1;
      font-family: Roboto, Arial, sans-serif;
      font-size: 16px;
      color: black;
      }
      h1, h3 {
      font-weight: 400;
      }
      h1 {
      font-size: 32px;
      }
      h3 {
      color: black;
      }
      .main-block, .info {
      display: flex;
      flex-direction: column;
      }
      .main-block {
      justify-content: center;
      align-items: center;
      width: 100%; 
      min-height: 80%;
      background: ;
      background-size: cover;
      }
      form {
      width: 80%; 
      padding: 25px;
      margin-bottom: 20px;
      background:;
      }
      input, select {
      padding: 5px;
      margin-bottom: 20px;
      background: white;
      border: transparent;
      border-bottom: 1px solid #eee;
      }
      input::placeholder {
      color: #ee;
      }
      option {
      background: white; 
      border: black;
      }
      .metod {
      display: flex; 
      }
      input[type=radio] {
      display: none;
      }
      label.radio {
      position: relative;
      display: inline-block;
      margin-right: 20px;
      text-indent: 32px;
      cursor: pointer;
      }
      label.radio:before {
      content: "";
      position: absolute;
      top: -1px;
      left: 0;
      width: 17px;
      height: 17px;
      border-radius: 50%;
      border: 2px solid #1c87c9;
      }
      label.radio:after {
      content: "";
      position: absolute;
      width: 8px;
      height: 4px;
      top: 5px;
      left: 5px;
      border-bottom: 3px solid #1c87c9;
      border-left: 3px solid #1c87c9;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      button {
      display: block;
      width: 200px;
      padding: 10px;
      margin: 20px auto 0;
      border: none;
      border-radius: 5px; 
      background: red; 
      font-size: 14px;
      font-weight: 600;
      color: #fff;
      }
      button:hover {
      background: #095484;
      }
      @media (min-width: 568px) {
      .info {
      flex-flow: row wrap;
      justify-content: space-between;
      }
      input {
      width: 46%;
      }
      input.fname {
      width: 100%;
      }
      select {
      width: 48%;
      }
      }
    </style>
  </head>
  <body>
    <div class="main-block">
    <% 
         if(session.getAttribute("imageUpload") != null)
         {
    %>    
    <center>
       <h1 style="color:green;"> Result of the operation: ${imageUpload}</h1>
    </center>
    <%
         }
         else
         {
    %>
        	 
        	 <h1 style="color:red;"> Result of the operation: ${imageNotUpload}</h1>
               
  <%
         }
        session.removeAttribute("imageNotUpload");
        session.removeAttribute("imageUpload");
        String Reg=session.getAttribute("reg").toString();
  %>
    
      <h1>Post Your AD</h1>
      <form action="Study" method="post" enctype="multipart/form-data">
        <div class="info">
          <input class="fname" type="text" name="brand" placeholder="Subject Name/Author' Name/Brand ">
          <input type="text" name="Reg" value="<%= Reg %>" readonly>
           <input type="text" name="choose" value="Study Material" readonly>
          <input type="text" name="published_year" placeholder="Published Year">
          <input type="text" name="yea" placeholder="Year">
          <input type="text" name="Ad_title" placeholder="Ad title">
           <input type="text" name="Mobile_no" placeholder="Mobile No.">
           <input type="text" name="set_a_price" placeholder="Set a price">
          <input type="text" name="Description" placeholder="Description">
          <input type="file" name="img1" accept="image/*">
          <input type="file" name="img2" accept="image/*">
        </div>

        <button href="/" class="button">Submit</button>
      </form>
    </div>
  </body>
</html>