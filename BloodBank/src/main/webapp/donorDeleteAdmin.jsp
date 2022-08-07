<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Donors</title>
    </head>
  <body>
  <button type="button" name="back" onclick="window.location='donorsAdminRedirect.jsp'">Back</button>
    <center><h1>Donors</h1>
    <form action="donorDeleteValidateAdmin.jsp" method="post">
    <p>
    	Enter Donor ID to be removed:
    	<input type="text" name="removeId">
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM donor");
            %>
            <table border="2">
                      <tr>
                <th> ID </th>
                <th> First Name </th>
                <th> Last Name </th>
                <th> Gender </th>
                <th> Age </th>
                <th> Blood Type </th>
                <th> Height (inches) </th>
                <th> Weight (lbs) </th>
                <th> Eligibility </th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getInt(7)%></td>
                    <td><%=rs.getInt(8)%></td>
                    <td><%=rs.getString(9) %></td>

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
