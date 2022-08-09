<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Transfusions Received</title>
    <link rel="stylesheet" href="css/info.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='patientPortal.jsp'">Back</button>
			</div>
			<h1>Transfusions Received</h1>
		</div>
		<br><br>
		
		<div class="info-container">
			<% 
    String db = "bloodbank";
    String user = "root";
    String pw = "password";
        try {
        	int id = (Integer) session.getAttribute("patient_id");
        	
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);         
            PreparedStatement pstmt = con.prepareStatement("SELECT t.bagId, t.date, p.first_name, p.last_name "
            		+"FROM transfusion t, patient p WHERE t.patient_id= ? AND p.id= t.patient_id");
            pstmt.setInt(1,id);
            
            ResultSet rs = pstmt.executeQuery();
           
            %>
            <table id="information">
            <tr>
                <th>Bag ID </th>
                <th>Date </th>
                <th>First Name </th>
                <th>Last Name </th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
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
		</div>
  </body>
</html>
