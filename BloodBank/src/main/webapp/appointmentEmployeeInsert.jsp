<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
  <head>
    <title>Appointment</title>
    <link rel="stylesheet" href="css/insert.css" />
    </head>
    
  <body>
  <div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='appointmentEmployee.jsp'">Back</button>
			</div>
			<h1>Add an Appointment</h1>
		</div>
		<br><br>
	
	<form action="appointmentEmployeeValidate.jsp" method="post">
		<div class="insert-container">
			<label for=donID><b>Donor ID</b></label>
    		<input type=text placeholder="Enter donor ID" name=donID required>
    		
    		<label for=donID><b>Employee ID</b></label>
    		<input type=text placeholder="Enter employee ID" name=empID required>
			<br></br>
			
			<div class="insert-subcontainer">
				<label for=date><b>Appointment Date</b></label>
    			<input type=DATE name=date required>
    		
    			<label for=time><b>Time</b></label>
    			<input type=text placeholder="24 hour (HH:MM:SS)" name=time required>
    		</div>
    		<br></br>
    		
    		<center>
    		    <button class="btn" type="reset">Clear</button>
    			<button class="submitBtn" type="submit">Submit</button>
    		</center>
  	</form>
  </body>
</html>