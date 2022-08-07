<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="css/login.css" />
	</head>
	<body>
		<div class="header">
		<button class="btn" type="button" name="back" onclick="window.location='home.jsp'">Home</button>
			<h1>Donor Login</h1>
		</div>
		<br></br>
		
		<form action=donorLoginValidate.jsp method=post>
		<div class="login-container">
			<label for=txtName><b>Username</b></label>
    		<input type=text placeholder="Enter Username" name=txtName required>
    		
    		<label for=txtPwd><b>Password</b></label>
    		<input type="password" placeholder="Enter Password" name=txtPwd required>
			
			<center>
				<label>
      				<input type="checkbox" checked="checked" name="remember"> Remember me
    			</label>
    			<button class="btn" type="button">Forgot Password?</button>
    		</center>
    		
    		<center>
    			<button class="submitBtn" type="submit">Login</button>
    		</center>
    		
    		<center>
    			<button class="btn" type="button" onclick="window.location='donorRegister.jsp'">Don't have an account? Register</button>
    		</center>
   		</div>
		</form>
	</body>
</html>