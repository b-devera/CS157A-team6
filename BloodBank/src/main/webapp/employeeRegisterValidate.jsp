<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String first = request.getParameter("first_name");
    String last = request.getParameter("last_name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String password = request.getParameter("password");
				
	if(!(first.equals(null) || first.equals(""))&&!(last.equals(null) || last.equals(""))&&
			!(age.equals(null) || age.equals(""))&& 
			!(gender.equals(null) || gender.equals(""))&&  
			!(password.equals(null) || password.equals(""))) 
	{
		int ageInt = Integer.parseInt(request.getParameter("age"));
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("INSERT INTO bloodbank.employee(first_name, last_name, "
					+"age,  gender, password) VALUES(?,?,?,?,?)");
			pst.setString(1, first);
			pst.setString(2, last);
			pst.setInt(3, ageInt);
			pst.setString(4, gender);
			pst.setString(5, password);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/employees.jsp").include(request,response);
				%>
				<link rel="stylesheet" href="css/register.css" />
				<center><p class="notification-text">Employee account has been successfully created!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<link rel="stylesheet" href="css/register.css" />
				<center><p class="notification-text">Invalid Credentials - Username is taken (Case insensitive).</p></center>
			<%
				getServletContext().getRequestDispatcher("/employeeRegister.jsp").include(request,response);
			
		} 
	}
	else{
		%>
		<link rel="stylesheet" href="css/register.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/employeeRegister.jsp").include(request,response);
	}
%>