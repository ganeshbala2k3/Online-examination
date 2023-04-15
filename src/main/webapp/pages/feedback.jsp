<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String name=request.getParameter("Name");
   String email=request.getParameter("Email");
   String number=request.getParameter("Mobile");
   String message=request.getParameter("Message");
   try
   {
   Class.forName("oracle.jdbc.driver.OracleDriver");  
   Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
   String sql="insert into feedbackform values(?,?,?,?)";
   PreparedStatement st=con.prepareStatement(sql);
   st.setString(1,name);
   st.setString(2,email);
   st.setString(3,number);
   st.setString(4,message);
   int x=st.executeUpdate();
   
   }
   catch(Exception e)
   {
	   
   }
   
   %>
</body>
</html>