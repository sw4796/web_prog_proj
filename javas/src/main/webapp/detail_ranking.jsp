<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%= request.getParameter("level") %> 클라이머 랭킹</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>;
	<link rel="stylesheet" href="detail_ranking_page.css">
</head>
<body>
		<div id="wrap">
            <nav class="navbar">
                <div class="navbar_logo">
                    <a href="main.html">JAVAS로고</a>
                </div>
                <ul class="navbar_menu">
                    <li><a href="">소개</a></li>
                    <li><a href="calender.html">스케줄</a></li>
                    <li>
                        <a href="">커뮤니티</a>
                        <ul>
                            <li><a href="">질문게시판</a></li>
                            <li><a href="">정보게시판</a></li>
                        </ul>
                    </li>
                    <li><a href="ranking.jsp">랭킹</a></li>
                </ul>
                <ul class="navbar_sign">
                    <li><a href="LoginSignup.jsp">로그인</a></li>
                    <li><a href="signup.html">회원가입</a></li>
                </ul>
            </nav>
            <br><br>
		</div>
</body>
</html>