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
    <title>Register</title>
    <link rel="stylesheet" href="css/register.css" />
    </head>
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='home.jsp'">Home</button>
			</div>
			<h1>Patient Registration</h1>
		</div>
		<br><br>
		
	<form action="patientRegisterValidate.jsp" method="post">
		<div class="register-container">
			<label for=txtFirstName><b>First Name</b></label>
    		<input type=text placeholder="Enter first name" name=first_name required>
    		
    		<label for=txtLastName><b>Last Name</b></label>
    		<input type=text placeholder="Enter last name" name=last_name required>
    		<br></br>
    		
    		
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
    			<br><button class="btn" type="button" onclick="window.location='patientLogin.jsp'">Already have an account? Login</button>
    		</center>
		</div>
	</form>
  </body>
</html>