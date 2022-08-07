<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Admin</title>
    </head>
  <body>
  <button type="button" name="Logout" onclick="window.location='employeeLogin.jsp'">Logout</button>
    <center><h1>JBK Blood Bank Admin Portal</h1><center>
    <input type="button" value="Landing Page" onclick="window.location='home.jsp'" ><br/><br/>
    <input type="button" value="Admins" onclick="window.location='admins.jsp'"><br/><br/>
    <input type="button" value="Appointments" onclick="window.location='appointment.jsp'" ><br/><br/> 
    <input type="button" value="Donors" onclick="window.location='donorsAdminRedirect.jsp'" ><br/><br/>
    <input type="button" value="Donations" onclick="window.location='donations.jsp'"><br/><br/>
    <input type="button" value="Employees" onclick="window.location='employees.jsp'" ><br/><br/>
    <input type="button" value="Inventory" onclick="window.location='inventoryAdmin.jsp'"><br/><br/>
    <input type="button" value="Patients" onclick="window.location='patients.jsp'" ><br/><br/>
    <input type="button" value="Transfusion Log" onclick="window.location='transfusions.jsp'" ><br/><br/>
    </center>
   </table>
  </body>
</html>
