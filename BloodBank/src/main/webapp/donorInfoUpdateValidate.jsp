<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	int id = (Integer) session.getAttribute("donor_id");
	String first = request.getParameter("first_name");
    String last = request.getParameter("last_name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String blood = request.getParameter("bloodType");
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");
	String username =  request.getParameter("username");
	String password = request.getParameter("password");
				
	if(!(first.equals(null) || first.equals(""))&&!(last.equals(null) || last.equals(""))&&
			!(age.equals(null) || age.equals(""))&& !(gender.equals(null) || gender.equals(""))&&
			!(blood.equals(null) || blood.equals(""))&&!(height.equals(null) || height.equals(""))&&
			!(weight.equals(null) || weight.equals(""))&& !(username.equals(null) || username.equals("") ) 
					&& !(password.equals(null) || password.equals(""))) 
	{
		int ageInt = Integer.parseInt(request.getParameter("age"));
		int heightInt = Integer.parseInt(request.getParameter("height"));
	    int weightInt = Integer.parseInt(request.getParameter("weight"));
	    
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor SET "
					+" first_name = ?, last_name = ?, gender = ?, age = ?, blood_type = ?, heightIN = ?, "
							+ " weightLB = ?, username = ?, password = ? WHERE id = ?;");
			pst.setString(1, first);
			pst.setString(2, last);
			pst.setString(3, gender);
			pst.setInt(4, ageInt);
			pst.setString(5, blood);
			pst.setInt(6, heightInt);
			pst.setInt(7, weightInt);
			pst.setString(8, username);
			pst.setString(9, password);
			pst.setInt(10, id);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){           
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	} else if(!(id == 0) &&
			!(first.equals(null) || first.equals(""))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET first_name = ? WHERE id=? ;");
			pst.setString(1, first);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(age.equals(null) || age.equals(""))) 
	{
		int ageInt = Integer.parseInt(request.getParameter("age"));
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET age = ? WHERE id=? ;");
			pst.setInt(1, ageInt);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(last.equals(null) || last.equals(""))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET last_name = ? WHERE id=? ;");
			pst.setString(1, last);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(gender.equals(null) || gender.equals(""))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET gender = ? WHERE id=? ;");
			pst.setString(1, gender);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(blood.equals(null) || blood.equals(""))) 
	{
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET blood_type = ? WHERE id=? ;");
			pst.setString(1, blood);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(height.equals(null) || height.equals(""))) 
	{
		int heightInt = Integer.parseInt(request.getParameter("height"));
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET heightIN = ? WHERE id=? ;");
			pst.setInt(1, heightInt);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(weight.equals(null) || weight.equals(""))) 
	{
		int weightInt = Integer.parseInt(request.getParameter("weight"));
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET weightLB = ? WHERE id=? ;");
			pst.setInt(1, weightInt);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(username.equals(null) || username.equals(""))) 
	{
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET username = ? WHERE id=? ;");
			pst.setString(1, username);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			
			%>
			<center><p style="color:red">Invalid Credentials - Username is taken.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}else if(!(id == 0) &&
			!(password.equals(null) || password.equals(""))) 
	{
		
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor" 
				+ " SET password = ? WHERE id=? ;");
			pst.setString(1, password);
			pst.setInt(2,id);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorInfo.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
			
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/donorInfoUpdate.jsp").include(request,response);
	}
%>