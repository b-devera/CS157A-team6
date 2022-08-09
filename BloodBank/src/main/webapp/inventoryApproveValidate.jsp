<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String bagID = request.getParameter("approveId");
	String adminString = request.getParameter("adminID");
				
	if(!(bagID.equals(null) || bagID.equals("")) &&
			!(adminString.equals(null) || adminString.equals("")))
	{
		int bagIDINT = Integer.parseInt(bagID);
		int adminINT = Integer.parseInt(adminString);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE inventory SET approved_by = ? WHERE bag_id =?");
			pst.setInt(1, adminINT);
			pst.setInt(2, bagIDINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventoryAdmin.jsp").include(request,response);
				%>
				<link rel="stylesheet" href="css/info.css" />
				<center><p class="notification-text">Blood bag has been approved!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<link rel="stylesheet" href="css/info.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryApprove.jsp").include(request,response);
		} 
	}
	else{
		%>
		<link rel="stylesheet" href="css/info.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/inventoryApprove.jsp").include(request,response);
	}
%>