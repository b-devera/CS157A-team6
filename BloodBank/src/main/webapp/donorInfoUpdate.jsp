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
    <title>My Information</title>
    </head>
    <link rel="stylesheet" href="css/info.css" />
  <body>
  <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='donorInfo.jsp'">Back</button>
			</div>
			<h1>My Information</h1>
		</div>
		<br><br>
		
  <form action="donorInfoUpdateValidate.jsp" method="post">
  	<div class="info-container">
			<label for=txtFirstName><b>First Name</b></label>
    		<input type=text placeholder="Enter first name" name=first_name>
    		
    		<label for=txtLastName><b>Last Name</b></label>
    		<input type=text placeholder="Enter last name" name=last_name>
    		<br></br>
    		
    		<div class="register-subcontainer">
    			<label for=txtAge><b>Age</b></label>
    			<input type=text placeholder="Enter age" name=age>
    			
    			<label for=genderBox><b>Gender</b></label>
    			<select name="gender" value="gender">
          			<option value="" name="no"> </option>
            		<option value="M" name="M">M</option>
            		<option value="F" name="F">F</option>
        		</select>
        		
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
        		
        		<label for=txtName><b>Height (in)</b></label>
    			<input type=text placeholder="Enter height" name=height>
    		
    			<label for=txtPwd><b>Weight (lbs)</b></label>
    			<input type=text placeholder="Enter weight" name=weight>
    		</div>
    		<br></br>
    		
    		<label for=username><b>Username</b></label>
    		<input type=text placeholder="Enter Username" name=username>
    		
    		<label for=password><b>Password</b></label>
    		<input type="password" placeholder="Enter Password" name=password>
    		
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
        	int id = (Integer) session.getAttribute("donor_id");
        	
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);         
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM donor WHERE id= ?");
            pstmt.setInt(1,id);
            
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
        	%>
    		<center><p style="color:red">Invalid Credentials.</p></center>
    		<%
        }
        session.removeAttribute("user_name");
    %>
		</div>
  </form>
  </body>
</html>