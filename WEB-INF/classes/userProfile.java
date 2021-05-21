import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class userProfile extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		String s1 = request.getParameter("u1");
		String s2 = request.getParameter("u2");
		String s3 = request.getParameter("u3");
		String s4 = request.getParameter("u4");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clg_project","root","root");
			Statement st = con.createStatement();
			
			String q ="insert into registereduser values ('"+s1+"','"+s2+"','"+s3+"','"+s4+"') ";
		    st.executeUpdate(q);
            	
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		out.println("</body>");
		out.println("</html>");
	}
}

//set classpath=C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\servlet-api.jar;.;%classpath%
//javac --release 8 *.java