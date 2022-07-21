<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Error</title>
	</head>
	<body>
		<center><p style="color:red">Invalid Login Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/employeeLogin.jsp").include(request, response);
		%>
	</body>
</html>