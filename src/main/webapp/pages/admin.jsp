<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<link rel="stylesheet" href="assets/Admin.css">
</head>
<body>
    <nav>
        <img src="assets/images/logo.png" id="navlogo" width="70cm" height="70cm" alt="not fount">
        <div class="Navtitle">
            <h1>Admin</h1>
        </div>
        <div class="NavOptions">
            <ul>
                <li><a href="#">Home</a></li>
                <li>
                    <div class="dropdown">
                        <a href="">Option1</a>
                        <div class="submenu">
                            <ul>
                                <li>Option2</li>
                                <li>Option3</li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="https://payments-test.cashfree.com/links/L4c41juoqtfg">Option4</a></li>
                <li><a href="login.html">Logout</a></li>
            </ul>
        </div>
    </nav>
    <div class="Admin_Welcome">
    <h1 style="text-align: center; background-color: skyblue;">Welcome to Administor</h1>
    <img src="assets/images/adminportal.jpg" alt="No image found" width="100%" height="400px" style="border-color: black;border-style: solid;" >
    </div>
<h1 style="background-color:skyblue;">Admin page</h1>
<hr>
<h2 style="background-color:yellow;">Enter the course details to register in website</h2>
<div class="Course_Enter">
<form method="post">
<input type="textbox" placeholder="Subject Name :" id="sub_name" name="sub_name">
<input type="textbox" placeholder="Course code" id="sub_code" name="sub_code">
<input type="submit" placeholder="Enter into DB">
<h2 style="background-color:yellow;">Enter the question into exam</h2>
<form method="post">
<input type="text" id="course_name" name="course_name" placeholder="Course Name :">
<input type="text" id="course_question" name="course_question" placeholder="Question :"><br>
<input type="text" id="answer1" name="answer1" placeholder="Option 1 :"><br>
<input type="text" id="answer2" name="answer2" placeholder="Option 2 :"><br>
<input type="text" id="answer3" name="answer3" placeholder="Option 3 :"><br>
<input type="text" id="answer4" name="answer4" placeholder="Option 4 :"><br><hr>
<input type="text" id="correctanswer" name="correctanswer" placeholder="Answer :">
<input type="submit">
<input type="reset">
<hr>

</form>
</div>
<hr>
<%
try
{
String subject_name=request.getParameter("sub_name");
String subject_code=request.getParameter("sub_code");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
PreparedStatement st=con.prepareStatement("insert into SubjectRegis values (Serial.nextval,?,?)");
st.setString(1,subject_name);
st.setString(2,subject_code);
st.executeUpdate();
}
catch(Exception e)
{
	
}

%>

<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
String course_name=request.getParameter("course_name");
String course_question=request.getParameter("course_question");
String option1=request.getParameter("answer1");
String option2=request.getParameter("answer2");
String option3=request.getParameter("answer3");
String option4=request.getParameter("answer4");
String answer=request.getParameter("correctanswer");
PreparedStatement st1=con1.prepareStatement("insert into CourseQuestions values(?,?,?,?,?,?,?,Serialno.nextval)");
st1.setString(1,course_name);
st1.setString(2,course_question);
st1.setString(3,option1);
st1.setString(4,option2);
st1.setString(5,option3);
st1.setString(6,option4);
st1.setString(7,answer);
st1.executeUpdate();
}
catch(Exception e)
{
	
}
%>
<a href="login.html">LOGOUT</a>
</form>
</body>
</html>