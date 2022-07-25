<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<style>
    div.ex
    {
        width:300px;
        padding:10px;
        border:5px solid gray;
        margin:0px;
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
    <title>Blood Bag Registration</title>
    </head>
  <body>
    <button type="button" name="back" onclick="window.location='inventory.jsp'">Back</button>
    <center><h1>Blood Bag Registration</h1>
    <form action="inventoryValidate.jsp" method="post">
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
            <input type="text" name="expiration" id="expBox">
        </label>
    </p>
            <input type="reset" value="Clear" />
            <input type="submit" value="Submit"/>
  </form>
    </center>
   </table>
  </body>
</html>