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
    margin-right: 10px;
}
#expBox{
	margin-left:20px
}
#donBox{
    margin-left: 15px;
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
    <button type="button" name="back" onclick="history.back()">Back</button>
    <center><h1>Make an Appoinment</h1>
    <form action="appointmentValidate.jsp" method="post">
    <p>
        Donor ID:
        <input type="text" name="donID" >
    </p>
    <p>
    	<label>
    		Employee ID:
    		<input type="text" name="empID" id="empBox"/>
    	</label>
	</p>
    <p>
        <label>
            Appointment Date:
            <input type="DATE" name="date" id="qBox"/>
        </label>
    </p>
    <p>
        <label>
            Time:
            <input type="text" name="time" id="expBox"/>
        </label>
    </p>
            <input type="reset" value="Clear" />
            <input type="submit" value="Submit"/>
  </form>
    </center>
   </table>
  </body>
</html>