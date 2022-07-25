<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<center><p style="color:red">Invalid Login Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/donorLogin.jsp").include(request,response);	
		%>
	</body>
</html>