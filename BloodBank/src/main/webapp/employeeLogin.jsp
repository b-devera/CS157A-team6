<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Employee/Admin Login</title>
		<link rel="stylesheet" href="css/login.css" />
	</head>
	<body>
		<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='home.jsp'">Home</button>
			</div>
			<h1>Employee/Admin Login</h1>
		</div>
		<br></br>
		
		<form action=employeeLoginValidate.jsp method=post>
		<div class="login-container">
			<label for=txtName><b>Employee ID</b></label>
    		<input type=text placeholder="Enter ID" name=empID required>
    		
    		<label for=txtPwd><b>Password</b></label>
    		<input type="password" placeholder="Enter Password" name=txtPwd required>
			
			<center>
				<label>
      				<input type="checkbox" checked="checked" name="remember"> Remember me
    			</label>
    			<button class="btn" type="button">Forgot Password?</button>
    		</center>
    		
    		<center>
    			<br><button class="submitBtn" type="submit">Login</button>
    		</center>
   		</div>
		</form>
	</body>
</html>