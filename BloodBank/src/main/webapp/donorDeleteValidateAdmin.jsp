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
		int donorIDINT = Integer.parseInt(donorID);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("DELETE FROM donor WHERE  id=?");
			pst.setInt(1, donorIDINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorsAdminRedirect.jsp").include(request,response);
				%>
				<center><p style="color:green">Removal Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorDeleteAdmin.jsp").include(request,response);
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/donorDeleteAdmin.jsp").include(request,response);
	}
%>