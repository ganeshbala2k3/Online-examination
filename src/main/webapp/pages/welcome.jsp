<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        Online Examination
    </title>
    <link rel="stylesheet" href="assets/stylesheet.css">

</head>

<body>
<script>
function get1()
{
	var number="1";
	window.location.replace("welcome.jsp?mess="+number);
}
function get2()
{
	var number="2";
	window.location.replace("welcome.jsp?mess="+number);
}
function get3()
{
	var number="3";
	window.location.replace("welcome.jsp?mess="+number);
}
</script>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
PreparedStatement st1=con.prepareStatement("select subject_name from SubjectRegis order by Sno desc");
/* st.setString(1,username); */
ResultSet rs1= st1.executeQuery();
rs1.next();
String num=rs1.getString(1);
HttpSession hsession= request.getSession();
%>
    <script src="script.js"></script>
    <div class="Header-univeristy-link">
        <a href="www.kluniversity.in">Klef</a>
        | <a href="#callbyref">About us</a>
        | <a href="#Dashboard">Dashboard</a>
        | <a href="#Footer">Contact us</a>
    </div>
    <nav>
        <img src="assets/images/logo.png" id="navlogo" width="70cm" height="70cm" alt="not fount">
        <div class="Navtitle">
            <h1>Exam Portal</h1>
        </div>
        <div class="NavOptions">
            <ul>
                <li><a href="#">Home</a></li>
                <li>
                    <div class="dropdown">
                        <a href="#">Practice</a>
                        <div class="submenu">
                            <ul>
                                <li>Online</li>
                                <li>Books</li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="https://payments-test.cashfree.com/links/L4c41juoqtfg">Payment</a></li>
                <li><a href="profile.jsp">
                Profile                
                </a></li>
            </ul>
        </div>
    </nav>


    <div class="banner">
        <center>
            <img src="assets/images/banner_image.jpg" alt="No image found" id="bannerimage">
        </center>
        <h1>
            Welcome to Online Examination Portal<br> <%HttpSession s=request.getSession();
        String username=s.getAttribute("t1").toString();
        out.print(username.toUpperCase());
        
        
        %>
        </h1>
        
    </div>
    <div class="Dashboard" id="Dashboard">
        <h2>Dashboard</h2>
        <div class="flex-container">
            <div class="flex-item" id="flex-item-1"><a href="#">Exams</a></div>
            <div class="flex-item" id="flex-item-2"><a href="#">Exam dates</a></div>
            <div class="flex-item" id="flex-item-3"><a href="#">Results</a></div>
            <div class="flex-item" id="flex-item-4"><a href="#">Resources</a></div>
        </div>
    </div>  
    <div class="third-container">
        <div class="latest-exams">
            <center>
                <h3>*Important*</h3>
            </center>
            <div class="exam-1">  
            <a href="Exam.jsp" onclick="get1()">
            <%
            out.println(rs1.getString(1));
            String temp1=rs1.getString(1);
         hsession.setAttribute("demo1",temp1);
            %></a>
            </div>
           <div class="exam-1">  
            <a href="Exam.jsp" onclick="get2()">
            <%
            rs1.next();
            out.println(rs1.getString(1));
            String temp2=rs1.getString(1);
         hsession.setAttribute("demo2",temp2);
            %></a>
     	     
            </div>
         <div class="exam-1">  
            <a href="Exam.jsp" onclick="get3()">
            <%
            rs1.next();
            out.println(rs1.getString(1));
            String temp3=rs1.getString(1);
         hsession.setAttribute("demo3",temp3);
            %></a>
        </div>
        </div>
        <%
    	String number1=request.getParameter("mess");
    	hsession.setAttribute("message", number1);
    	%>
        <img src="assets/images/examsindeximage.jpeg" alt="Image not found" id="indexpageimage">
    </div>
    <br>
    <div class="AboutPortal" id="callbyref">
        <center>
            <h1 style="background-color: red; border: solid 0.4px;">About the Portal</h1>
        </center>
        <div class="AboutPortalinner">
            <div class="description">
                <p>Lorem ipsum, dolor sit amet consectetur ,officiis voluptatem mollitia vero saepe aspernatur!
                    Explicabo maiores natus ad, tenetur facere, assumenda ab molestias error placeat ipsa magni aperiam!
                    Deserunt, qui quia! Iure nulla ipsam cupiditate quos atque repellendus eveniet, quia vero quaerat,
                    quis nisi consequuntur deserunt quo voluptate tempora optio, iste delectus exercitationem suscipit
                    quod error? Eaque autem rem quam dolor eos, aliquam cupiditate architecto ut suscipit impedit.
                    Quaerat, veniam?</p>
            </div>
            <img src="assets/images/logo.png" alt="No image found" id="aboutimage">
        </div>
    </div>
    <div class="ImageGrid">
        <center>
            <h1 style="background-color: red;">Features of Portal</h1>
        </center>
  <div class="ImageGridContainer">
            <div class="ImageGridItem">
                <img src="assets/images/imagegriditem-1.jpeg" width="250cm" height="250cm" alt="No image found">
            </div>
            <div class="ImageGridItem">
                <img src="assets/images/welcome_page_2.jpeg" width="250cm" height="250cm" alt="No image found">
            </div>
            <div class="ImageGridItem">
                <img src="assets/images/welcome_page_3.jpeg" width="250cm" height="250cm" alt="No image found">
            </div>
    </div>
    <h3>The best Online Exam Portal makes this process streamlined and simple.
    </h3>
    <div class="Question-form">
        <center><h4>Feedback form for better development </h4></center>
        <form action="welcome.jsp" method="post">
        <div class="Questionform-1">
        <label for="Name">Name :</label>
       <input type="text" name="Name" id="Name">
       <br>
       <label for="Email">Email :</label>
       <input type="email" name="Email" id="Email">
       <br>
       <label for="Mobile">Phone :</label>
       <input type="tel" name="Mobile" id="Mobile">
       <br>
       
       <label for="Message">Message :</label>
       <br>
       <textarea name="Message" id="Message" cols="30" rows="10"></textarea>
       <br>
       <input type="submit" name="submit">
        </div>
        <%
   String name=request.getParameter("Name");
   String email=request.getParameter("Email");
   String number=request.getParameter("Mobile");
   String message=request.getParameter("Message");
   try
   {
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
        </form>
    </div>
    <footer id="Footer">
        <h3>Contact us</h3>
        Developed and designed by : Ganesh
        <br>
        Electronics and computer science 
        <div class="social-media-logo">
         <a href="https://www.linkedin.com/in/ganesh-bala-539004226/"><img src="assets/images/linkedinlogo.png" width="25cm" height="25cm" alt="-"></a>
         <a href="https://www.instagram.com/"><img src="assets/images/instagramlogo.jpeg" width="25cm" height="25cm" alt="-"></a>
         <a href="https://github.com/ganeshbala01"><img src="assets/images/githublogo.png" width="25cm" height="25cm" alt="-"></a>
        </div>

    </footer>

</body>

</html>