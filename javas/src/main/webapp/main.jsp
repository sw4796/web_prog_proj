<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="main_page.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
<%
	//인증된 세션인지 확인
	boolean login = true;
	if(session.getAttribute("id")==null)
		login = false;
%>
    <div id="wrap">
        <div class="animation">
            <div class="ani_container">
                <div class="row">
                    <div class="cell size-6"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-4"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-4"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-6"></div>
                </div>
                <div class="row">
                    <div class="cell size-17"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-16"></div>
                    <div class="cell size-9 yellow"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-4"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-21"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-9 red"></div>
                    <div class="cell size-26"></div>
                    <div class="cell size-9 red"></div>
                    <div class="cell size-8 yellow"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-8"></div>
                </div>
                <div class="row">
                    <div class="cell size-15"></div>
                    <div class="cell size-3 yellow"></div>
                    <div class="cell size-3 purple"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-11 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-19"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-11 blue"></div>
                    <div class="cell size-21"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-8 red"></div>
                    <div class="cell size-13"></div>
                </div>
                <div class="row">
                    <div class="cell size-15"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-4 red"></div>
                    <div class="cell size-1 blue"></div>
                    <div class="cell size-14"></div>
                    <div class="cell size-8 red"></div>
                    <div class="cell size-4 purple"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 yellow"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-8 yellow"></div>
                    <div class="cell size-4 purple"></div>
                    <div class="cell size-18"></div>
                    <div class="cell size-9 yellow"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-9 blue"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-12"></div>
                </div>
                <div class="row">
                    <div class="cell size-9"></div>
                    <div class="cell size-4"></div>
                    <div class="cell size-2 purple"></div>
                    <div class="cell size-4 yellow"></div>
                    <div class="cell size-13"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-3"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-7 yellow"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-3"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-16"></div>
                    <div class="cell size-9 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-17"></div>
                </div>
                <div class="row">
                    <div class="cell size-10"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-5"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-13"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-5"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-16"></div>
                    <div class="cell size-9 blue"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-21"></div>
                </div>
                <div class="row">
                    <div class="cell size-17"></div>
                    <div class="cell size-9"></div>
                    <div class="cell size-3 yellow"></div>
                    <div class="cell size-3 blue"></div>
                    <div class="cell size-11"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-11"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-20"></div>
                </div>
                <div class="row">
                    <div class="cell size-12"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-9 red"></div>
                    <div class="cell size-8 blue"></div>
                    <div class="cell size-2 purple"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 yellow"></div>
                    <div class="cell size-9"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-9 yellow"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-19"></div>
                    <div class="cell size-9 yellow"></div>
                    <div class="cell size-8 blue"></div>
                    <div class="cell size-11"></div>
                    <div class="cell size-17"></div>
                </div>
                <div class="row">
                    <div class="cell size-16"></div>
                    <div class="cell size-2 red"></div>
                    <div class="cell size-4 yellow"></div>
                    <div class="cell size-9"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-8 yellow"></div>
                    <div class="cell size-8 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-7 yellow"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-9 yellow"></div>
                    <div class="cell size-25"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-15"></div>
                </div>
                <div class="row">
                    <div class="cell size-13"></div>
                    <div class="cell size-6 yellow"></div>
                    <div class="cell size-5"></div>
                    <div class="cell size-3 blue"></div>
                    <div class="cell size-3 purple"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-13"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 yellow"></div>
                    <div class="cell size-5"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-13"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-9 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-10"></div>
                </div>
                <div class="row">
                    <div class="cell size-12"></div>
                    <div class="cell size-2 red"></div>
                    <div class="cell size-3 blue"></div>
                    <div class="cell size-5"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-7 blue"></div>
                    <div class="cell size-3"></div>
                    <div class="cell size-7 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-14"></div>
                    <div class="cell size-9 yellow"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-10"></div>
                </div>
                <div class="row">
                    <div class="cell size-7"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-6 purple"></div>
                    <div class="cell size-4 red"></div>
                    <div class="cell size-6 yellow"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-8 red"></div>
                    <div class="cell size-8 purple"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-17"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-9 purple"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-9 blue"></div>
                    <div class="cell size-13"></div>
                    <div class="cell size-9"></div>
                </div>
                <div class="row">
                    <div class="cell size-5"></div>
                    <div class="cell size-8 yellow"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-19"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-15 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 purple"></div>
                    <div class="cell size-19"></div>
                    <div class="cell size-5 red"></div>
                    <div class="cell size-11"></div>
                    <div class="cell size-8 yellow"></div>
                    <div class="cell size-6 red"></div>
                    <div class="cell size-8 purple"></div>
                    <div class="cell size-12"></div>
                </div>
                <div class="row">
                    <div class="cell size-20"></div>
                    <div class="cell size-7 purple"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-21"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-13 yellow"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-5 yellow"></div>
                    <div class="cell size-21"></div>
                    <div class="cell size-5 blue"></div>
                    <div class="cell size-14"></div>
                    <div class="cell size-10 blue"></div>
                    <div class="cell size-7 yellow"></div>
                    <div class="cell size-9"></div>
                    <div class="cell size-16"></div>
                </div>
                <div class="row">
                    <div class="cell size-6"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-16"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-16"></div>
                    <div class="cell size-12"></div>
                    <div class="cell size-8"></div>
                    <div class="cell size-19"></div>
                    <div class="cell size-6"></div>
                    <div class="cell size-15"></div>
                    <div class="cell size-7"></div>
                    <div class="cell size-10"></div>
                    <div class="cell size-16"></div>
                    <div class="cell size-9"></div>
                    <div class="cell size-15"></div>
                </div>
            </div>
        </div>
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
            <div class="container">
                <div class="photo_album">
                    <h2>사진첩</h2>
                    <div class="photo_slide"></div>
                </div>
                <div class="calender">
                    <div id="mini_calender">
                        <div class='rap'>
                            <div class="header">
                              <h2 class='dateTitle'></h2>
                            </div>
                            
                            <div class="grid dateHead">
                              <div>일</div>
                              <div>월</div>
                              <div>화</div>
                              <div>수</div>
                              <div>목</div>
                              <div>금</div>
                              <div>토</div>
                            </div>
                        
                            <div class="grid dateBoard"></div>
                        </div>
                    </div>
                    <div id="this_week">
                        <h5>이번주 일정</h5>
                        <div>
	                        <%
		                        Connection conn = null;
		                		Statement stmt = null;
		                		ResultSet rs = null;
		                	
		                		try {
		                			Class.forName("com.mysql.jdbc.Driver");
		                			String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
		                			conn = DriverManager.getConnection(jdbcurl,"root","0000");
		                			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		                		            ResultSet.CONCUR_UPDATABLE);
		                			
		                			
		                			//현재 date 일주일안의 활동 3개 가져오기
		                			String sql = "SELECT * FROM activity WHERE date BETWEEN DATE_ADD(NOW(), INTERVAL +1 WEEK ) and NOW() order by date asc, time asc limit 3";
		                			rs = stmt.executeQuery(sql);
		                			
		                			rs.last();
		                			//아무 활동도 없는 경우
		                			if(rs.getRow() == 0){
		                				%>
		                				<div class="empty_list">
		                                	일주일 내에 예정된 활동이 없습니다!
		                                </div>
		                				<%
		                			}
		                			rs.beforeFirst();
		                			
		                			//활동 list 순회하면서 html 생성
		                			while(rs.next()){
										%>
										<div class="activity_summary" style="border-left: 5px solid <%=rs.getString("color")%>">
											<div><%=rs.getString("date").substring(5) %></div>
											<div><%=rs.getString("time").substring(0,5) %></div>
											<div><%=rs.getString("location") %></div>
										</div>
										<%
		                			}
		                			stmt.close();
		                			conn.close();
		                		}
		                		catch(Exception e) {
		                			System.out.println("sql_list: DB 연동 오류입니다. :" + e.getMessage());
		                		}
		                		
	                        %>
                        </div>
                    </div>
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
    <script type="text/javascript" src="main_page.js"></script>
</body>

</html>