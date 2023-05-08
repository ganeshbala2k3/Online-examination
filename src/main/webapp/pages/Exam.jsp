<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Examination</title>
</head>
<body>
<%
HttpSession hsession=request.getSession();
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
String number=hsession.getAttribute("message").toString();
String subject_name=" ";
out.println(number);
if(number.contentEquals("1"))
{
 subject_name=hsession.getAttribute("demo1").toString();
}
else if(number.contentEquals("2"))
{
 subject_name=hsession.getAttribute("demo2").toString();
}
else if(number.contentEquals("3"))
{
 subject_name=hsession.getAttribute("demo3").toString();
}
out.println(subject_name);
PreparedStatement st=con.prepareStatement("select question,Sno from CourseQuestions where course=? order by Sno desc");
st.setString(1,subject_name);
ResultSet rs=st.executeQuery();
PreparedStatement st1=con.prepareStatement("select option1 from CourseQuestions where course=? order by Sno desc");
st1.setString(1, subject_name);
ResultSet rs1=st1.executeQuery();
PreparedStatement st2=con.prepareStatement("select option2 from CourseQuestions where course=? order by Sno desc");
st2.setString(1, subject_name);
ResultSet rs2=st2.executeQuery();
PreparedStatement st3=con.prepareStatement("select option3 from CourseQuestions where course=? order by Sno desc");
st3.setString(1, subject_name);
ResultSet rs3=st3.executeQuery();
PreparedStatement st4=con.prepareStatement("select option4 from CourseQuestions where course=? order by Sno desc");
st4.setString(1, subject_name);
ResultSet rs4=st4.executeQuery();
try
{
rs.next();
rs1.next();
rs2.next();
rs3.next();
rs4.next();
%>
<form action="">
<p>1)<%out.print(rs.getString(1));%></p>
<input type="radio" id="option1">
<label for="option1"><%=rs1.getString(1) %></label>
<input type="radio" id="option2">
<label for="option2"><%=rs2.getString(1) %></label>
<input type="radio" id="option3">
<label for="option3"><%=rs3.getString(1) %></label>
<input type="radio" id="option4">
<label for="option4"><%=rs4.getString(1) %></label>\
<%
}
catch(Exception e)
{
	out.println("NO QUESTIONS FOUND ENTERED BY ADMIN");
}
%>
<%
try
{
	rs.next();
	rs1.next();
	rs2.next();
	rs3.next();
	rs4.next();
%>
<p>2)<%out.print(rs.getString(1));%></p>
<input type="radio" id="option1">
<label for="option1"><%=rs1.getString(1) %></label>
<input type="radio" id="option2">
<label for="option2"><%=rs2.getString(1) %></label>
<input type="radio" id="option3">
<label for="option3"><%=rs3.getString(1) %></label>
<input type="radio" id="option4">
<label for="option4"><%=rs4.getString(1) %></label>
<%
}
catch(Exception e)
{
	out.println("NO QUESTIONS FOUND ENTERED BY ADMIN");
}
%>
<br>
<input type="submit">
<input type="reset">

</form>


</form>


</body>
</html>