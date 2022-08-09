<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Registered Employees</title>
    <link rel="stylesheet" href="css/info.css" />
    </head>
    
  <body>
  <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='adminPortal.jsp'">Back</button>
			</div>
			<h1>Registered Employees</h1>
		</div>
		<br><br>
  
  <div class="info-container">
  	<button class="btn" type="button" onclick="window.location='employeeRegister.jsp'">Add new Employee</button>
	<button class="btn" type="button" onclick="window.location='employeeDelete.jsp'">Delete Employee</button>	
		<br></br>
		
    <% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM employee");
            %>
            <table id="information">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Gender</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getInt(4)%></td>
                    <td><%=rs.getString(5)%></td>
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
</html>
