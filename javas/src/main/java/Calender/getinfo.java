package Calender;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getinfo
 */
@WebServlet("/getinfo_calender")
public class getinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getinfo() {
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
		
		String date_txt = request.getParameter("date");
		System.out.println("date_txt= " + date_txt);

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"root","0000");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		            ResultSet.CONCUR_UPDATABLE);
			//date와 년과 월이 일치하는 활동 list 추출해오기
			String sql = "select location, date from activity where date_format(date, '%Y-%m') = '" + date_txt +"' order by date asc, time asc";
			rs = stmt.executeQuery(sql);
		
			//날짜, 장소 json 만들기
			JSONObject jsonObject = new JSONObject();
			JSONArray req_array = new JSONArray();
			while(rs.next()) {
				JSONObject data = new JSONObject();
				data.put("date", rs.getString("date"));
				data.put("location", rs.getString("location"));
				System.out.println(data);
				req_array.add(data);
			}
			jsonObject.put("data", req_array);
			// {"data" : [ {"date": date ,"loaction": location}, {"date": date ,"loaction": location}, ...]} 형태로 저장
			
			// json 직렬화 하기
			String jsonstr = jsonObject.toJSONString();
			System.out.println(jsonstr);
			
			//json 반환 해주기
			PrintWriter out = response.getWriter();
			out.print(jsonstr);
			
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			System.out.println("getinfo_calender: DB 연동 오류입니다. :" + e.getMessage());
		}
		
	}

}
