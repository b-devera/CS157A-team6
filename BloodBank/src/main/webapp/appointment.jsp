<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Appointment</title>
    </head>
  <body>
  <button type="button" name="back" onclick="history.back()">Back</button>
    <center><h1>Appointment</h1>
   <input type="button" value="Add Appointment" onclick="window.location='appointmentInsert.jsp'">
   <input type="button" value="Delete Appointment" onclick="window.location='appointmentDelete.jsp'"><br/><br/>
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
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM appointment");
            %>
            <table border="2">
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
    </center>
   </table>
  </body>
</html>
