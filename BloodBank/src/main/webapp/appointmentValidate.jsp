<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String firstName = request.getParameter("fname");
    String lastName = request.getParameter("lname");
	String appointmentDate = request.getParameter("date");
	String time = request.getParameter("time");
				
	if(!(firstName.equals(null) || firstName.equals(""))&&
            !(lastName.equals(null) || lastName.equals(""))&&
	    !(appointmentDate.equals(null) || appointmentDate.equals(""))&& 
            !(time.equals(null) || time.equals("")) ) 
	{

		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("INSERT INTO bloodbank.appointment( first_name,"
					+" last_name, appointment_date, time) VALUES(?,?,?,?)");
			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, appointmentDate);
			pst.setString(4, time);
		 	int result = pst.executeUpdate();  
		 	
			if(result == 1){
				getServletContext().getRequestDispatcher("/appointment.jsp").include(request,response);
				%>
				<center><p style="color:green">Appointment Addition Successful!</p></center>
				<%
			}
			pst.close();
			con.close();
		} catch(Exception e){   
			out.println(e);
			%>
			<center><p style="color:red">Invalid Credentials (Case insensitive).</p></center>
			<%
				getServletContext().getRequestDispatcher("/appointmentInsert.jsp").include(request,response);
		} 
	}
	else{
		%>
		<center><p style="color:red">Invalid Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/appointmentInsert.jsp").include(request,response);
	}
%>
