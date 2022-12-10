<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>intro</title>
    <link rel="stylesheet" href="intro_page.css" />
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
        <div class="container">
          <div class="javas_pic">
            <img src="image/javas_full_logo.jpg" />
          </div>
          <div class="javas_content">
            <h1>
              <span class="color-javas_red">About</span>
              <span class="color-javas_orange">Us</span>
            </h1>
            <p class="color-javas_blue">
              ​자바쓰란 클라이밍에 관심 있는 컴퓨터공학과 학생들이 모여 만든 소모임입니다.<br />
              2022년 4월 첫 활동을 시작으로 지금까지 활발하게 활동하고 있으며 현재 30명의<br />
              부원으로 이루어져 있습니다. 클라이밍이라는 운동을 다 같이 즐기기 위하여 시작한<br />
              소모임이 이제는 동기, 선후배간의 돈​독한 관계를 만드는 데에도 많은 도움을 주고<br />
              있습니다. 다양한 클라이밍장들을 돌아다니며 서로가 서로의 운동 파트너가 되어 더<br />
              좋은 퍼포먼스를 내기 위해 도와주는 유익한 활동이 이어지고 있습니다.<br />
              자바쓰는 앞으로도 클라이밍을 통해 다양한 경험의 폭을 늘려나갈 것입니다.
            </p>
          </div>
          <div class="founder_pic">
            <img src="image/javas_founder.jpg" />
          </div>
          <div class="founder_content">
            <h1><span class="color-javas_red">About </span><span class="color-javas_orange">Founder</span></h1>
            <p class="color-javas_blue">
                안녕하십니까, 자바쓰 회장 김천일입니다. 저는 2021년 6월부터 클라이밍을 시작하여 <br>
                현재 약 1년 반째 클라이밍을 즐기고 있습니다. 클라이밍이라는 운동은 혼자 하는 것보다는 <br>
                여러 사람들과 같이 할 때에 더 힘이 나고 재미가 있는 운동입니다. 서로가 서로에게 힘을 주며 <br>
                더욱 친해지는 계기가 되기도 합니다. 이러한 경험을 동기, 선후배들과 나누기 위하여 자바쓰라는 <br>
                소모임을 만들었습니다. 클라이밍이라는 운동을 처음 접하고 흥미를 느끼며 따라와주는 부원들 <br>
                덕분에 자바쓰가 활발히 활동을 이어나갈 수 있었습니다. 처음과 다르게 실력이 느는 부원들을 보며 <br>
                저도 성취감을 느끼고 더 좋은 모습을 보여주기 위하여 스스로 더 열심히 운동하기도 합니다. <br>
                앞으로 더 많은 부원들과 학우들이 클라이밍에 흥미를 느낄 수 있도록 노력하겠습니다.
            </p>
          </div>
          <div class="activity_pic">

          </div>
          <div class="activity_content">
            <h1><span class="color-javas_red">자바쓰 </span><span class="color-javas_orange">주요 활동 내용</span></h1>
            <div class="javas_history">
                <img src="image/history_flag.jpg" class="history_flag">
                <h2>2022.04 <span class="color-javas_red">JAVAS 첫 활동</span></h2>
            </div>
            <div class="javas_history">
                <img src="image/history_flag.jpg" class="history_flag">
                <h2>2022.05 <span class="color-javas_red">JAVAS 이름, 로고 디자인</span></h2>
            </div>
            <div class="javas_history">
                <img src="image/history_flag.jpg" class="history_flag">
                <h2>2022.07 <span class="color-javas_red">단체 티셔츠 제작</span></h2>
            </div>
            <div class="javas_history">
                <img src="image/history_flag.jpg" class="history_flag">
                <h2>2022.07 <span class="color-javas_red">클라이밍 엠티</span></h2>
            </div>
            <div class="javas_history">
                <img src="image/history_flag.jpg" class="history_flag">
                <h2>2022.09 <span class="color-javas_red">주 활동장소 변경(양재->종로)</span></h2>
            </div>
            <div class="javas_history">
                <img src="image/history_flag.jpg" class="history_flag">
                <h2>2022.11 <span class="color-javas_red">부원 30명 돌파</span></h2>
            </div>
          </div>
          <div class="empty1"></div>
          <div class="empty2"></div>
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
