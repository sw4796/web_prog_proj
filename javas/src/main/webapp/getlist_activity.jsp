<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%
		String date = request.getParameter("date");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs_list = null;
		ResultSet rs_member= null;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"root","0000");
			stmt = conn.createStatement();
			//date와 일치하는 활동 list 추출해오기
			String sql_list = "select * from activity where date='" + date + "'";
			rs_list = stmt.executeQuery(sql_list);
			
			//활동 list 순회하면서 html 생성
			while(rs_list.next()){
				System.out.println(rs_list.getString("location"));
				//해당 활동의 참여멤버 추출하기

					String sql_member = "select user_id from participation where act_id=" + rs_list.getInt("act_id") + "order by timestamp";
					rs_member = stmt.executeQuery(sql_member);

				%>
				<li class="activity" onclick="open_activity_info(this)">
		            <div class="activity_summary">
		                <p class="activity_time"><%=rs_list.getString("time").substring(0,5) %></p>
		                <div class="activity_title">
		                    <h3 class="activity_location"><%=rs_list.getString("location") %></h3>
		                    <p class="writer">주최자:<%=rs_list.getString("writer") %></p>
		                </div>
		                <p class="activity_people"><%=rs_member.getRow() %>/<%=rs_list.getInt("max_member") %></p>
		            </div>
		            <div class="activity_info hidden">
		                <div class="description">
		                    <h4>📜설명</h4>
		                    <p> <%=rs_list.getString("description") %></p>
		                </div>
		                <div class="members">
		                    <h4>🙋‍♂️참여 인원</h4>
		                    <div class="member_list">
			                    <%
			                    	//활동 멤버 순회하면서 출력하기
			                    	while(rs_member.next()){
			                    		out.println("<div>"+rs_member.getString("user_id")+"</div>");
			                    	}
			                    %>
		                    </div>
		                    <div class="btn-container"><button class="participate_button">참여하기</button></div>
		                </div>
		            </div>
		        </li>
			
			<% 
			} 
		}
		catch(Exception e) {
			System.out.println("sql_list: DB 연동 오류입니다. :" + e.getMessage());
		}
		%>
</body>
</html>