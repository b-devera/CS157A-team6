<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Blood Transfusions</title>
    <link rel="stylesheet" href="css/info.css" />
    </head>
    
  <body>
  <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='adminPortal.jsp'">Back</button>
			</div>
			<h1>Blood Transfusion Log</h1>
		</div>
		<br><br>
    
    <div class="info-container">
    <% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM transfusion");
            %>
            <table id="information">
            <tr>
                <th>Blood Bag ID</th>
                <th>Patient ID</th>
                <th>Date</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getString(3)%></td>
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
