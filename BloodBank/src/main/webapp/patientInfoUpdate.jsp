<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<style>
    div.ex
    {
        width:300px;
        padding:10px;
        border:5px solid gray;
        margin:0px;
    }
#genderBox{
    margin-left: 22px;
}
#ageBox{
    margin-left: 42px;
}
#weightBox{
    margin-right: 10px
}
#bloodBox{
    margin-right: 4px
}
#userBox{
	margin-left: 2px
}
#passBox{
	margin-left: 5px
}
#lastRow {
    margin-left: 0px;
}
</style>
  <head>
    <title>Information Update</title>
    <link rel="stylesheet" href="css/info.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='donorInfo.jsp'">Back</button>
			</div>
			<h1>Update Information</h1>
		</div>
		<br><br>
		
		<form action="patientInfoUpdateValidate.jsp" method="post">
			<div class="info-container">
				<label for=txtFirstName><b>First Name</b></label>
    			<input type=text placeholder="Enter first name" name=first_name>
    			
    			<label for=txtLastName><b>Last Name</b></label>
    			<input type=text placeholder="Enter last name" name=last_name>
    		
    			<label for=bloodTypeBox><b>Blood Type</b></label>
    			<select name="bloodType" value="bloodType">
          			<option value="" name="no"> </option>
            		<option value="AB+" name="AB+">AB+</option>
            		<option value="AB-" name="AB-">AB-</option>
            		<option value="A+" name="A+">A+</option>
            		<option value="A-" name="A-">A-</option>
            		<option value="B+" name="B+">B+</option>
            		<option value="B-" name="B-">B-</option>
            		<option value="O+" name="O+">O+</option>
            		<option value="O-" name="O-">O-</option>
        		</select>
        		
        		<label for=username><b>Username</b></label>
    			<input type=text placeholder="Enter Username" name=username>
    		
    			<label for=password><b>Password</b></label>
    			<input type="password" placeholder="Enter Password" name=password>
    			<br></br>
    			
    			<center>
	    		    <button class="btn" type="reset">Clear</button>
	    			<button class="submitBtn" type="submit">Update</button>
	    		</center>
	    		<br></br>
	    		
	    		<% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
        try {
        	int id = (Integer) session.getAttribute("patient_id");
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM patient WHERE id= ?");
            pstmt.setInt(1,id);
            
            ResultSet rs = pstmt.executeQuery();
           
            %>
            <table id="information">
            <tr>
                <th> ID </th>
                <th> First Name </th>
                <th> Last Name </th>
                <th> Blood Type </th>
                <th> Username </th>
                <th> Password </th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6) %></td>

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