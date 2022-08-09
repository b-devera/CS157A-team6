<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String donorID = request.getParameter("removeId");
				
	if(!(donorID.equals(null) || donorID.equals("")))
	{
		int donorINT = Integer.parseInt( donorID);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("DELETE FROM donor WHERE id =?");
			pst.setInt(1, donorINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donors.jsp").include(request,response);
				%>
				<link rel="stylesheet" href="css/update.css" />
				<center><p class="notification-text">Donor has been successfuly removed!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<link rel="stylesheet" href="css/update.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorDelete.jsp").include(request,response);
		} 
	}
	else{
		%>
		<link rel="stylesheet" href="css/update.css" />
				<center><p class="notification-text">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/donorDelete.jsp").include(request,response);
	}
%>