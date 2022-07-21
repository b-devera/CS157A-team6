<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Employee Portal</title>
	</head>
	<body>
		<button type="button" name="back" onclick="window.location='employeeLogin.jsp'">Back</button>
		<center><h1>Employee Portal</h1>
		<%
			String db= "bloodbank";
			String user = "root";
			String pw = "password";

			try{
				int employeeId =  Integer.parseInt(request.getParameter("empID"));
				String employeePass = request.getParameter("txtPwd");
        		Class.forName("com.mysql.jdbc.Driver"); 
        		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
        		Statement stmt = con.createStatement();
        		ResultSet rs = stmt.executeQuery("Select first_name, last_name from employee where id="+employeeId);
        		out.println("Hello");
        		while (rs.next()) {
                    out.println(" "+rs.getString(1) + " "+ rs.getString(2));
                }
   			} catch(Exception e){       
       			out.println(e);       
   			}   
		%>
		<br/><br/><input type="button" value="Landing Page" onclick="window.location='home.jsp'" ><br/><br/>
		<input type="button" value="Donors" onclick="window.location='donors.jsp'" ><br/><br/>
		</center>
	</body>
</html>