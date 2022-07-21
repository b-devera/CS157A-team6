<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String db= "bloodbank";
	String user = "root";
	String pw = "password";
	
	String empId =  request.getParameter("empID");
	String employeePass = request.getParameter("txtPwd");
				
	if((!(empId.equals(null) || empId.equals(""))&& !(employeePass.equals(null) || 
			employeePass.equals("")))) 
	{
		int employeeId =  Integer.parseInt(request.getParameter("empID"));
		try{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);   
			PreparedStatement pst = con.prepareStatement("SELECT id, admin_status, password FROM employee WHERE id=? AND password=?");
			pst.setInt(1, employeeId);
			pst.setString(2, employeePass);
			ResultSet rs = pst.executeQuery();  
			
			if(rs.next()){
				String admin = rs.getString("admin_status");
				if(admin.equals("Yes")){
					getServletContext().getRequestDispatcher("/admin.jsp").include(request,response);
				} else {
					getServletContext().getRequestDispatcher("/employeePortal.jsp").include(request,response);
				}
			}
			else{  
   				getServletContext().getRequestDispatcher("/employeeError.jsp").include(request,response);
			}
		} catch(Exception e){       
			out.println(e);       
		}   
	}
	else{
		%>
		<center><p style="color:red">Invalid Login Credentials.</p></center>
		<%
			getServletContext().getRequestDispatcher("/employeeLogin.jsp").include(request,response);
	}
%>