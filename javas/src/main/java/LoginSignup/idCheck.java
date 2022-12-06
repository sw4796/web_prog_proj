package LoginSignup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class idCheck
 */
@WebServlet("/ID_Duplicate_Check")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public idCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("test1");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String id = request.getParameter("id");
		boolean is_exist=false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
			conn=DriverManager.getConnection(jdbcurl, "root", "0000");
			stmt=conn.createStatement();
			String sql="select exists (select * from member where user_id='"+id+"') as exist";
			rs=stmt.executeQuery(sql);
			System.out.println(rs);

			while(rs.next())
			{
				is_exist=(rs.getInt("exist")==1);
			}
			System.out.println(is_exist);
			JSONObject json = new JSONObject();
			json.put("exist", is_exist);
			out.println(json.toJSONString());
			stmt.close();
			conn.close();
		}
		catch(Exception e)
		{
			out.println("<script>alert('db 연동 오류입니다 : '+e.getMessage);</script>");
		}
	}

}
