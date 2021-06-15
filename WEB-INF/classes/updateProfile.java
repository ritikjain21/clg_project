import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize=1024*1024*10)
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
		Part s8 = request.getPart("u8");
		String img=null;
		InputStream is = null;
		if(s8 != null)
		{
		is = s8.getInputStream();
		img = s8.getSubmittedFileName();
		}
 		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clg_project","root","root");
			Statement st = con.createStatement();

            // String q = "update registereduser set NAME='"+s1+"',CONTACT='"+s2+"',S
			//TREET='"+s4+"',CITY='"+s5+"',STATE='"+s6+"',PASSWORD='"+s7+"' where EMAIL='"+s3+"'  ";
			if(s8 != null)
			{
				PreparedStatement ps = con.prepareStatement("update registereduser set NAME = ? , CONTACT = ? , STREET = ? , CITY = ? ,STATE = ? , PASSWORD = ? , IMAGE = ?  where EMAIL = ?");
				ps.setString(1,s1);
				ps.setString(2,s2);
				ps.setString(3,s4);
				ps.setString(4,s5);
				ps.setString(5,s6);
				ps.setString(6,s7);
				ps.setString(8,s3);
				ps.setBlob(7,is);
				ps.executeUpdate();
			}
			if(s8 != null)
			{
				PreparedStatement ps = con.prepareStatement("update registereduser set NAME = ? , CONTACT = ? , STREET = ? , CITY = ? ,STATE = ? , PASSWORD = ?  where EMAIL = ?");
				ps.setString(1,s1);
				ps.setString(2,s2);
				ps.setString(3,s4);
				ps.setString(4,s5);
				ps.setString(5,s6);
				ps.setString(6,s7);
				ps.setString(7,s3);
				ps.executeUpdate();
			}
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