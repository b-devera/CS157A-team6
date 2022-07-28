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
    <title>Appointment</title>
    </head>
  <body>
    <button type="button" name="back" onclick="window.location='inventory.jsp'">Back</button>
    <center><h1>Make an Appoinment</h1>
    <form action="appointmentValidate.jsp" method="post">
    <p>
        Appointment ID:
        <input type="text" name="appointment_id" id="donBox">
    </p>
    <p>
        First Name:
        <input type="text" name="fname" id="donBox">
    </p>
    <p>
    	<label>
    		Last Name:
    		<input type="text" name="lname" id="empBox"/>
    	</label>
	</p>
    <p>
        <label>
            Birthday:
            <input type="text" name="birthday" id="bloodBox"/>
        </label>
    </p>
    <p>
        <label>
            Appointment Date:
            <input type="text" name="date" id="qBox"/>
        </label>
    </p>
    <p>
        <label>
            Time:
            <input type="text" name="time" id="qBox"/>
        </label>
    </p>
            <input type="reset" value="Clear" />
            <input type="submit" value="Submit"/>
  </form>
    </center>
   </table>
  </body>
</html>