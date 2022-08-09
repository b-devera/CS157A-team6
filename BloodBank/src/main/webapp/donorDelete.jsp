<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Remove Donors</title>
    <link rel="stylesheet" href="css/delete.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='donors.jsp'">Back</button>
			</div>
			<h1>Remove Donors</h1>
		</div>
		<br><br>
	
	<form action="donorDeleteValidate.jsp" method="post">
		<div class="delete-container">
			<label for=removeId><b>Donor ID</b></label>
    		<input type=text placeholder="Enter donor ID to be removed" name=removeId required>
			
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
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM donor");
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
            stmt.close();
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
