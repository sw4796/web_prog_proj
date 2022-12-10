<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="mypage_page.css">
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
			String url = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "root", "0000");
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
        			<br><br>
        			<img class="first-profil" src="image/<%= rs.getString("image") %>" alt="profil">
					<div class="player-name"><%= rs.getString("name") %> 님의 마이페이지</div>
        			<p>클라이머 레벨 : <%= rs.getString("level") %>
        			<p>평점 : <%= Integer.parseInt(rs.getString("total_attendance")) + Integer.parseInt(rs.getString("total_clear")) %>
					<p>누적 출석 횟수 : <%= rs.getString("total_attendance") %>
                	<p>누적 등반 횟수 : <%= rs.getString("total_clear") %>
	                <p>하양 클리어 : <%= rs.getString("white_clear") %>
	                <p>노랑 클리어 : <%= rs.getString("yellow_clear") %>
	                <p>주황 클리어 : <%= rs.getString("orange_clear") %>
	                <p>초록 클리어 : <%= rs.getString("green_clear") %>
	                <p>파랑 클리어 : <%= rs.getString("blue_clear") %>
	                <p>빨강 클리어 : <%= rs.getString("red_clear") %>
	                <p>보라 클리어 : <%= rs.getString("purple_clear") %>
	                <p>회색 클리어 : <%= rs.getString("gray_clear") %>
	                <p>갈색 클리어 : <%= rs.getString("brown_clear") %>
	                <p>검정 클리어 : <%= rs.getString("black_clear") %>
	                <br><br>
	                <a href="mypage_modify.jsp">활동 반영하기</a>
	                <form action="imageUpload.jsp" method="post" enctype="multipart/form-data">
						<input type="file" name="uploadfiles"><br> 
						<input type="submit" value="사진 수정하기">
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