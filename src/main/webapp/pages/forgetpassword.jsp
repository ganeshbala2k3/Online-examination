<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
</head>
<body>
<h1>Change the password</h1>
<form method="post">
<label for="user_name">User name :</label>
<input type="text" name="user_name" id="user_name" placeholder="Username">
<br>
<label for="oldpassword">Old password :</label>
<input type="password" name="oldpassword" id="oldpassword" placeholder="Old password">
<br>
<label for="newpassword">New password :</label>
<input type="password" name="newpassword" id="newpassword" placeholder="New password"><br>
<label for="changepassword">New password Again :</label>
<input type="password" name="changepassword" id="changepassword" placeholder="New password"><br>
<input type="submit">
<input type="reset"><br>
</form>
<%

String username=request.getParameter("user_name");
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String changepassword=request.getParameter("changepassword");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");

PreparedStatement st=con.prepareStatement("select password from signUpTable where uname=?");
st.setString(1,username);
ResultSet rs=st.executeQuery();
rs.next();
String temp=rs.getString(1);
if(oldpassword.contentEquals(temp)==true && newpassword.contentEquals(changepassword)== true)
{
	    PreparedStatement st1=con.prepareStatement("update signUpTable set password=? where uname=?");
		st1.setString(1,changepassword);
		st1.setString(2,username);
		int x=st1.executeUpdate();
		String demo;
		if(x==1)
		{
			demo="succesfull";
		}
		else
		{
			demo="not succesfull.. Error occured";
		}
		out.print("Password is "+demo);
}
else
{
	out.print("Reenter the details");
}
}
catch(Exception e)
{
	
}

%>
<a href="welcome.jsp"> Home </a>
</body>
</html>