import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminInsert extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		String s1 = request.getParameter("u1");
		String s2 = request.getParameter("u2");
		String s3 = request.getParameter("u3");
		String s4 = request.getParameter("u4");
		String s6 = request.getParameter("u6");
		String s5 = request.getParameter("u5");
		String tableName = "";
		if(s5.equals("free"))
		{
			tableName="bookinfo";
		}
		else 
		{
			tableName="paidbooks";
		}
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clg_project","root","root");
			
			Statement st = con.createStatement();
			
			String q ="insert into "+tableName+" values ('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s6+"')";
			
			st.executeUpdate(q);
			if(s5.equals("free"))
			{
				response.sendRedirect("adminShowAll");
			}
			else 
			{
				response.sendRedirect("paidShowAll");
			}
			
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