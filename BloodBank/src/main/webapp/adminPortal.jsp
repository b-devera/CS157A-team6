<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Admin</title>
    <link rel="stylesheet" href="css/portal.css" />
    </head>
    
  <body>
  	<div class="header">
			<div class="topleft">
			<button class="btn" type="button" name="back" onclick="window.location='home.jsp'">Logout</button>
			</div>
			<h1>Admin Portal</h1>
		</div>
		<br></br>
  	
  	<div class="portal-container">
  	<center>
    	<br><button class="btn" type="button" onclick="window.location='admins.jsp'">Admins</button>
 	</center>
  	<center>
    	<br><button class="btn" type="button" onclick="window.location='appointment.jsp'">Appointments</button>
 	</center>
 	<center>
    	<br><button class="btn" type="button" onclick="window.location='donorsAdminRedirect.jsp'">Donors</button>
 	</center>
 	<center>
    	<br><button class="btn" type="button" onclick="window.location='donations.jsp'">Donations</button>
 	</center>
 	<center>
    	<br><button class="btn" type="button" onclick="window.location='employees.jsp'">Employees</button>
 	</center>
 	<center>
    	<br><button class="btn" type="button" onclick="window.location='inventoryAdmin.jsp'">Inventory</button>
 	</center>
 	<center>
    	<br><button class="btn" type="button" onclick="window.location='patients.jsp'">Patients</button>
 	</center>
 	<center>
    	<br><button class="btn" type="button" onclick="window.location='transfusions.jsp'">Transfusions</button>
 	</center>
 	<br>
  </body>
</html>
