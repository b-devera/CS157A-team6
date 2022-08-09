<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
  <head>
  	<meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="css/register.css" />
    </head>
    
  <body>
    <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='home.jsp'">Home</button>
			</div>
			<h1>Donor Registration</h1>
		</div>
		<br><br>
		
	<form action="donorRegisterValidate.jsp" method="post">
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
        		
        		<label for=bloodTypeBox><b>Blood Type</b></label>
    			<select name="bloodType" value="bloodType">
          			<option value="" name="no"> </option>
            		<option value="AB+" name="AB+">AB+</option>
            		<option value="AB-" name="AB-">AB-</option>
            		<option value="A+" name="A+">A+</option>
            		<option value="A-" name="A-">A-</option>
            		<option value="B+" name="B+">B+</option>
            		<option value="B-" name="B-">B-</option>
            		<option value="O+" name="O+">O+</option>
            		<option value="O-" name="O-">O-</option>
        		</select>
        		
        		<label for=txtName><b>Height (in)</b></label>
    			<input type=text placeholder="Enter height" name=height required>
    		
    			<label for=txtPwd><b>Weight (lbs)</b></label>
    			<input type=text placeholder="Enter weight" name=weight required>
    		</div>
    		<br></br>
    		
    		<label for=username><b>Username</b></label>
    		<input type=text placeholder="Enter Username" name=username required>
    		
    		<label for=password><b>Password</b></label>
    		<input type="password" placeholder="Enter Password" name=password required>
    		
    		<center>
    		    <button class="btn" type="reset">Clear</button>
    			<button class="submitBtn" type="submit">Register</button>
    		</center>
    		
    		<center>
    			<br><button class="btn" type="button" onclick="window.location='donorLogin.jsp'">Already have an account? Login</button>
    		</center>
		</div>
	</form>
  </body>
</html>