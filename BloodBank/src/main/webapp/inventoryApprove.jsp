<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Verify Inventory</title>
    </head>
  <body>
  <button type="button" name="back" onclick="window.location='inventoryAdmin.jsp'">Back</button>
    <center><h1>Verify Inventory</h1>
    <form action="inventoryApproveValidate.jsp" method="post">
    <p>
    	Enter Bag ID to be approved:
    	<input type="text" name="approveId">
    </p>
    <p>
    	Enter Admin ID:
    	<input type="text" name="adminID">
    </p>
    <input type="reset" value="Clear" />
    <input type="submit" value="Submit"/>
    </form>
    <center>
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
            <table border="2">
            <tr>
                <th>Bag ID</th>
                <th>Donor ID</th>
                <th>Employee ID</th>
                <th>Blood Type</th>
                <th>Quantity mL</th>
                <th>Expiration</th>
                <th>Approved_by</th>
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
