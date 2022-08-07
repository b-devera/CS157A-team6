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
			PreparedStatement pst = con.prepareStatement("INSERT INTO bloodbank.donor(first_name, last_name, "
					+"gender, age, blood_type,  heightIN, weightLB, username, password) VALUES(?,?,?,?,?,?,?,?,?)");
			pst.setString(1, first);
			pst.setString(2, last);
			pst.setString(3, gender);
			pst.setInt(4, ageInt);
			pst.setString(5, blood);
			pst.setInt(6, heightInt);
			pst.setInt(7, weightInt);
			pst.setString(8, username);
			pst.setString(9, password);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorLogin.jsp").include(request,response);
				%>
				<center><p style="color:green">Account Creation Successful!</p></center>
				<%
			}
		} catch(Exception e){           
			%>
			<center><p style="color:red">Invalid Credentials - Username is taken (Case insensitive).</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorRegister.jsp").include(request,response);
			
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/donorRegister.jsp").include(request,response);
	}
%>