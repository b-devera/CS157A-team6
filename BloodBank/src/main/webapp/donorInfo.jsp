<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Self Information</title>
    </head>
  <body>
  <button type="button" name="back" onclick="history.back()">Back</button>
    <center><h1>Self Information</h1>
    <input type="button" value="Update Information" onclick="window.location='donorInfoUpdate.jsp'" ><br/><br/>
    <center>
    <% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
        try {
        	int id = (Integer) session.getAttribute("donor_id");
        	
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);         
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM donor2 WHERE id= ?");
            pstmt.setInt(1,id);
            
            ResultSet rs = pstmt.executeQuery();
           
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
                <th> Username </th>
                <th> Password </th>
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
                    <td><%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><%=rs.getString(11) %></td>

                </tr>
            <% }
            rs.close();
            pstmt.close();
            con.close();
        }
        catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage()); 
        }
        session.removeAttribute("user_name");
    %>
    </center>
   </table>
  </body>
</html>
