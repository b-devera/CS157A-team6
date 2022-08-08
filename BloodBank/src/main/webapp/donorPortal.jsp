<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Donor Portal</title>
		<link rel="stylesheet" href="css/portal.css" />
	</head>
	<body>
	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='donorLogin.jsp'">Logout</button>
			</div>
			<h1>Donor Portal</h1>
		</div>
		<br><br>
		
		<div class="portal-container">
		<h2>
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
					out.print(rs.getString(2) + " " + rs.getString(3));
				}
				out.print(", welcome to Jurassic Park");
			}catch(Exception e){
				out.println(e);
			}
		%>
		</h2>
			<center>
    			<br><button class="btn" type="View Information" onclick="window.location='donorInfo.jsp'">View Information</button>
    		</center>
    		<center>
    			<br><button class="btn" type="View Appointment" onclick="window.location='donorAppointmentView.jsp'">View Appointment</button>
    		</center>
    		<br>
		</div>
	</body>
</html>