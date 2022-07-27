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
#bagBox{
	margin-right: 120px 
}
#bloodBox{
    margin-right: 1px
}
#qBox{
    margin-left: 17px;
}
#expBox{
	margin-right:30px
}
#donBox{
    margin-left: 10px;
}
#empBox{
    margin-right: 15px
}
#lastRow {
    margin-left: 0px;
}
</style>
  <head>
    <title>Inventory Update</title>
    </head>
  <body>
  <button type="button" name="back" onclick="window.location='inventoryAdmin.jsp'">Back</button>
    <center><h1>Inventory Update</h1>
    <form action="inventoryUpdateValidate.jsp" method="post">
    <p>
    	Enter Bag ID of Desired Item:
    	<input type="text" name="bagid" id="bagBox">
    <p>
        Donor ID:
        <input type="text" name="donorid" id="donBox">
    </p>
    <p>
    	<label>
    		Employee ID:
    		<input type="text" name="empID" id="empBox"/>
    	</label>
	</p>
    <p>
        <label>
            Blood Type:
            <input type="text" name="blood_type" id="bloodBox"/>
        </label>
    </p>
    <p>
        <label>
            Quantity:
            <input type="text" name="quantity" id="qBox"/>
        </label>
    </p>
        <p>
        <label>
            Expiration Date:
            <input type="DATE" name="expiration" id="expBox">
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
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, pw);
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM inventory");
            %>
            <table border="2">
            <tr>
                <th>Bag ID</th>
                <th>Donor ID</th>
                <th>Employee ID</th>
                <th>Blood Type</th>
                <th>Quantity mL</th>
                <th>Expiration</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getString(6)%></td>

                </tr>
            <% }
            rs.close();
            stmt.close();
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