<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Patient Portal</title>
	</head>
	<body>
	<button type="button" name="Logout" onclick="window.location='donorLogin.jsp'">Logout</button>
		<center><h1>Patient Portal</h1>
		<%
			String db="bloodbank";
			String user ="root";
			String pw = "password";
			
			try{
				String username = request.getParameter("ptUsername");
				String password = request.getParameter("ptPassword");
				
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT first_name, last_name, username FROM patient  WHERE username='"+username+"'");
				out.println("Hello ");
				while(rs.next()){
					out.println(rs.getString(1) + " " + rs.getString(2));
				}
			}catch(Exception e){
				out.println(e);
			}
		%>
		</center>
	</body>
</html>