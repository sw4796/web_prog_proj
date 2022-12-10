<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>main</title>
    <link rel="stylesheet" href="SignupProcess_page.css">
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
        <%
           String id=request.getParameter("id");
           String name=request.getParameter("name");
           String pw=request.getParameter("pw");
           String Qans=request.getParameter("Qans");
           int Qnum=Integer.parseInt(request.getParameter("Qnum"));
           Connection conn=null;
           Statement stmt=null;
           ResultSet rs=null;
           String sql;
           String sql2;
           //out.println("insert into member values('"+id+"','"+name+"','"+pw+"',"+Qnum+",'"+Qans+"')");
           try {
              Class.forName("com.mysql.jdbc.Driver");
              String jdbcurl = "jdbc:mysql://localhost/javasclimbing?serverTimezone=UTC";
      		conn = DriverManager.getConnection(jdbcurl,"javasclimbing","javas!21!");
              stmt=conn.createStatement();
              sql="insert into member values('"+id+"','"+name+"','"+pw+"',"+Qnum+",'"+Qans+"')";
              stmt.executeUpdate(sql);
              sql2 = "insert into user_info (user_id, name) value('" + id + "', '" + name + "')";
              stmt.executeUpdate(sql2);
           }catch(Exception e){
              out.println("DB 연동 오류입니다 : "+e.getMessage());
           }
        %>
        <div class="container">
            <h1><span class="color-javas_red">회원가입을 </span><span class="color-javas_orange">축하드립니다.</span></h1>
            <a href="LoginSignup.jsp"><span class="color-javas_blue">로그인 화면으로 돌아가기</span></a>
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