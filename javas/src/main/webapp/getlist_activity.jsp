<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%
		//인증된 세션인지 확인
		boolean login = true;
		String user_id = "";
		String name = "";
		
		if(session.getAttribute("id")==null)
			login = false;
		else{
			user_id = (String)session.getAttribute("id");
			name = (String)session.getAttribute("name");
		}
		//javascript에서 받은 date="2002-05-18" 형태
		String date = request.getParameter("date");
		//당일 날짜 포맷에 맞춰 생성
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//비교를 위해서 포맷 맞추기
		Date act_date = new Date(dateFormat.parse(date).getTime());
		Date today = new Date(dateFormat.parse(todayfm).getTime());
		//compare<0 이면 date < today 이다. -> 이미 지난 날
		int date_compare = act_date.compareTo(today); 
		
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
			String sql_list = "select act.*, mem.name from activity act, member mem where date='" + date  +"' and act.writer = mem.user_id order by time asc";
			rs_list = stmt_list.executeQuery(sql_list);
			
			rs_list.last();
			//아무 활동도 없는 경우
			if(rs_list.getRow() == 0){
				if(date_compare < 0){ //이미 지난 경우
					%>
					<div class="empty_list">
	                	<br>이 날짜에는 활동을 하지 않았습니다!
	                </div>
					<%
				}else{ // 안 지난 경우
					%>
					<div class="empty_list">
	                	예정된 활동이 없습니다.<br>
	                	직접 활동을 추가해 보세요!
	                </div>
					<%
				}
			}
			rs_list.beforeFirst();
			
			//활동 list 순회하면서 html 생성
			while(rs_list.next()){
				System.out.println(rs_list.getString("location"));
				//해당 활동의 참여멤버 추출하기
					stmt_member = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				            ResultSet.CONCUR_UPDATABLE);
					String sql_member = "select * from participation where act_id=" + rs_list.getInt("act_id") + " order by timestamp";
					rs_member = stmt_member.executeQuery(sql_member);
					
					rs_member.last();
					int row = rs_member.getRow();
					rs_member.beforeFirst();

				%>
				<li class="activity">
		            <div class="activity_summary" onclick="open_activity_info(this)" style="border-left: 10px solid <%=rs_list.getString("color")%>">
		                <p class="activity_time"><%=rs_list.getString("time").substring(0,5) %></p>
		                <div class="activity_title">
		                    <h3 class="activity_location"><%=rs_list.getString("location") %></h3>
		                    <p class="writer">주최자:<%=rs_list.getString("name") %></p>
		                </div>
		                <p class="activity_people"><%=row %>/<%=rs_list.getInt("max_member") %></p>
		            </div>
		            <div class="activity_info hidden" style="border-left: 10px solid <%=rs_list.getString("color")%>">
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
			                    		out.println("<div>"+rs_member.getString("name")+"</div>");
			                    	}
			                    %>
		                    </div>
		                    <div class="btn-container">
		                    <%if(login&&date_compare>=0){ //로그인을 하고 활동 시간이 끝나지 않았을 때만 표시%>
		                    	<button class="participate_button" onclick="participate_activity('<%=user_id%>',<%=rs_list.getInt("act_id")%>,'<%=name%>')">참여하기</button>
		                    <%} %>
		                    </div>
		                </div>
		            </div>
		        </li>
			
			<% 
			} 
			if(stmt_member != null)
				stmt_member.close();
			stmt_list.close();
			conn.close();
		}
		catch(Exception e) {
			System.out.println("sql_list: DB 연동 오류입니다. :" + e.getMessage());
		}
		%>
</body>
</html>