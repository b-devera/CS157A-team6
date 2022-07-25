<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String donorId = request.getParameter("donorid");
    String employeeId = request.getParameter("empID");
	String blood_type = request.getParameter("blood_type");
	String quantity = request.getParameter("quantity");
	String expiration = request.getParameter("expiration");
				
	if(!(donorId.equals(null) || donorId.equals(""))&&!(employeeId.equals(null) || employeeId.equals(""))&&
			!(blood_type.equals(null) || blood_type.equals(""))&& 
			!(quantity.equals(null) || quantity.equals(""))&&  
			!(expiration.equals(null) || expiration.equals(""))) 
	{
		int donorIdINT = Integer.parseInt(request.getParameter("donorid"));
		int employeeidINT = Integer.parseInt(request.getParameter("empID"));
		int quantityINT = Integer.parseInt(request.getParameter("quantity"));
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("INSERT INTO bloodbank.inventory( donor_id, employee_id,"
					+" blood_type, quantity, expiration) VALUES(?,?,?,?,?)");
			pst.setInt(1, donorIdINT);
			pst.setInt(2, employeeidINT);
			pst.setString(3, blood_type);
			pst.setInt(4, quantityINT);
			pst.setString(5, expiration);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventory.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Addition Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials - Username is taken (Case insensitive).</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryInsert.jsp").include(request,response);
			
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/inventoryInsert.jsp").include(request,response);
	}
%>