<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Home</title>
    </head>
   <div class="header">
   <h1>JBK Blood Bank</h1>
   </div>
  	<center class="body">
    <input class="btn" type="button" value="Donor Login" onclick="window.location='donorLogin.jsp'" ><br/><br/>
    <input class="btn2" type="button" value="Patient Login" onclick="window.location='patientLogin.jsp'" ><br/><br/>
    <input class="btn3" type="button" value="Employee/Admin Portal" onclick="window.location='employeeLogin.jsp'" ><br/><br/>
    </center>
</html>
<style>
.body {
	padding-top: 20px;
}
.header {
font-family: Arial, Helvetica, sans-serif;
  padding: 10px;
  text-align: center;
  background: #720000;
  color: white;
  font-size: 20px;
}
.btn {
font-family: Arial, Helvetica, sans-serif;
transition-duration: 0.4s;
  background-color: #720000; 
  color: white;
  padding: 10px 43px;
  border: 2px solid #720000;
}
.btn:hover {
  background-color: white;
  color: #720000;
}
.btn2 {
font-family: Arial, Helvetica, sans-serif;
transition-duration: 0.4s;
  background-color: #720000; 
  color: white;
  padding: 10px 41px;
  border: 2px solid #720000;
}
.btn2:hover {
  background-color: white;
  color: #720000;
}
.btn3 {
font-family: Arial, Helvetica, sans-serif;
transition-duration: 0.4s;
  background-color: #720000; 
  color: white;
  padding: 10px;
  border: 2px solid #720000;
}
.btn3:hover {
  background-color: white;
  color: #720000;
}
</style>
