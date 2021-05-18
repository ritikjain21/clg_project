import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminLogin extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		String s1 = request.getParameter("u1");
		String s2 = request.getParameter("u2");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clg_project","root","root");
			Statement st = con.createStatement();

            String q = "select * from admininfo where (UNAME='"+s1+"' AND UPASS='"+s2+"') ";
			
			ResultSet rs = st.executeQuery(q);
		
			if(rs.next())
			{
				 response.sendRedirect("adminMenu.html");			
			}
		    else{
			 response.sendRedirect("adminLogin.html");			
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
