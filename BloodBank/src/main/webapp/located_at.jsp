<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Located At</title>
    </head>
  <body>
  <button type="button" name="back" onclick="history.back()">Back</button>
    <center><h1>Located At</h1>
    <center>
    <% 
    String db = "BloodBank";
    String user = "root";
    String password = "password";
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BloodBank?autoReconnect=true&useSSL=false", user, password);
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM located_at");
            %>
            <table border="2">
            <tr>
                <th>Located_at ID</th>
                <th>Bag ID</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
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
