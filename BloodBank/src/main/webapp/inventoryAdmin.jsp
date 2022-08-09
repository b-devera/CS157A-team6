<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Inventory</title>
    <link rel="stylesheet" href="css/info.css" />
    </head>
  <body>
  <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='adminPortal.jsp'">Back</button>
			</div>
			<h1>Inventory</h1>
		</div>
		<br><br>
  
  <div class="info-container">
  	<button class="btn" type="button" onclick="window.location='inventoryInsert.jsp'">Add Blood Bag</button>
  	<button class="btn" type="button" onclick="window.location='inventoryDelete.jsp'">Delete Blood Bag</button>
  	<button class="btn" type="button" onclick="window.location='inventoryApprove.jsp'">Verify Inventory</button>
  	<button class="btn" type="button" onclick="window.location='inventoryUpdate.jsp'">Update Blood Bag</button>
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
                <th>Donation ID</th>
                <th>Employee ID</th>
                <th>Blood Type</th>
                <th>Quantity (mL)</th>
                <th>Expiration</th>
                <th>Approved By</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getInt(7) %></td>

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
    </center>
   </table>
  </body>
</html>
