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
String username=request.getParameter("username");
String password=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
PreparedStatement st=con.prepareStatement("select password from signUpTable where uname=?");
st.setString(1,username);
ResultSet rs= st.executeQuery();
rs.next();
String temp= rs.getString(1);
if(temp.contentEquals(password))
{
    if(username.contentEquals("ganesh")==true && temp.contentEquals("ganesh123")==true)
    {
    	HttpSession s= request.getSession();
    	s.setAttribute("t1",username);
    	response.sendRedirect("admin.jsp");
    }
    else
    {
	HttpSession s= request.getSession();
	s.setAttribute("t1",username);
	response.sendRedirect("welcome.jsp");
}}

%>
</body>
</html>  