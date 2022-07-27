<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
    <% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
    
    String bagId = request.getParameter("bagid");
    String donorId = request.getParameter("donorid");
    String employeeId = request.getParameter("empID");
	String blood_type = request.getParameter("blood_type");
	String quantity = request.getParameter("quantity");
	String expiration = request.getParameter("expiration");

	
	if(!(bagId.equals(null) || bagId.equals(""))&&
			!(donorId.equals(null) || donorId.equals(""))&&
			!(employeeId.equals(null) || employeeId.equals(""))&&
			!(blood_type.equals(null) || blood_type.equals(""))&& 
			!(quantity.equals(null) || quantity.equals(""))&&  
			!(expiration.equals(null) || expiration.equals(""))) 
	{
		int bagIdINT = Integer.parseInt(bagId);
		int donorIdINT = Integer.parseInt(donorId);
		int employeeidINT = Integer.parseInt(employeeId);
		int quantityINT = Integer.parseInt(quantity);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE inventory SET"
					+ " donor_id = ?, employee_id = ?, blood_type = ?, quantity =?, expiration = ? "
						+"WHERE bag_id=?;");
			pst.setInt(1, donorIdINT);
			pst.setInt(2, employeeidINT);
			pst.setString(3, blood_type);
			pst.setInt(4, quantityINT);
			pst.setString(5, expiration);
			pst.setInt(6,bagIdINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventoryAdmin.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Update Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryUpdate.jsp").include(request,response);	
		} 
	}
	else if(!(bagId.equals(null) || bagId.equals(""))&&
			!(donorId.equals(null) || donorId.equals("")))
	{
		int bagIdINT = Integer.parseInt(bagId);
		int donorIdINT = Integer.parseInt(donorId);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE inventory SET"
					+ " donor_id = ? WHERE bag_id=?;");
			pst.setInt(1, donorIdINT);
			pst.setInt(2,bagIdINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventoryAdmin.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Update Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryUpdate.jsp").include(request,response);	
		} 
	}
	else if(!(bagId.equals(null) || bagId.equals(""))&&
			!(employeeId.equals(null) || employeeId.equals("")))
	{
		int bagIdINT = Integer.parseInt(bagId);
		int employeeIdINT = Integer.parseInt(employeeId);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE inventory SET"
					+ " employee_id = ? WHERE bag_id=?;");
			pst.setInt(1, employeeIdINT);
			pst.setInt(2,bagIdINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventoryAdmin.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Update Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryUpdate.jsp").include(request,response);	
		} 
	}
	else if(!(bagId.equals(null) || bagId.equals(""))&&
			!(blood_type.equals(null) || blood_type.equals("")))
	{
		int bagIdINT = Integer.parseInt(bagId);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE inventory SET"
					+ " blood_type = ? WHERE bag_id=?;");
			pst.setString(1, blood_type);
			pst.setInt(2,bagIdINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventoryAdmin.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Update Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryUpdate.jsp").include(request,response);	
		} 
	}	else if(!(bagId.equals(null) || bagId.equals(""))&&
			!(quantity.equals(null) || quantity.equals("")))
	{
		int bagIdINT = Integer.parseInt(bagId);
		int quantityINT = Integer.parseInt(quantity);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE inventory SET"
					+ " quantity = ? WHERE bag_id=?;");
			pst.setInt(1, quantityINT);
			pst.setInt(2,bagIdINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventoryAdmin.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Update Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryUpdate.jsp").include(request,response);	
		} 
	}
	else if(!(bagId.equals(null) || bagId.equals(""))&&
			!(expiration.equals(null) || expiration.equals("")))
	{
		int bagIdINT = Integer.parseInt(bagId);
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE inventory SET"
					+ " expiration = ? WHERE bag_id=?;");
			pst.setString(1, expiration);
			pst.setInt(2,bagIdINT);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/inventoryAdmin.jsp").include(request,response);
				%>
				<center><p style="color:green">Inventory Update Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/inventoryUpdate.jsp").include(request,response);	
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/inventoryUpdate.jsp").include(request,response);
	}
    %>
