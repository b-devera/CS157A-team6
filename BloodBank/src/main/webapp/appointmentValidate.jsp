<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String donorString = request.getParameter("donID");
    String employeeString = request.getParameter("empID");
	String appointmentDate = request.getParameter("date");
	String time = request.getParameter("time");
				
	if(!(donorString.equals(null) || donorString.equals(""))&&
            !(employeeString.equals(null) || employeeString.equals(""))&&
	    !(appointmentDate.equals(null) || appointmentDate.equals(""))&& 
            !(time.equals(null) || time.equals("")) ) 
	{

		int donorINT = Integer.parseInt(donorString);
		int employeeINT= Integer.parseInt(employeeString);
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("INSERT INTO bloodbank.appointment( donor_id,"
					+" employee_id, appointment_date, time) VALUES(?,?,?,?)");
			pst.setInt(1, donorINT);
			pst.setInt(2, employeeINT);
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
