package Calender;

import java.io.IOException;
import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		int id = 0, cnt;

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"root","0000");
			stmt = conn.createStatement();
			//act_id에서 가장 큰값, 행 개수 추출해오기
			String sql_maxid = "select max(act_id) as max_id, count(*) as cnt from activity";
			rs = stmt.executeQuery(sql_maxid);
		}
		catch(Exception e) {
			System.out.println("DB 연동 오류입니다. :" + e.getMessage());
		}
		
		try { //max id 찾기
			while(rs.next()) {
				cnt = rs.getInt("cnt");
				if(cnt!=0)
					id = rs.getInt("max_id");
			}
		}
		catch(Exception e) {
			System.out.println("max_id: DB 연동 오류입니다. :" + e.getMessage());
		}

		id++;
		// 활동 form 값 받아오기
		String location = request.getParameter("location");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		String number = request.getParameter("number");
		String description = request.getParameter("description");
		String writer = "test";

		String sql_insert = "insert into activity values(" + id + ",'" + location + "','" + time + "','" + date + "','"
				+ number + "','" + description + "','" + writer + "')";

		System.out.println(sql_insert);
		
		 //DB에 값 insert 하기 
		try { 
			stmt.executeUpdate(sql_insert); 
		}
		 catch(Exception e) { 
		 System.out.println("insert_info: DB 연동 오류입니다. :" + e.getMessage()); 
		 }
		 
		response.sendRedirect("calender.html");
	}

}
