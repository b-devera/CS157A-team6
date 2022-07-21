<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Employee Login</title>
	</head>
	<body>
		<button type="button" name="back" onclick="window.location='home.jsp'">Back</button>
		<div align=center>
			<h1>Employee Login</h1>
		</div>
		<form action="employeeValidate.jsp" method=post>
		<table align=center>
			<tr><td>Employee ID</td><td><input type=text name=empID></td></tr>
			<tr><td>Password</td><td><input type=password name=txtPwd></td></tr>
		</table>
		<table align=center>
			<tr>
				<td><input type=checkbox name=txtName>Remember me</td>
				<td><a href="register.jsp">Forgot password?</a></td>
			</tr>
		</table>
			<br><div align=center><input type=submit value=Login></div></br>
		</form>
	</body>
</html>