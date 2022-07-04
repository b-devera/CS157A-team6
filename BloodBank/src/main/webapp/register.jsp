<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Register</title>
	</head>

	<body>
		<button type="button" name="back" onclick="window.location='home.jsp'">Back</button>

		<div align=center>
			<h1>Donor Register</h1>
		</div>
	<form action=LoginServlet method=post>

		<table align=center>
			<tr><td>Username</td><td><input type=text name=txtName></td></tr>
			<tr><td>Email</td><td><input type=email name=txtName></td></tr>
			<tr><td>Password</td><td><input type=password name=txtPwd></td></tr>
			<tr><td>Re-enter Password</td><td><input type=password name=txtPwd></td></tr>
		</table>
		<br><div align=center><input type=submit value=Register></div></br>
		<div align=center><a href="login.jsp">Already have an account? Login</a></div>
	</form>

	</body>
</html>