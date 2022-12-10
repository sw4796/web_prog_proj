<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% String level = request.getParameter("level"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%= level %> 클라이머 랭킹</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="detail_ranking_page.css">
</head>
<body>
<%
	//인증된 세션인지 확인
	boolean login = true;
	if(session.getAttribute("id")==null)
		login = false;
%>
	<div id="wrap">
		<nav class="navbar">
            <div class="navbar_logo">
                <img src="image/javas_logo.svg" onclick="location.href='main.jsp'">
            </div>
            <ul class="navbar_menu">
                <li><a href="intro.jsp">자바쓰 소개</a></li>
                <li><a href="calender.jsp">스케줄</a></li>
                <li><a href="ranking.jsp">랭킹</a></li>
            </ul>
            <ul class="navbar_sign">
            <%if(login){ //로그인 여부에 따라 바뀌기%>
        		<li><a href="mypage.jsp">마이페이지</a></li>
        		<li><a href="logout.jsp">로그아웃</a></li>
            <%} else{%>
                <li><a href="LoginSignup.jsp">로그인/회원가입</a></li>
            <%} %>
            </ul>
        </nav>
		<br><br>
		<main>
		<br><br>
			<div class="player-content">
			<%
			int rownum = 0;
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
				conn = DriverManager.getConnection(url, "root", "0000");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				String sql = "select *, row_number() over(order by total_attendance + total_clear desc) as ranking from user_info where level='" + level + "'";
				rs = stmt.executeQuery(sql);
			}
			catch(Exception e) {
		   		out.println("DB 연동 오류입니다.:" + e.getMessage());
			}
    
			rs.last();
			rownum = rs.getRow();
			rs.beforeFirst();
			if (rownum == 0) {
			%>
				<div class="non-member_alert">
					<div class="alert_font">해당 레벨에는 클라이머가 존재하지 않습니다!</div>
					<div class="alert_font">꾸준한 활동으로 클라이머 레벨을 올려보세요!</div>
				</div>
			<%
			}
	
			while (rs.next()) {
				if (level.equals("검정")) {
			%>
					<div class="climbing-level color-black">
						<div class="rank-part"><%= rs.getString("ranking") %>등 </div>
						<div class="name-part"><%= rs.getString("name") %></div>
						<div class="score-part">
							<div class="climbing-font">평점 : <%= Integer.parseInt(rs.getString("total_attendance")) + Integer.parseInt(rs.getString("total_clear")) %></div>
							<div class="climbing-font">누적 출석 횟수 : <%= rs.getString("total_attendance") %></div>
                            <div class="climbing-font">누적 등반 횟수 : <%= rs.getString("total_clear") %></div>
						</div>
						<div class=outer-circle>
    					</div>
						<div class="pie_wrap">
    						<!-- 원형 그래프 -->
    						<div class="pie_res">
        						<svg class="pie">
            						<circle idx='0' data-percent="<%= 100 * Float.parseFloat(rs.getString("white_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='1' data-percent="<%= 100 * Float.parseFloat(rs.getString("yellow_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='2' data-percent="<%= 100 * Float.parseFloat(rs.getString("orange_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='3' data-percent="<%= 100 * Float.parseFloat(rs.getString("green_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='4' data-percent="<%= 100 * Float.parseFloat(rs.getString("blue_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='5' data-percent="<%= 100 * Float.parseFloat(rs.getString("red_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='6' data-percent="<%= 100 * Float.parseFloat(rs.getString("purple_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='7' data-percent="<%= 100 * Float.parseFloat(rs.getString("gray_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='8' data-percent="<%= 100 * Float.parseFloat(rs.getString("brown_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
            						<circle idx='9' data-percent="<%= 100 * Float.parseFloat(rs.getString("black_clear")) / Float.parseFloat(rs.getString("total_clear"))%>" />
        						</svg>
    						</div>
						</div>
						<div class=inner-circle>
    					</div>
					</div>
			<%
				}
				else if (level.equals("갈색")) {
			%>
					<div class="climbing-level color-brown">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("회색")) {
			%>
					<div class="climbing-level color-gray">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("보라")) {
			%>
					<div class="climbing-level color-purple">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("빨강")) {
			%>
					<div class="climbing-level color-red">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("파랑")) {
			%>
					<div class="climbing-level color-blue">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("초록")) {
			%>
					<div class="climbing-level color-green">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("주황")) {
			%>
					<div class="climbing-level color-orange">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("노랑")) {
			%>
					<div class="climbing-level color-yellow">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
				else if (level.equals("하양")) {
			%>
					<div class="climbing-level color-white">
						<div class="climbing-font">이름 : <%= rs.getString("name") %></div>
						<div class="climbing-font">등수 : <%= rs.getString("ranking") %>등</div>
					</div>
			<%
				}
			}
			%>
			</div>
		</main>
		<footer>
                <p>천일이CU가는중</p>
                <p>이시우: swlee4796@naver.com</p>
                <p>강은중: imgoing02@naver.com</p>
                <p>김천일: qndldhd1@naver.com</p>
		</footer>
	</div>
	<%
		stmt.close();
		conn.close();
	%>
	<script type="text/javascript" src="detail_ranking_page.js"></script>
</body>
</html>