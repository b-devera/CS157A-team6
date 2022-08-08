<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Patient Login</title>
		<link rel="stylesheet" href="css/login.css" />
	</head>
	<body>
		<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='home.jsp'">Home</button>
			</div>
			<h1>Patient Login</h1>
		</div>
		<br></br>
		
		<form action=patientLoginValidate.jsp method=post>
		<div class="login-container">
			<label for=txtName><b>Username</b></label>
    		<input type=text placeholder="Enter Username" name=ptUsername required>
    		
    		<label for=txtPwd><b>Password</b></label>
    		<input type="password" placeholder="Enter Password" name=pwd required>
			
			<center>
				<label>
      				<input type="checkbox" checked="checked" name="remember"> Remember me
    			</label>
    			<button class="btn" type="button">Forgot Password?</button>
    		</center>
    		
    		<center>
    			<br><button class="submitBtn" type="submit">Login</button>
    		</center>
    		<center>
    			<br><button class="btn" type="button" onclick="window.location='patientRegister.jsp'">Don't have an account? Register</button>
    		</center>
   		</div>
		</form>
	</body>
</html>