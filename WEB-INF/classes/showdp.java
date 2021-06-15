import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class showdp extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
		String email = request.getParameter("email");
		OutputStream out = response.getOutputStream();
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clg_project","root","root");
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("Select IMAGE from registereduser where EMAIL='"+email+"'");
			rs.next();
			out.write(rs.getBytes(1));
			con.close();
		}
		catch(Exception e)
		{
			PrintWriter pw = new PrintWriter(out); 
			pw.println(e);
			response.sendRedirect("https://bootdey.com/img/Content/avatar/avatar7.png");
		}
	}
}