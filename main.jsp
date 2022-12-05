<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>main</title>
    <link rel="stylesheet" href="main_page.css">
</head>

<body>
    <div id="wrap">
        <div class="animation">
        </div>
        <nav class="navbar">
            <div class="navbar_logo">
                <a href="main.jsp">JAVAS로고</a>
            </div>
            <ul class="navbar_menu">
                <li><a href="">소개</a></li>
                <li><a href="">스케줄</a></li>
                <li><a href="">정보게시판</a></li>
                <li><a href="">질문게시판</a></li>
                <li><a href="">랭킹</a></li>
            </ul>
            <ul class="navbar_sign">
                <li><a href="LoginSignup.jsp">로그인</a></li>
                <li><a href="LoginSignup.jsp">회원가입</a></li>
            </ul>
        </nav>
        <main>
            <div class="container">
                <div class="QnA">질문게시판</div>
                <div class="info">정보게시판</div>
                <div class="calender">달력</div>
            </div>
        </main>
        <footer>
        </footer>
    </div>
</body>

</html>