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
		
		Connection conn = null;
		Statement stmt_list = null;
		Statement stmt_member = null;
		ResultSet rs_list = null;
		ResultSet rs_member= null;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"root","0000");
			stmt_list = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		            ResultSet.CONCUR_UPDATABLE);
			//date와 일치하는 활동 list 추출해오기
			String sql_list = "select * from activity where date='" + date + "'";
			rs_list = stmt_list.executeQuery(sql_list);
		
		JSONObject json = new JSONObject();
		json.put("date", "2022-11-17");
		json.put("location", "클라이밍파크 종로점");
		
		String jsonStr = json.toJSONString();
		System.out.println(jsonStr);
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
	}

}
