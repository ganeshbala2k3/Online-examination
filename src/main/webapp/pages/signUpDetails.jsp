<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% 
String uname=request.getParameter("username");
String pass=request.getParameter("password");
String num= request.getParameter("mobilenumber");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
String sql="insert into signUpTable values(?,?,?)";
PreparedStatement st=con.prepareStatement(sql);
st.setString(1,uname);
st.setString(2,pass);
st.setString(3,num);
int x = st.executeUpdate();
response.sendRedirect("login.html");
}
catch(Exception e)
{
}

%>
</body>
</html>