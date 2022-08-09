<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
  <head>
    <title>Employee Registration</title>
    <link rel="stylesheet" href="css/register.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='employees.jsp'">Back</button>
			</div>
			<h1>Employee Registration</h1>
		</div>
		<br><br>
	
	<form action="employeeRegisterValidate.jsp" method="post">
		<div class="register-container">
			<label for=first_name><b>First Name</b></label>
    		<input type=text placeholder="Enter first name" name=first_name required>
    		
    		<label for=txtLastName><b>Last Name</b></label>
    		<input type=text placeholder="Enter last name" name=last_name required>
    		<br></br>
    		
    		<div class="register-subcontainer">
    			<label for=age><b>Age</b></label>
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
    		<br></br>
    		
    		<center>
    		    <button class="btn" type="reset">Clear</button>
    			<button class="submitBtn" type="submit">Register</button>
    		</center>
		</div>
	</form>
  </body>
</html>