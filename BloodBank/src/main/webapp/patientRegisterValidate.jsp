<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String first = request.getParameter("first_name");
    String last = request.getParameter("last_name");
    String blood = request.getParameter("bloodType");
	String username =  request.getParameter("username");
	String password = request.getParameter("password");
				
	if(!(first.equals(null) || first.equals(""))&&!(last.equals(null) || last.equals(""))&&
			!(blood.equals(null) || blood.equals(""))&& 
			!(username.equals(null) || username.equals("") ) && 
			!(password.equals(null) || password.equals(""))) 
	{
	    
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("INSERT INTO bloodbank.patient(first_name, last_name, "
					+" blood_type,  username, password) VALUES(?,?,?,?,?)");
			pst.setString(1, first);
			pst.setString(2, last);
			pst.setString(3, blood);
			pst.setString(4, username);
			pst.setString(5, password);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/patientLogin.jsp").include(request,response);
				%>
				<link rel="stylesheet" href="css/register.css" />
				<center><p class="notification-text">Account has been successfully created!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			%>
			<link rel="stylesheet" href="css/register.css" />
				<center><p class="notification-text">Invalid Credentials - Username is taken (Case insensitive).</p></center>
			<%
				getServletContext().getRequestDispatcher("/patientRegister.jsp").include(request,response);
			
		} 
	}
	else{
		%>
		<link rel="stylesheet" href="css/register.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/patientRegister.jsp").include(request,response);
	}
%>