<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Delete Blood Bag</title>
    <link rel="stylesheet" href="css/delete.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='inventoryAdmin.jsp'">Back</button>
			</div>
			<h1>Remove Blood Bag</h1>
		</div>
		<br><br>
		
		<form action="inventoryDeleteValidate.jsp" method="post">
			<div class="delete-container">
				<label for=removeId><b>Blood Bag ID</b></label>
    			<input type=text placeholder="Enter blood bag ID to be removed" name=removeId required>
    			<br></br>
    			
    			<center>
    		    	<button class="btn" type="reset">Clear</button>
    				<button class="submitBtn" type="submit">Submit</button>
    			</center>
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM inventory");
            %>
            <table id="information">
            <tr>
                <th>Bag ID</th>
                <th>Donor ID</th>
                <th>Employee ID</th>
                <th>Blood Type</th>
                <th>Quantity mL</th>
                <th>Expiration</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getString(6)%></td>

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
		</form>
  </body>
</html>
