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
    <button type="button" name="back" onclick="history.back()">Back</button>
    <center><h1>Donor Registration</h1>
      <%
                     String db= "bloodbank";
                     String user = "root";
                     String pw = "password";

                     try{
                         java.sql.Connection con;
                         Class.forName("com.mysql.cj.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user,pw);
                         Statement stmt = con.createStatement();
                         
                         String first = request.getParameter("first_name");
                         String last = request.getParameter("last_name");
                         int age = Integer.parseInt(request.getParameter("age"));
                         String gender = request.getParameter("gender");
                         String blood = request.getParameter("bloodType");
                         int heightInt = Integer.parseInt(request.getParameter("height"));
                         int weightInt = Integer.parseInt(request.getParameter("weight"));

                         if(!first.isEmpty() && !last.isEmpty() && age !=0 && !gender.isEmpty()) {
                        	 int result = stmt.executeUpdate("INSERT INTO bloodbank.person(first_name,last_name,gender,age) VALUES('"+first+"','"+last+"','"+gender+"','"+age+"')");
                        	 out.print("Data Inserted!");
                         }
                         



                      }catch(SQLException e) {
                         e.printStackTrace();
                      } catch (Exception exc){
                        exc.printStackTrace();
                       }
                 %>
    <form action="register.jsp" method="post">
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

            <input type="reset" value="Clear" />
            <input type="submit" value="Submit"/>
  </form>
    </center>
   </table>
  </body>
</html>