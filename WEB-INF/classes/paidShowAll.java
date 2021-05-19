import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class paidShowAll extends HttpServlet
{
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter ();
		out.println("<html><head><title>Login Page</title><link rel='stylesheet' href='adminlogin.css'></head><body><div class = 'menu'><ul><li><a href='adminMenu.html'>Home</a></li> <li><a href='adminInsert.html'>Insert</a></li> <li><a href='adminShowAll'>FreeBooks</a></li> <li><a href='paidShowAll'>PaidBooks</a></li> <li><a href='adminDelete.html'>Delete</a></li> <li><a href='adminAllUser'>AllUser</a></li> <li><a href='adminLogin.html'>LogOut</a></li></ul></div><div id='data'><center><form action = 'insert' ><table cellpadding='10px'><th><h1><center> All Data of PaidBooks</center></h1></th>");
	
		try
		{
			Class.forName ("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/clg_project?allowPublicKeyRetrieval=true&useSSL=false","root", "root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from paidbooks");
			out.println("<tr>");
			out.println("<td><u>SerialN</u></td>");
			out.println("<th><u>Book Name</u></th>");
			out.println("<th><u>Book Link</u></th>");
			out.println("<th><u>Image Link</u></th>");
			out.println("<th><u>Author</u></th>");
			out.println("</tr>");
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td><a href="+rs.getString(3)+">Click to Open</a></td>");
				out.println("<td><img src="+rs.getString(4)+" width='50px'></td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("</tr>");
			}
			con.close ();
		}catch (Exception e)
		{
			out.println (e);
		}
		out.println("</table></form></center></div></body></html>");
	}
}
			
//set classpath=C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\servlet-api.jar;.;%classpath%
//javac --release 8 *.java