<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Employee Portal</title>
		<link rel="stylesheet" href="css/portal.css" />
	</head>
	
	<body>
	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='employeeLogin.jsp'">Logout</button>
			</div>
			<h1>Employee Portal</h1>
		</div>
		<br><br>
		
		<div class="portal-container">
		<h2>
		<%
			String db= "bloodbank";
			String user = "root";
			String pw = "password";
			try{
				int employeeId =  Integer.parseInt(request.getParameter("empID"));
				String employeePass = request.getParameter("txtPwd");
        		Class.forName("com.mysql.jdbc.Driver"); 
        		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
        		Statement stmt = con.createStatement();
        		ResultSet rs = stmt.executeQuery("Select first_name, last_name from employee where id="+employeeId);
        		out.println("Hello");
        		while (rs.next()) {
                    out.println(" "+rs.getString(1) + " "+ rs.getString(2));
                }
        		stmt.close();
        		con.close();
   			} catch(Exception e){       
       			out.println(e);       
   			}   
		%>
		</h2>
		
			<center>
    			<br><button class="btn" type="Donors" onclick="window.location='donors.jsp'">Donors</button>
   			</center>
   			<center>
    			<br><button class="btn" type="Inventory" onclick="window.location='inventory.jsp'">Inventory</button>
   			</center>
   			<center>
    			<br><button class="btn" type="Appointments" onclick="window.location='appointmentEmployee.jsp'">Appointments</button>
   			</center>
   			<br></br>
		</div>
	</body>
</html>