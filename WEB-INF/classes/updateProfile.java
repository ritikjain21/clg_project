import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class updateProfile extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		String s1 = request.getParameter("u1");
		String s2 = request.getParameter("u2");
		String s3 = request.getParameter("u3");
		String s4 = request.getParameter("u4");
		String s5 = request.getParameter("u5");
		String s6 = request.getParameter("u6");
		String s7 = request.getParameter("u7");
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clg_project","root","root");
			Statement st = con.createStatement();

            String q = "update registereduser set NAME='"+s1+"',CONTACT='"+s2+"',EMAIL='"+s3+"',STREET='"+s4+"',CITY='"+s5+"',STATE='"+s6+"',PASSWORD='"+s7+"' ";
			
			st.executeUpdate(q);
			
			response.sendRedirect("profile.jsp");
			
			con.close();
		}
		catch(Exception e){
			out.println(e);
		}
		out.println("</body>");
		out.println("</html>");
	}
}