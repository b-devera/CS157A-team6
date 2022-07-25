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
#lastRow {
    margin-left: 0px;
}
</style>
  <head>
    <title>Register</title>
    </head>
  <body>
    <button type="button" name="back" onclick="window.location='home.jsp'">Back</button>
    <center><h1>Patient Registration</h1>
    <form action="patientRegisterValidate.jsp" method="post">
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
            Blood Type
            <input type="text" name="bloodType" id="bloodBox"/>
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
    </center>
   </table>
  </body>
</html>