<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Transfusions Received</title>
    </head>
  <body>
  <button type="button" name="back" onclick="history.back()">Back</button>
    <center><h1>Transfusions Received</h1>
    <center>
    <% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
        try {
        	int id = (Integer) session.getAttribute("patient_id");
        	
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);         
            PreparedStatement pstmt = con.prepareStatement("SELECT bag_id, date FROM transfusion WHERE patient_id= ?");
            pstmt.setInt(1,id);
            
            ResultSet rs = pstmt.executeQuery();
           
            %>
            <table border="2">
            <tr>
                <th>Bag ID </th>
                <th>Date </th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
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
