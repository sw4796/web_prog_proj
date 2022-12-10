<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지 활동 수정</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="mypage_modify_page.css">
</head>
<body>
	<%
	//인증된 세션인지 확인
	boolean login = true;
	if(session.getAttribute("id") == null) {
		login = false;
		response.sendRedirect("main.jsp");
	}
%>
    <div id="wrap">
        <nav class="navbar">
            <div class="navbar_logo">
                <img src="image/javas_logo.svg" onclick="location.href='main.jsp'">
            </div>
            <ul class="navbar_menu">
                <li><a href="">동아리 소개</a></li>
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
		<main>
		<br><br>
        <%
        String id = (String)session.getAttribute("id");
        Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost/javasclimbing?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbcurl,"javasclimbing","javas!21!");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select * from user_info where user_id='" + id + "'";
			rs = stmt.executeQuery(sql);
		}
		catch(Exception e) {
	   		out.println("DB 연동 오류입니다.:" + e.getMessage());
		}
		
		rs.last();
		rs.beforeFirst();
		
		while (rs.next()) {
		%>
			<div class="player-content">
				<div class="myInfoBox">
				<h2>이번 활동 등록하기</h2>
				<form action="mypage_modify_db.jsp" class="level_update" method="post">
				<div class="level_clear">
					<div>⚪ 클리어 횟수 : <input class="clear_number" type="number" name="white_cnt" value="0" min="-99"></div>
					<div>🟡 클리어 횟수 : <input class="clear_number" type="number" name="yellow_cnt" value="0" min="-99"></div>
					<div>🟠 클리어 횟수 : <input class="clear_number" type="number" name="orange_cnt" value="0" min="-99"></div>
					<div>🟢 클리어 횟수 : <input class="clear_number" type="number" name="green_cnt" value="0" min="-99"></div>
					<div>🔵 클리어 횟수 : <input class="clear_number" type="number" name="blue_cnt" value="0" min="-99"></div>
					<div>🔴 클리어 횟수 : <input class="clear_number" type="number" name="red_cnt" value="0" min="-99"></div>
					<div>🟣 클리어 횟수 : <input class="clear_number" type="number" name="purple_cnt" value="0" min="-99"></div>
					<div>🐘 클리어 횟수 : <input class="clear_number" type="number" name="gray_cnt" value="0" min="-99"></div>
					<div>🟤 클리어 횟수 : <input class="clear_number" type="number" name="brown_cnt" value="0" min="-99"></div>
					<div>⚫ 클리어 횟수 : <input class="clear_number" type="number" name="black_cnt" value="0" min="-99"></div>
					<div>누락된 출석 횟수 : <input class="clear_number" type="number" name="attendance" value="0" min="-99"></div>
				</div>
				<input type="submit" value="활동 등록하기">
      			<input type="reset" value="다시쓰기">
				</form>
				</div>
        	</div>
        <%
		}
        %>
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
</body>
</html>