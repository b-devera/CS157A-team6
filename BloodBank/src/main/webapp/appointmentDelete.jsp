<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Delete Appointment</title>
    <link rel="stylesheet" href="css/delete.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='appointment.jsp'">Back</button>
			</div>
			<h1>Delete an Appointment</h1>
		</div>
		<br><br>
		
	<form action="appointmentDeleteValidate.jsp" method="post">
	<div class="delete-container">
		<label for=removeId><b>Appointment ID</b></label>
    		<input type=text placeholder="Enter Appointment ID here to be removed" name=removeId required>
		<br></br>
		
		<center>
    		    <button class="btn" type="reset">Clear</button>
    			<button class="submitBtn" type="submit">Submit</button>
    		</center>
    		<br></br>
    		
    </form>
    <% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM appointment");
            %>
            <table id="information">
             <tr>
                <th>Appointment ID</th>
                <th>Donor ID</th>
                <th>Employee ID</th>
                <th>Appointment Date</th>
                <th>Appointment Time</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getDate(4)%></td>
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
    </div>
  </body>
</html>