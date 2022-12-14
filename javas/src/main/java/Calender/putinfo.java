package Calender;

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
 * Servlet implementation class putinfo
 */
@WebServlet("/putinfo_calender")
public class putinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public putinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session=request.getSession();
		String user_id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		int act_id = 0, cnt;

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost/javasclimbing?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"javasclimbing","javas!21!");
			stmt = conn.createStatement();
			//act_id에서 가장 큰값, 행 개수 추출해오기
			String sql_maxid = "select max(act_id) as max_id, count(*) as cnt from activity";
			rs = stmt.executeQuery(sql_maxid);
		
			//max id 찾기
			while(rs.next()) {
				cnt = rs.getInt("cnt");
				if(cnt!=0)
					act_id = rs.getInt("max_id");
			}

			act_id++;
			// 활동 form 값 받아오기
			String location = request.getParameter("location");
			String time = request.getParameter("time");
			String date = request.getParameter("date");
			int number = Integer.parseInt(request.getParameter("number"));
			String description = request.getParameter("description");
			String writer = user_id;
			String color = request.getParameter("color");
	
			String sql_insert = "insert into activity values(" + act_id + ",'" + location + "','" + time + "','" + date + "',"
					+ number + ",'" + description + "','" + writer + "','" + color +"')";
	
			System.out.println(sql_insert);
			
			 //DB에 값 insert 하기 
			stmt.executeUpdate(sql_insert); 
			
			//활동 DB에 주최자 추가하기
			sql_insert = "insert into participation ( user_id, act_id, name ) values('"+writer+"'," + act_id + ",'"+name+"')";
			stmt.executeUpdate(sql_insert); 
			
			response.sendRedirect("calender.jsp");
			
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			System.out.println("putinfo: DB 연동 오류입니다. :" + e.getMessage());
			out.println("<script>alert('error: 활동 동록에 error가 발생했습니다.')</script>");
			out.println("<script>location.href='main.jsp'</script>");
		}
	}

}
