<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expire",0); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
</head>
<body>
<center>
<h1>Profile page</h1></center>
<h2>Details of the user : </h2>
<%
HttpSession s=request.getSession();
String username=s.getAttribute("t1").toString();
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
PreparedStatement st=con.prepareStatement("select mobilenumber from signUpTable where uname=?");
st.setString(1,username);
ResultSet rs= st.executeQuery();
rs.next();
String num=rs.getString(1);
%>
<table border=1>
<tr>
<th>Details</th>
<th>Information</th>
</tr>
<tr>
<td>Name</td>
<td><%out.print(username);%></td>
</tr>
<tr>
<td>Mobile Number</td>
<td><%out.print(num);%></td>
</tr>
</table>
<a href="forgetpassword.jsp">Forget Password</a>
<a href="index.html">Logout</a>
</body>
</html>