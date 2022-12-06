<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        </div>
        <nav class="navbar">
            <div class="navbar_logo">
                <a href="main.jsp">JAVAS로고</a>
            </div>
            <ul class="navbar_menu">
                <li><a href="">소개</a></li>
                <li><a href="calender.jsp">스케줄</a></li>
                <li>
                    <a href="">커뮤니티</a>
                    <ul>
                        <li><a href="">질문게시판</a></li>
                        <li><a href="">정보게시판</a></li>
                    </ul>
                </li>
                <li><a href="ranking.html">랭킹</a></li>
            </ul>
            <ul class="navbar_sign">
            <%if(login){ //로그인 여부에 따라 바뀌기%>
        		<li><a href="#">마이페이지</a></li>
        		<li><a href="#">로그아웃</a></li>
            <%} else{%>
                <li><a href="LoginSignup.jsp">로그인/회원가입</a></li>
            <%} %>
            </ul>
        </nav>
        <main>
            <div class="container">
                <div class="QnA">
                    <h2>질문게시판</h2>
                    <a class="more" href="">+</a>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="info">
                    <h2>정보게시판</h2>
                    <a class="more" href="">+</a>
                    <div></div>
                    <div></div>
                    <div></div>
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