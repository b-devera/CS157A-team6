<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Donor Portal</title>
	</head>
	<body>
	<button type="button" name="Logout" onclick="window.location='donorLogin.jsp'">Logout</button>
		<center><h1>Donor Portal</h1>
		<%
			String db="bloodbank";
			String user ="root";
			String pw = "password";
			
			try{
				String username = request.getParameter("txtName");
				String password = request.getParameter("txtPwd");
				
				session.setAttribute("user_name", username);
				
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT id, first_name, last_name, username FROM donor  WHERE username='"+username+"'");
				out.println("Hello ");
				

		         
				while(rs.next()){
					 int donorID = rs.getInt(1);
			         request.getSession().setAttribute("donor_id", donorID);
					out.println(rs.getString(2) + " " + rs.getString(3));
				}
				out.println(", Welcome to Jurassic Park");
			}catch(Exception e){
				out.println(e);
			}
		%>
		<br><br><input type="button" value="View Information" onclick="window.location='donorInfo.jsp'"><br/>
		<br><input type="button" value="View Appointment" onclick="window.location='donorAppointmentView.jsp'"><br/>
		</center>
	</body>
</html>