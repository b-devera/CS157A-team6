<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Home</title>
    <link rel="stylesheet" href="css/home.css" />
    </head>
    <body style="background-color:#e3a5a1;text-align:center">
   <div class="header">
   <h1>JBK Blood Bank</h1>
   </div>
  	<center class="body">
    <br><br><input class="btn" type="button" value="Donor Login" onclick="window.location='donorLogin.jsp'" ><br/><br/>
    <input class="btn2" type="button" value="Patient Login" onclick="window.location='patientLogin.jsp'" ><br/><br/>
    <input class="btn3" type="button" value="Employee/Admin Portal" onclick="window.location='employeeLogin.jsp'" ><br/><br/>
    </center>
</html>