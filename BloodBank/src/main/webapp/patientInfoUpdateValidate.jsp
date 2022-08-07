<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	int id = (Integer) session.getAttribute("patient_id");
	String first = request.getParameter("first_name");
    String last = request.getParameter("last_name");
    String blood = request.getParameter("bloodType");
	String username =  request.getParameter("username");
	String password = request.getParameter("password");
				
	if(!(first.equals(null) || first.equals(""))&&!(last.equals(null) || last.equals(""))&&
			!(blood.equals(null) || blood.equals(""))&&
			!(username.equals(null) || username.equals("") ) && 
			!(password.equals(null) || password.equals(""))) 
	{

		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.patient SET "
					+" first_name = ?, last_name = ?, blood_type = ?, "
							+ "username = ?, password = ? WHERE id = ?;");
			pst.setString(1, first);
			pst.setString(2, last);
			pst.setString(3, blood);
			pst.setString(4, username);
			pst.setString(5, password);
			pst.setInt(6, id);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/patientInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){           
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/patientInfoUpdate.jsp").include(request,response);
			
		} 
	} else if(!(id == 0) &&
			!(first.equals(null) || first.equals(""))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.patient" 
				+ " SET first_name = ? WHERE id=? ;");
			pst.setString(1, first);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/patientInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/patientInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(last.equals(null) || last.equals(""))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.patient" 
				+ " SET last_name = ? WHERE id=? ;");
			pst.setString(1, last);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/patientInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/patientInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(blood.equals(null) || blood.equals(""))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.patient" 
				+ " SET blood_type = ? WHERE id=? ;");
			pst.setString(1, blood);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/patientInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/patientInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(username.equals(null) || username.equals(""))) 
	{
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.patient" 
				+ " SET username = ? WHERE id=? ;");
			pst.setString(1, username);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/patientInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			
			%>
			<center><p style="color:red">Invalid Credentials - Username is taken.</p></center>
			<%
				getServletContext().getRequestDispatcher("/patientInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(password.equals(null) || password.equals(""))) 
	{
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.patient" 
				+ " SET password = ? WHERE id=? ;");
			pst.setString(1, password);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/patientInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/patientInfoUpdate.jsp").include(request,response);
			
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/patientInfoUpdate.jsp").include(request,response);
	}
%>