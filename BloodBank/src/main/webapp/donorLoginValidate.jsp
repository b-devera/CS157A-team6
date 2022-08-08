<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String username =  request.getParameter("txtName");
	String password = request.getParameter("txtPwd");
				
	if((!(username.equals(null) || username.equals("") ) && !(password.equals(null) || password.equals("")))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("SELECT id, username, password FROM donor WHERE username=? AND password=?");
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();  
			
			if(rs.next()){
				getServletContext().getRequestDispatcher("/donorPortal.jsp").include(request,response);	
			}
			else{  
				%>
				<link rel="stylesheet" href="css/login.css" />
				<center><p class="notification-text">Invalid Login Credentials.</p></center>
				<%
   				getServletContext().getRequestDispatcher("/donorLogin.jsp").include(request,response);
			}
		} catch(Exception e){       
			out.println(e);       
		}   
	}
	else{
		%>
		<link rel="stylesheet" href="css/login.css" />
				<center><p class="notification-text">Invalid Login Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/donorLogin.jsp").include(request,response);
	}
%>