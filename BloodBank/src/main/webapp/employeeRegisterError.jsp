<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/employeeRegister.jsp").include(request,response);	
		%>
	</body>
</html>