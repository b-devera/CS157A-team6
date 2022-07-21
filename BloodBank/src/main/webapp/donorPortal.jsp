<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Donor Portal</title>
	</head>
	<body>
	<button type="button" name="Logout" onclick="window.location='login.jsp'">Logout</button>
		<center><h1>Donor Portal</h1>
		<%
			String db="bloodbank";
			String user ="root";
			String pw = "password";
			
			try{
				String username = request.getParameter("txtName");
				String password = request.getParameter("txtPwd");
				
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT p.first_name, p.last_name, d.username FROM person p, donor d WHERE p.id = d.id AND d.username='"+username+"'");
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