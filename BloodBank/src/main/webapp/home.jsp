<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Home</title>
    <link rel="stylesheet" href="css/home.css" />
    </head>
    <body class="body">
   <div class="header">
   <h1>JBK Blood Bank</h1>
   </div>
  	<center class="body">
    <br><br><input class="btn" type="button" value="Donor Login" onclick="window.location='donorLogin.jsp'" ><br/><br/>
    <input class="btn2" type="button" value="Patient Login" onclick="window.location='patientLogin.jsp'" ><br/><br/>
    <input class="btn3" type="button" value="Employee/Admin Login" onclick="window.location='employeeLogin.jsp'" ><br/><br/>
    </center>
    </body>
</html>