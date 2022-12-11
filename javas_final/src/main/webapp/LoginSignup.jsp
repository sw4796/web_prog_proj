<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="LoginSignup_page.css" />
    <script src="LoginSignup.js"></script>
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
        <div class="container" id="container">
          <div class="form-container sign-up-container">
            <form class="signup_form" id="signup" action="SignupProcess.jsp" method="post">
              <h1>Sign Up</h1>
              <br />
              <input type="text" placeholder="이름을 입력해주세요" id="name" name="name"/>
              <div class="login_option"><input type="text" id="id" placeholder="이메일을 입력해주세요" name="id"/><input id="idcheck" class="uncheck" type="button" onclick="idCheck()" value="중복확인"/></div>
              <input type="password" id="pw1" placeholder="비밀번호를 입력해주세요" name="pw"/>
              <input type="password" id="pw2" placeholder="비밀번호를 다시 입력해주세요" onkeyup="passCheck()"/>
              <span id="message"></span>
              <select id="questions" name="Qnum">
                <option value="1">졸업한 초등학교 이름은?</option>
                <option value="2">기억나는 담임선생님 이름은?</option>
                <option value="3">어렸을 때 자랐던 동네 이름은?</option>
              </select>
              <input type="text" placeholder="질문에 대한 답을 입력해주세요" id="Qans" name="Qans"/>
              <input type="button" class="signup_button" id="signup_button"  onclick="signupCheck()" value="회원가입" />
            </form>
          </div>

          <div class="form-container sign-in-container">
            <form class="login_form" id="login" action="LoginCheck" method="post">
              <h1>Log In</h1>
              <br />
              <input type="text" id="login_id" name="login_id" placeholder="Email" />
              <input type="password" id="login_pw" name="login_pw" placeholder="PW" />
              <div class="login_option">
                <span class="login_option_background"><a href="findIDPW.jsp" id="find_pw">비밀번호 찾기</a></span>
              </div>
              <br /><input type="submit" class="login_button" id="login_button" value="로그인" />
            </form>
          </div>
          <div class="overlay-container">
            <div class="overlay">
              <div class="overlay-panel overlay-left">
                <h3>알 유 JAVAS?</h3>
                <h3>당장 로그인 Let's Girit</h3><br>
                <button class="ghost" id="signIn">Log In</button>
              </div>
              <div class="overlay-panel overlay-right">
                <h3>당신도 JAVAS의 멤버이고 싶습니까?</h3>
                <h3>당장 회원가입 VeryVeryGood</h3><br>
                <button class="ghost" id="signUp">Sign Up</button>
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
  </body>  
</html>

























