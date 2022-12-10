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
    <div id="wrap">
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
              String url="jdbc:mysql://127.0.0.1:3306/javas?serverTimezone=UTC";
              conn=DriverManager.getConnection(url,"root","0000");
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
               <h1>회원가입이 완료되었습니다.</h1><br>
               <a href="LoginSignup.jsp">로그인 화면으로 돌아가기</a>
            </div>
        </main>
        <footer>
        </footer>
    </div>
</body>

</html>