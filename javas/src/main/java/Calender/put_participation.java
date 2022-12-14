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

import org.json.simple.JSONObject;

/**
 * Servlet implementation class put_participation
 */
@WebServlet("/participation.do")
public class put_participation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public put_participation() {
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
		
		String user_id = request.getParameter("user_id");
		int act_id = Integer.parseInt(request.getParameter("act_id"));
		String name = request.getParameter("name");
		System.out.println(user_id);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost/javasclimbing?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"javasclimbing","javas!21!");
			stmt = conn.createStatement();
			//해당 활동의 최대인원 찾기
			String sql = "select max_member from activity where act_id=" + act_id;
			rs = stmt.executeQuery(sql);
			
			rs.next();
			int max_num = rs.getInt("max_member");
			
			//현재 참가인원 가져오기
			sql = "select count(*) as cnt from participation where act_id=" + act_id;
			rs = stmt.executeQuery(sql);
			
			rs.next();
			int now_num = rs.getInt("cnt");
			
			sql =  "select exists (select * from participation where act_id="+act_id+" and user_id='"+user_id+"') as exist";
			rs = stmt.executeQuery(sql);
			
			rs.next();
			int exist = rs.getInt("exist");
			JSONObject result = new JSONObject();
			System.out.println(now_num);
			System.out.println(exist);

			//참가인원이 모두 꽉찬 경우
			if(now_num >= max_num) {
				result.put("status", "full");
				out.println(result.toJSONString());
				return;
			}
			//이미 참가한 경우
			if(exist==1) {
				result.put("status", "exist");
				out.println(result.toJSONString());
				return;
			}
			
			//참가 테이블에 데이터 입력하기
			sql = "insert into participation ( user_id, act_id, name ) values('"+ user_id + "'," + act_id + ",'" + name + "')";
			stmt.executeUpdate(sql);
			
			result.put("status", "success");
			out.println(result.toJSONString());
		}
		catch(Exception e) {
			System.out.println("put_participation: DB 연동 오류입니다. :" + e.getMessage());
			out.println("fail");
		}
		
	}

}
