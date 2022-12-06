<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>main</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="calender_page.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard-dynamic-subset.css" />
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
                <li><a href="ranking.jsp">랭킹</a></li>
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
            <div class='rap'>
                <div class="header">
                   <div class="btn prevDay"></div>
                  <h2 class='dateTitle'></h2>
                  <div class="btn nextDay"></div>
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
            <div class="modal hidden">
                <div class="modal_overlay"></div>
                <div class="modal_register hidden">
                    <h3>활동 등록</h3>
                    <form action="putinfo_calender" method="post">
                        <div>
                            <p>활동 날짜:</p>
                            <input type="text" id="date" class="input_form" name="date" value="" readonly>
                        </div>
                        <div>
                            <p>활동 시간:</p>
                            <input type="time" name="time" value="11:30">
                        </div>
                        <div>
                            <p>활동 장소:</p>
                            <input type="text" name="location" class="input_form" placeholder="📍 활동 장소를 입력해주세요">
                        </div>
                        <div>
                            <p>모집 인원:</p>
                            <input type="number" name="number" min="1" max="10" class="input_form" placeholder="🙋‍♂️ 활동 인원을 입력해주세요">
                        </div>
                        <div>
                            <p>설명:</p>
                            <textarea name="description" class="input_form description" placeholder="📜 설명을 입력해주세요."></textarea>
                        </div>
                        <div>
                            <p>마커 색상:</p>
                            <input type="color" name="color" value="#217af4" id="color_picker">
                        </div>
                        <div class="btn-container">
                        	<%if(login){ //로그인일 때만 등록 표시%>
                        		<input type="submit" class="register_button" value="등록하기">
                        	<%} %>
                        </div>
                    </form>
                    <button id="close"></button>
                    <img src="image/arrow.png" id="back">
                </div>
                <div class="modal_list">
                    <div class="modal_list_header">
                        <h3>활동 list</h3>
                    </div>
                    <ul id="activity_list">
                        <!-- <li class="activity" onclick="open_activity_info(this)">
                            <div class="activity_summary">
                                <p class="activity_time">11:00</p>
                                <div class="activity_title">
                                    <h3 class="activity_location">클라이밍파크 종로점</h3>
                                    <p class="writer">주최자:이시우</p>
                                </div>
                                <p class="activity_people">7/10</p>
                            </div>
                            <div class="activity_info hidden">
                                <div class="description">
                                    <h4>📜설명</h4>
                                    <p> 클라이밍 파크에서 클라이밍 하고 나서 광장시장에서 빈대떡 먹고 노래방까지 갈 예정입니다.</p>
                                </div>
                                <div class="members">
                                    <h4>🙋‍♂️참여 인원</h4>
                                    <div class="member_list">
                                        <div>이시우</div>
                                        <div>김천일</div>
                                        <div>강은중</div>
                                        <div>김나원</div>
                                        <div>오수현</div>
                                        <div>허은정</div>
                                        <div>신유진</div>
                                    </div>
                                    <div class="btn-container"><button class="participate_button">참여하기</button></div>
                                </div>
                            </div>
                        </li>
                        <li class="activity" onclick="open_activity_info(this)">
                            <div class="activity_summary">
                                <p class="activity_time">11:00</p>
                                <div class="activity_title">
                                    <h3 class="activity_location">클라이밍파크 종로점</h3>
                                    <p class="writer">주최자:이시우</p>
                                </div>
                                <p class="activity_people">7/10</p>
                            </div>
                            <div class="activity_info hidden"></div>
                        </li>
                        <li class="activity" onclick="open_activity_info(this)">
                            <div class="activity_summary">
                                <p class="activity_time">11:00</p>
                                <div class="activity_title">
                                    <h3 class="activity_location">클라이밍파크 종로점</h3>
                                    <p class="writer">주최자:이시우</p>
                                </div>
                                <p class="activity_people">7/10</p>
                            </div>
                            <div class="activity_info hidden"></div>
                        </li>
                        <li class="activity" onclick="open_activity_info(this)">
                            <div class="activity_summary">
                                <p class="activity_time">11:00</p>
                                <div class="activity_title">
                                    <h3 class="activity_location">클라이밍파크 종로점</h3>
                                    <p class="writer">주최자:이시우</p>
                                </div>
                                <p class="activity_people">7/10</p>
                            </div>
                            <div class="activity_info hidden"></div>
                        </li> -->
                    </ul>
                    <div class="btn-container">
                    <%if(login){ //로그인일 때만 버튼표시 %>
                    	<button id="go_register_button" class="register_button" onclick="openModal_register()">추가하기</button>
                    <%} %>
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
    <script type="text/javascript" src="calender_page.js"></script>
</body>

</html>