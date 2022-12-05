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
    <link rel="stylesheet" href="findIDPW_page.css">
    
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
        	<div class="container">
        	<form action="getPW" method="post">
        		<h2>회원가입 시 작성한 정보를 입력해주세요.</h2>
        		<input type="text" placeholder="이메일을 입력해주세요" id="id" name="id"/>
        		<select id="questions" name="Qnum">
                	<option value="1">졸업한 초등학교 이름은?</option>
                	<option value="2">기억나는 담임선생님 이름은?</option>
                	<option value="3">어렸을 때 자랐던 동네 이름은?</option>
              	</select>
              	<input type="text" placeholder="질문에 대한 답을 입력해주세요" id="Qans" name="Qans"/><br><br>
              	<input type="submit" class="findButton" id="findButton" value="비밀번호 찾기" />
              	<br><br><a href="LoginSignup.jsp">로그인 화면으로 돌아가기</a><br><br>
              	<span id="showPW"></span>
             </form>
        	</div>
        </main>
        <footer>
        </footer>
    </div>
<%-- 
<%!
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
StringBuffer ids=new StringBuffer();
StringBuffer pws=new StringBuffer();
StringBuffer Qnums=new StringBuffer();
StringBuffer Qanss=new StringBuffer();
%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
	conn=DriverManager.getConnection(jdbcurl, "root", "0000");
	stmt=conn.createStatement();
	String sql="select * from member";
	rs=stmt.executeQuery(sql);
}
catch(Exception e)
{
	out.println("<script>alert('db 연동 오류입니다 : '+e.getMessage);</script>");
}

while(rs.next())
{
	if(ids.length()>0)
	{
		ids.append(',');
		pws.append(',');
		Qnums.append(',');
		Qanss.append(',');
	}
	ids.append('\'').append(rs.getString("id")).append('\'');
	pws.append('\'').append(rs.getString("pw")).append('\'');
	Qnums.append('\'').append(Integer.toString(rs.getInt("Qnum"))).append('\'');
	Qanss.append('\'').append(rs.getString("Qans")).append('\'');
}
stmt.close();
conn.close();
%>
	<script type="text/javascript">
		function getPW() {
			let id_list=[<%=ids.toString()%>];
			let pw_list=[<%=pws.toString()%>];
			let num_list=[<%=Qnums.toString()%>];
			let ans_list=[<%=Qanss.toString()%>];
			let id=document.getElementById("id").value;
			let Qnum=document.getElementById("questions").value;
			let Qans=document.getElementById("Qans").value;
			let idIndex=id_list.indexOf(id);
			showPW=document.getElementById("showPW");
			if(!id_list.includes(id)) {
				alert("입력하신 이메일에 해당하는 회원정보가 존재하지 않습니다.");
			}else if(Qnum!=num_list[idIndex]) {
				alert("회원가입 시 선택하진 질문이 아닙니다.");
			}else if(Qans!=ans_list[idIndex]) {
				alert("질문에 대한 답이 틀립니다.");
			}else {
				showPW.innerHTML="비밀번호 : "+pw_list[idIndex];
			}		
		}
	</script>
--%>  
</body>
</html>
