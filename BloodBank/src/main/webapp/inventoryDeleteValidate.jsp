<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String bagID = request.getParameter("removeId");
				
	if(!(bagID.equals(null) || bagID.equals("")))
	{
		int bagIDINT = Integer.parseInt(request.getParameter("removeId"));
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("DELETE FROM inventory WHERE bag_id =?");
			pst.setInt(1, bagIDINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventory.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Removal Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryDelete.jsp").include(request,response);
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/inventoryDelete.jsp").include(request,response);
	}
%>