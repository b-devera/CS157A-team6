<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String ptUsername =  request.getParameter("ptUsername");
	String ptPassword = request.getParameter("pwd");
				
	if((!(ptUsername.equals(null) || ptUsername.equals("")) && !(ptPassword.equals(null) || ptPassword.equals("")))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("SELECT id, username, password FROM patient WHERE username=? AND password=?");
			pst.setString(1, ptUsername);
			pst.setString(2, ptPassword);
			ResultSet rs = pst.executeQuery();  
			
			if(rs.next()){
				getServletContext().getRequestDispatcher("/patientPortal.jsp").include(request,response);	
			}
			else{  
   				getServletContext().getRequestDispatcher("/patientLoginError.jsp").include(request,response);
			}
		} catch(Exception e){       
			out.println(e);       
		}   
	}
	else{
		%>
		<center><p style="color:red">Invalid Login Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/patientLogin.jsp").include(request,response);
	}
%>