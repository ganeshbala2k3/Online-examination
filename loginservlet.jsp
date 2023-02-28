<%@ page import= java.sql.*%>
<%
String username= request.getParameter("username");
String password=request.getParameter("password");
%>
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","system","1234");
    PreparedStatement ps = conn.prepareStatement("insert into login_page(username, password)values(?,?);");
    ps.setString(1,username);
    ps.setString(2,password);
    int x = ps.executeUpdate();
}

catch(Exception e)
{
    out.println(e);
}
