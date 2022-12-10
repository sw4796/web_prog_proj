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
 * Servlet implementation class getPW
 */
@WebServlet("/getPW")
public class getPW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getPW() {
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
		String id = request.getParameter("id");
		String Qnum = request.getParameter("Qnum");
		String Qans = request.getParameter("Qans");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost/javasclimbing?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"javasclimbing","javas!21!");
			stmt=conn.createStatement();
			String sql="select * from member where user_id='"+id+"'";
			rs=stmt.executeQuery(sql);
			boolean id_exist=false;
			while(rs.next())
			{
				id_exist=true;
				if(!(Qnum.equals(rs.getString("Qnum")))) {
					out.print("<script>alert('회원가입 시 선택한 질문이 아닙니다.');</script>");
					out.print("<script>location.href='findIDPW.jsp';</script>");
				}
				else if(!(Qans.equals(rs.getString("Qans")))) {
					out.print("<script>alert('질문에 대한 답이 틀립니다.');</script>");
					out.print("<script>location.href='findIDPW.jsp';</script>");
				}else {
					out.print("<script>alert('비밀번호 : "+rs.getString("pw")+"');</script>");
					out.print("<script>location.href='findIDPW.jsp';</script>");
				}
			}
			if(id_exist==false) {
				out.print("<script>alert('존재하지 않는 아이디입니다.');</script>");
				out.print("<script>location.href='findIDPW.jsp';</script>");
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
