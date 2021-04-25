import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class loginServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		String s1 = request.getParameter("u1");
		String s2 = request.getParameter("u2");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clg_project","root","root");
			Statement st = con.createStatement();

            String q = "select * from registereduser where (NAME='"+s1+"' AND PASSWORD='"+s2+"') ";
			
			ResultSet rs = st.executeQuery(q);
		
			if(rs.next())
			{
				 response.sendRedirect("Home2.html");			
			}
		    else{
			 response.sendRedirect("Home.html");			
		    }
			
			con.close();
		}
		catch(Exception e){
			out.println(e);
		}
		out.println("</body>");
		out.println("</html>");
	}
}
