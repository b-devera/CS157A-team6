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
   		
   		<div class="home-container">
   			<center>
    			<br><button class="btn" type="button" onclick="window.location='donorLogin.jsp'">Donor Login</button>
    		</center>
    		
    		<center>
    			<br><button class="btn" type="button" onclick="window.location='patientLogin.jsp'">Patient Login</button>
    		</center>
    		
    		<center>
    			<br><button class="btn" type="button" onclick="window.location='employeeLogin.jsp'">Employee Login</button>
    		</center>
    		</br>
   		</div>
  	
    </body>
</html>