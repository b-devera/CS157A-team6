<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
  <head>
    <title>Add Blood Bag</title>
    <link rel="stylesheet" href="css/insert.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='inventory.jsp'">Back</button>
			</div>
			<h1>Add Blood Bag</h1>
		</div>
		<br><br>
		
		<form action="inventoryValidateEmployee.jsp" method="post">
			<div class="insert-container">
				<label for=donorid><b>Donation ID</b></label>
    			<input type=text placeholder="Enter donor ID" name=donorid required>
    			
    			<label for=empID><b>Employee ID</b></label>
    			<input type=text placeholder="Enter employee ID" name=empID required>
				<br></br>
				
				<div class="insert-subcontainer">
					<label for=bloodTypeBox><b>Blood Type</b></label>
    				<select name="blood_type" value="blood_type">
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
        			
        			<label for=quantity><b>Quantity</b></label>
    				<input type=text placeholder="Enter quantity" name=quantity required>
    			
    				<label for=expiration><b>Expiration Date</b></label>
    				<input type=DATE name=expiration required>
				</div>
				<br></br>
				
				<center>
    		    <button class="btn" type="reset">Clear</button>
    			<button class="submitBtn" type="submit">Submit</button>
    		</center>
			</div>
		</form>
  </body>
</html>