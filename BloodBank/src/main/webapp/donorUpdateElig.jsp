<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
</style>
  <head>
    <title>Update Donor Eligibility</title>
    <link rel="stylesheet" href="css/update.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='donors.jsp'">Back</button>
			</div>
			<h1>Update Donor Eligibility</h1>
		</div>
		<br><br>
		
		<form action="donorUpdateEligValidate.jsp" method="post">
			<div class="update-container">
				<label for=donorId><b>Donor ID</b></label>
    		<input type=text placeholder="Enter donor ID" name=donorId required>
    		
    		<label for=eligibility_date><b>Eligibility Date</b></label>
    		<input type=DATE name=eligibility_date required>
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
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM donor");
           
            ResultSet rs = pstmt.executeQuery();
           
            %>
            <table id="information">
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
    %>
    		
			</div>
		</form>
  </body>
</html>