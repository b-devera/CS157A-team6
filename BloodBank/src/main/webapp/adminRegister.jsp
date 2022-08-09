<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<style>
    div.ex
    {
        width:300px;
        padding:10px;
        border:5px solid gray;
        margin:0px;
    }
#genderBox{
    margin-left: 22px;
}
#ageBox{
    margin-left: 42px;
}
#weightBox{
    margin-right: 10px
}
#bloodBox{
    margin-right: 4px
}
#lastRow {
    margin-left: 0px;
}
</style>
  <head>
    <title>Admin Registration</title>
    <link rel="stylesheet" href="css/register.css" />
    </head>
    
  <body>
  <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='admins.jsp'">Back</button>
			</div>
			<h1>Registered Admins</h1>
		</div>
		<br><br>
	
	<form action="adminRegisterValidate.jsp" method="post">
	<div class="register-container">
		<label for=txtFirstName><b>First Name</b></label>
    		<input type=text placeholder="Enter first name" name=first_name required>
    	
    	<label for=txtLastName><b>Last Name</b></label>
    		<input type=text placeholder="Enter last name" name=last_name required>
    		<br></br>
		
		<div class="register-subcontainer">
			<label for=txtAge><b>Age</b></label>
    			<input type=text placeholder="Enter age" name=age required>
    			
    		<label for=genderBox><b>Gender</b></label>
    			<select name="gender" value="gender">
          			<option value="" name="no"> </option>
            		<option value="M" name="M">M</option>
            		<option value="F" name="F">F</option>
        		</select>
        </div>
        <br></br>
        
        <label for=password><b>Password</b></label>
    		<input type="password" placeholder="Enter Password" name=password required>
    		
    	<center>
    		    <button class="btn" type="reset">Clear</button>
    			<button class="submitBtn" type="submit">Submit</button>
    		</center>
  </body>
</html>