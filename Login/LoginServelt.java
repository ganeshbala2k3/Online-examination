package Login;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.rmi.ServerException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServelt extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServerException,IOException
    {
        PrintWriter pw= response.getWriter();
       String s= request.getParameter("username");
        pw.println("<h1> Hello,"+s);
        pw.close();

       
    }
}