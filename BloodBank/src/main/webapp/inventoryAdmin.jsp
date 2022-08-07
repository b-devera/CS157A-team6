<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Inventory</title>
    </head>
  <body>
  <button type="button" name="back" onclick="window.location='adminPortal.jsp'">Back</button>
    <center><h1>Inventory</h1>
    <input type="button" value="Add New Blood Bag" onclick="window.location='inventoryInsert.jsp'" >
    <input type="button" value="Delete Blood Bag" onclick="window.location='inventoryDelete.jsp'" >
    <input type="button" value="Verify Inventory" onclick ="window.location='inventoryApprove.jsp'">
      <input type="button" value="Update Item" onclick="window.location='inventoryUpdate.jsp'"><br/><br/>
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
                <th>Donation ID</th>
                <th>Employee ID</th>
                <th>Blood Type</th>
                <th>Quantity mL</th>
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
