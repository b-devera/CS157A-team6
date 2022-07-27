<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String id =request.getParameter("donorId");
	String elig = request.getParameter("eligibility_date");
				
	if(!(id.equals(null) || id.equals("")) && !(elig.equals(null) || elig.equals(""))) 
	{
		int idInt = Integer.parseInt(id);
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("UPDATE bloodbank.donor2" 
				+ " SET eligibility = ? WHERE id=? ;");
			pst.setString(1, elig);
			pst.setInt(2,idInt);

		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/donorUpdateEligAdmin.jsp").include(request,response);
				%>
				<center><p style="color:green">Information Update Successful!</p></center>
				<%
			}
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials.</p></center>
			<%
				getServletContext().getRequestDispatcher("/donorUpdateEligAdmin.jsp").include(request,response);
			
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/donorUpdateEligAdmin.jsp").include(request,response);
	}
%>