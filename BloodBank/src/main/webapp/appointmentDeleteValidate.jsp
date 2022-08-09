<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String apptID = request.getParameter("removeId");
				
	if(!(apptID.equals(null) || apptID.equals("")))
	{
		int appointIDINT = Integer.parseInt(request.getParameter("removeId"));
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("DELETE FROM appointment WHERE appointment_id =?");
			pst.setInt(1, appointIDINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/appointment.jsp").include(request,response);
				%>
				<link rel="stylesheet" href="css/delete.css" />
				<center><p class="notification-text">Appointment removed!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<link rel="stylesheet" href="css/delete.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/appointmentDelete.jsp").include(request,response);
		} 
	}
	else{
		%>
		<link rel="stylesheet" href="css/delete.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/appointmentDelete.jsp").include(request,response);
	}
%>