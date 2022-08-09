<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Appointment</title>
    <link rel="stylesheet" href="css/info.css" />
    </head>
  <body>
  <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='employeePortal.jsp'">Back</button>
			</div>
			<h1>Appointments</h1>
		</div>
		<br><br>
		
	<div class="info-container">
  	<button class="btn" type="button" onclick="window.location='appointmentEmployeeInsert.jsp'">Add Appointment</button>
  	<button class="btn" type="button" onclick="window.location='appointmentEmployeeDelete.jsp'">Delete Appointment</button>
		<br></br>
    <% 
    String db = "BloodBank";
    String user = "root";
    String password = "password";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodBank?autoReconnect=true&useSSL=false", user, password);
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM appointment");
            %>
            <table id="information">
           <tr>
                <th>Appointment ID</th>
                <th>Donor ID</th>
                <th>Employee ID</th>
                <th>Appointment Date</th>
                <th>Appointment Time (24 hr)</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getDate(4)%></td>
                    <td><%=rs.getTime(5)%></td>
                </tr>
            <% }
            rs.close();
            stmt.close();
            con.close();
        }
        catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
  </body>
</html>
