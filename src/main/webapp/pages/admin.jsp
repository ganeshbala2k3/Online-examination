<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
</head>
<body>
<form method="post">
<input type="textbox" placeholder="Subject Name :" id="sub_name" name="sub_name">
<input type="textbox" placeholder="Course code" id="sub_code" name="sub_code">
<input type="submit" placeholder="Enter into DB">
<%
try
{
String subject_name=request.getParameter("sub_name");
String subject_code=request.getParameter("sub_code");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
PreparedStatement st=con.prepareStatement("insert into SubjectRegis values (Sno.nextval,?,?)");
st.setString(1,subject_name);
st.setString(2,subject_code);
st.executeUpdate();
}
catch(Exception e)
{
	
}

%>
</form>
</body>
</html>