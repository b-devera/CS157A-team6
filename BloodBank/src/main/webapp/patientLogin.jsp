<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Patient Login</title>
	</head>
	<body>
		<button type="button" name="back" onclick="window.location='home.jsp'">Back</button>

		<div align=center>
			<h1>Patient Login</h1>
		</div>
		<form action=patientLoginValidate.jsp method=post>
		<table align=center>
			<tr><td>Username</td><td><input type=text name=ptUsername></td></tr>
			<tr><td>Password</td><td><input type=password name=pwd></td></tr>
		</table>
		<table align=center>
			<tr>
				<td><input type=checkbox name=txtName>Remember me</td>
				<td><a href="register.jsp">Forgot password?</a></td>
			</tr>
		</table>
			<br><div align=center><input type=submit value=Login></div></br>
			<div align=center><a href="patientRegister.jsp">Don't have an account? Register</a></div>
		</form>
	</body>
</html>