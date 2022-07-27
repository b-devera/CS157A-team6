<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<style>
    div.ex
    {
        width:300px;
        padding:10px;
        border:5px solid gray;
        margin:0px;
    }
#genderBox{
    margin-left: 22px;
}
#ageBox{
    margin-left: 42px;
}
#weightBox{
    margin-right: 10px
}
#bloodBox{
    margin-right: 4px
}
#userBox{
	margin-left: 2px
}
#passBox{
	margin-left: 5px
}
#lastRow {
    margin-left: 0px;
}
</style>
  <head>
    <title>Information Update</title>
    </head>
  <body>
  <button type="button" name="back" onclick="history.back()">Back</button>
    <center><h1>Information Update</h1>
    <form action="donorInfoUpdateValidate.jsp" method="post">
          <p>
        <label>
            First Name
            <input type="text" name="first_name" id="first_nameBox"/>
        </label>
    </p>
    <p>
        <label>
            Last Name
            <input type="text" name="last_name"/>
        </label>
    </p>
    <p>
        <label>
            Age
            <input type="parseInt" name="age" id="ageBox">
        </label>
    </p>
    <p>
        Gender:
        <select name="gender" value="gender" id="genderBox">
            <option value="" name="no"> </option>
            <option value="M" name="M">M</option>
            <option value="F" name="F">F</option>
        </select>

    </p>
    <p>
        <label>
            Blood Type
            <input type="text" name="bloodType" id="bloodBox"/>
        </label>
    </p>
    <p>
        <label>
            Height (in)
            <input type="text" name="height"/>
        </label>
    </p>
    <p>
        <label>
            Weight (lbs)
            <input type="text" name="weight" id="weightBox"/>
        </label>
    </p>
    <p>
    	<label>
    		Username
    		<input type="text" name = "username" id="userBox"/>
    	</label>
    </p>
    <p>
    	<label>
    		Password
    		<input type="password" name="password" id="passBox"/>
    	</label>
	</p>
            <input type="reset" value="Clear" />
            <input type="submit" value="Submit"/>
  </form>
  	<center>
    <% 
    String db = "BloodBank";
    String user = "root";
    String pw = "password";
        try {
        	int id = (Integer) session.getAttribute("donor_id");
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM donor2 WHERE id= ?");
            pstmt.setInt(1,id);
            
            ResultSet rs = pstmt.executeQuery();
           
            %>
            <table border="2">
            <tr>
                <th> ID </th>
                <th> First Name </th>
                <th> Last Name </th>
                <th> Gender </th>
                <th> Age </th>
                <th> Blood Type </th>
                <th> Height (inches) </th>
                <th> Weight (lbs) </th>
                <th> Username </th>
                <th> Password </th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getInt(7)%></td>
                    <td><%=rs.getInt(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>

                </tr>
            <% }
            rs.close();
            pstmt.close();
            con.close();
        }
        catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    </center>
   </table>
  </body>
</html>