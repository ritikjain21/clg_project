import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class regServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
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
            	
			
			response.sendRedirect("Login.html");	
            			
			
			con.close();
		}
		catch(Exception e)
		{
			response.sendRedirect("Registration.jsp?u1="+s1+"&u2="+s2+"&u3="+s3+"&error=Email already exists");
			out.println(e);
		}
		out.println("</body>");
		out.println("</html>");
	}
}
