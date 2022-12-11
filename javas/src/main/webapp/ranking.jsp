<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>랭킹</title>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>;
   <link rel="stylesheet" href="ranking_page.css">
</head>
    <body>
    <%
    String[] black_name = { "<공석>", "<공석>", "<공석>" }, brown_name = { "<공석>", "<공석>", "<공석>" },
          gray_name = { "<공석>", "<공석>", "<공석>" }, purple_name = { "<공석>", "<공석>", "<공석>" },
          red_name = { "<공석>", "<공석>", "<공석>" }, blue_name = { "<공석>", "<공석>", "<공석>" },
          green_name = { "<공석>", "<공석>", "<공석>" }, orange_name = { "<공석>", "<공석>", "<공석>" },
          yellow_name = { "<공석>", "<공석>", "<공석>" }, white_name = { "<공석>", "<공석>", "<공석>" };
    int[] black_attendance = { 0, 0, 0 }, brown_attendance = { 0, 0, 0 },
          gray_attendance = { 0, 0, 0 }, purple_attendance = { 0, 0, 0 },
          red_attendance = { 0, 0, 0 }, blue_attendance = { 0, 0, 0 },
          green_attendance = { 0, 0, 0 }, orange_attendance = { 0, 0, 0 },
          yellow_attendance = { 0, 0, 0 }, white_attendance = { 0, 0, 0 },
          black_clear = { 0, 0, 0 }, brown_clear = { 0, 0, 0 },
          gray_clear = { 0, 0, 0 }, purple_clear = { 0, 0, 0 },
          red_clear = { 0, 0, 0 }, blue_clear = { 0, 0, 0 },
          green_clear = { 0, 0, 0 }, orange_clear = { 0, 0, 0 },
          yellow_clear = { 0, 0, 0 }, white_clear = { 0, 0, 0 };
    String max_attendance_name = "<공석>", max_clear_name = "<공석>", max_attendance_level = "<미정>", max_clear_level = "<미정>";
    String max_attendance_image = ""; 
    String max_clear_image = "";
    int max_attendance = 0, max_clear = 0;
    Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      String sql = "select *, row_number() over(partition by level order by total_attendance + total_clear desc) as ranking from user_info";
      rs = stmt.executeQuery(sql);
   }
   catch(Exception e) {
         out.println("DB 연동 오류입니다.:" + e.getMessage());
   }
    
   rs.last();
   rs.beforeFirst();
   
   while (rs.next()) {
      if (Integer.parseInt(rs.getString("total_attendance")) > max_attendance) {
         max_attendance = Integer.parseInt(rs.getString("total_attendance"));
         max_attendance_name = rs.getString("name");
         max_attendance_level = rs.getString("level");
         max_attendance_image = rs.getString("image");
      }
      if (Integer.parseInt(rs.getString("total_clear")) > max_clear) {
         max_clear = Integer.parseInt(rs.getString("total_clear"));
         max_clear_name = rs.getString("name");
         max_clear_level = rs.getString("level");
         max_clear_image = rs.getString("image");
      }
      if (rs.getString("level").equals("검정")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            black_name[0] = rs.getString("name");
            black_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            black_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            black_name[1] = rs.getString("name");
            black_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            black_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            black_name[2] = rs.getString("name");
            black_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            black_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("갈색")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            brown_name[0] = rs.getString("name");
            brown_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            brown_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            brown_name[1] = rs.getString("name");
            brown_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            brown_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            brown_name[2] = rs.getString("name");
            brown_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            brown_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("회색")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            gray_name[0] = rs.getString("name");
            gray_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            gray_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            gray_name[1] = rs.getString("name");
            gray_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            gray_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            gray_name[2] = rs.getString("name");
            gray_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            gray_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("보라")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            purple_name[0] = rs.getString("name");
            purple_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            purple_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            purple_name[1] = rs.getString("name");
            purple_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            purple_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            purple_name[2] = rs.getString("name");
            purple_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            purple_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("빨강")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            red_name[0] = rs.getString("name");
            red_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            red_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            red_name[1] = rs.getString("name");
            red_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            red_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            red_name[2] = rs.getString("name");
            red_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            red_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("파랑")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            blue_name[0] = rs.getString("name");
            blue_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            blue_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            blue_name[1] = rs.getString("name");
            blue_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            blue_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            blue_name[2] = rs.getString("name");
            blue_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            blue_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("초록")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            green_name[0] = rs.getString("name");
            green_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            green_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            green_name[1] = rs.getString("name");
            green_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            green_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            green_name[2] = rs.getString("name");
            green_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            green_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("주황")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            orange_name[0] = rs.getString("name");
            orange_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            orange_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            orange_name[1] = rs.getString("name");
            orange_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            orange_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            orange_name[2] = rs.getString("name");
            orange_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            orange_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("노랑")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            yellow_name[0] = rs.getString("name");
            yellow_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            yellow_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            yellow_name[1] = rs.getString("name");
            yellow_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            yellow_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            yellow_name[2] = rs.getString("name");
            yellow_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            yellow_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
      else if (rs.getString("level").equals("하양")) {
         if (Integer.parseInt(rs.getString("ranking")) == 1) {
            white_name[0] = rs.getString("name");
            white_attendance[0] = Integer.parseInt(rs.getString("total_attendance"));
            white_clear[0] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 2) {
            white_name[1] = rs.getString("name");
            white_attendance[1] = Integer.parseInt(rs.getString("total_attendance"));
            white_clear[1] = Integer.parseInt(rs.getString("total_clear"));
         }
         else if (Integer.parseInt(rs.getString("ranking")) == 3) {
            white_name[2] = rs.getString("name");
            white_attendance[2] = Integer.parseInt(rs.getString("total_attendance"));
            white_clear[2] = Integer.parseInt(rs.getString("total_clear"));
         }
      }
   }
    %>
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
            
            <main>
                <div class="player-content">
                    <div class="swiper">
                        <div class="wrapper">
                            <div class="slider">
                                <img class="medal" src="image/first-medal.png" alt="first medal">
                                <span>출석왕</span>
                                <img class="medal" src="image/first-medal.png" alt="first medal"><br>
                                <img class="first-profil" src="image/<%= max_attendance_image %>" alt="profil">
                                <div class="player-name"><%= max_attendance_name %></div>
                                <div class="small-font">누적 출석 횟수 : <%= max_attendance %></div>
                                <div class="small-font">클라이머 레벨 : <%= max_attendance_level %></div>
                            </div>
                            <div class="slider">
                                <img class="medal" src="image/first-medal.png" alt="first medal">
                                <span>등반왕</span>
                                <img class="medal" src="image/first-medal.png" alt="first medal"><br>
                                <img class="first-profil" src="image/<%= max_clear_image %>" alt="profil">
                                <div class="player-name"><%= max_clear_name %></div>
                                <div class="small-font">누적 등반 횟수 : <%= max_clear %></div>
                                <div class="small-font">클라이머 레벨 : <%= max_clear_level %></div>
                            </div>
                        </div>
                        <div class="pagination">
                            <span idx='1' class="bullet active"></span> 
                            <span idx='2' class="bullet"></span>
                        </div>
                    </div>
                    <div class="climbing-level color-black">
                        <div class="climbing-label">검정 클라이머
                            <a class="more" href="detail_ranking.jsp?level=검정">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= black_name[1] %></div>
                            <div class="climbing-font">출석 : <%= black_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= black_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= black_attendance[1] + black_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= black_name[0] %></div>
                            <div class="climbing-font">출석 : <%= black_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= black_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= black_attendance[0] + black_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= black_name[2] %></div>
                            <div class="climbing-font">출석 : <%= black_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= black_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= black_attendance[2] + black_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-brown">
                        <div class="climbing-label">갈색 클라이머
                            <a class="more" href="detail_ranking.jsp?level=갈색">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= brown_name[1] %></div>
                            <div class="climbing-font">출석 : <%= brown_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= brown_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= brown_attendance[1] + brown_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= brown_name[0] %></div>
                            <div class="climbing-font">출석 : <%= brown_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= brown_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= brown_attendance[0] + brown_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= brown_name[2] %></div>
                            <div class="climbing-font">출석 : <%= brown_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= brown_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= brown_attendance[2] + brown_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-gray">
                        <div class="climbing-label">회색 클라이머
                            <a class="more" href="detail_ranking.jsp?level=회색">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= gray_name[1] %></div>
                            <div class="climbing-font">출석 : <%= gray_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= gray_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= gray_attendance[1] + gray_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= gray_name[0] %></div>
                            <div class="climbing-font">출석 : <%= gray_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= gray_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= gray_attendance[0] + gray_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= gray_name[2] %></div>
                            <div class="climbing-font">출석 : <%= gray_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= gray_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= gray_attendance[2] + gray_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-purple">
                        <div class="climbing-label">보라 클라이머
                            <a class="more" href="detail_ranking.jsp?level=보라">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= purple_name[1] %></div>
                            <div class="climbing-font">출석 : <%= purple_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= purple_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= purple_attendance[1] + purple_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= purple_name[0] %></div>
                            <div class="climbing-font">출석 : <%= purple_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= purple_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= purple_attendance[0] + purple_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= purple_name[2] %></div>
                            <div class="climbing-font">출석 : <%= purple_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= purple_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= purple_attendance[2] + purple_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-red">
                        <div class="climbing-label">빨강 클라이머
                            <a class="more" href="detail_ranking.jsp?level=빨강">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= red_name[1] %></div>
                            <div class="climbing-font">출석 : <%= red_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= red_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= red_attendance[1] + red_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= red_name[0] %></div>
                            <div class="climbing-font">출석 : <%= red_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= red_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= red_attendance[0] + red_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= red_name[2] %></div>
                            <div class="climbing-font">출석 : <%= red_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= red_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= red_attendance[2] + red_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-blue">
                        <div class="climbing-label">파랑 클라이머
                            <a class="more" href="detail_ranking.jsp?level=파랑">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= blue_name[1] %></div>
                            <div class="climbing-font">출석 : <%= blue_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= blue_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= blue_attendance[1] + blue_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= blue_name[0] %></div>
                            <div class="climbing-font">출석 : <%= blue_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= blue_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= blue_attendance[0] + blue_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= blue_name[2] %></div>
                            <div class="climbing-font">출석 : <%= blue_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= blue_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= blue_attendance[2] + blue_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-green">
                        <div class="climbing-label">초록 클라이머
                            <a class="more" href="detail_ranking.jsp?level=초록">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= green_name[1] %></div>
                            <div class="climbing-font">출석 : <%= green_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= green_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= green_attendance[1] + green_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= green_name[0] %></div>
                            <div class="climbing-font">출석 : <%= green_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= green_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= green_attendance[0] + green_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= green_name[2] %></div>
                            <div class="climbing-font">출석 : <%= green_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= green_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= green_attendance[2] + green_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-orange">
                        <div class="climbing-label">주황 클라이머
                            <a class="more" href="detail_ranking.jsp?level=주황">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= orange_name[1] %></div>
                            <div class="climbing-font">출석 : <%= orange_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= orange_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= orange_attendance[1] + orange_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= orange_name[0] %></div>
                            <div class="climbing-font">출석 : <%= orange_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= orange_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= orange_attendance[0] + orange_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= orange_name[2] %></div>
                            <div class="climbing-font">출석 : <%= orange_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= orange_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= orange_attendance[2] + orange_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-yellow">
                        <div class="climbing-label">노랑 클라이머
                            <a class="more" href="detail_ranking.jsp?level=노랑">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= yellow_name[1] %></div>
                            <div class="climbing-font">출석 : <%= yellow_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= yellow_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= yellow_attendance[1] + yellow_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= yellow_name[0] %></div>
                            <div class="climbing-font">출석 : <%= yellow_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= yellow_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= yellow_attendance[0] + yellow_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= yellow_name[2] %></div>
                            <div class="climbing-font">출석 : <%= yellow_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= yellow_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= yellow_attendance[2] + yellow_clear[2] %></div>
                        </span>
                    </div>
                    <div class="climbing-level color-white">
                        <div class="climbing-label">하양 클라이머
                            <a class="more" href="detail_ranking.jsp?level=하양">
                                <img class="plus" src="image/plus.png">
                            </a>
                        </div>
                        <span class="silver">
                            <img class="trophy" src="image/silver-trophy.png" alt="silver trophy">
                            <div><%= white_name[1] %></div>
                            <div class="climbing-font">출석 : <%= white_attendance[1] %> &nbsp&nbsp&nbsp 등반 : <%= white_clear[1] %></div>
                            <div class="climbing-font">평점 : <%= white_attendance[1] + white_clear[1] %></div>
                        </span>
                        <span class="gold">
                            <img class="trophy" src="image/gold-trophy.png" alt="gold trophy">
                            <div><%= white_name[0] %></div>
                            <div class="climbing-font">출석 : <%= white_attendance[0] %> &nbsp&nbsp&nbsp 등반 : <%= white_clear[0] %></div>
                            <div class="climbing-font">평점 : <%= white_attendance[0] + white_clear[0] %></div>
                        </span>
                        <span class="bronze">
                            <img class="trophy" src="image/bronze-trophy.png" alt="bronze trophy">
                            <div><%= white_name[2] %></div>
                            <div class="climbing-font">출석 : <%= white_attendance[2] %> &nbsp&nbsp&nbsp 등반 : <%= white_clear[2] %></div>
                            <div class="climbing-font">평점 : <%= white_attendance[2] + white_clear[2] %></div>
                        </span>
                    </div>
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
        <script type="text/javascript" src="ranking_page.js"></script>
    </body>
</html>