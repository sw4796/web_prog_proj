package LoginSignup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		String name="";
		boolean id_exist=false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
			conn=DriverManager.getConnection(jdbcurl, "root", "0000");
			stmt=conn.createStatement();
			String sql="select * from member where user_id='"+id+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				id_exist=true;
				System.out.println(pw);
				if(pw.equals(rs.getString("pw"))) {
					name=rs.getString("name");
					HttpSession session=request.getSession();
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					out.print("<script>location.href='main.jsp';</script>");
				}else {
					out.print("<script>alert('비밀번호가 틀립니다.');</script>");
					out.print("<script>location.href='LoginSignup.jsp';</script>");
				}
			}
			if(id_exist==false) {
				out.print("<script>alert('존재하지 않는 아이디입니다.');</script>");
				out.print("<script>location.href='LoginSignup.jsp';</script>");
			}
			
			stmt.close();
			conn.close();
		}
		catch(Exception e)
		{
			out.println("<script>alert('db 연동 오류입니다 : ');</script>");
		}
	}

}
