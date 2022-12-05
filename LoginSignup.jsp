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
  </head>
  <body>
    <div id="wrap">
      <nav class="navbar">
        <div class="navbar_logo">
          <a href="main.html">JAVAS로고</a>
        </div>
        <ul class="navbar_menu">
          <li><a href="">소개</a></li>
          <li><a href="">스케줄</a></li>
          <li><a href="">정보게시판</a></li>
          <li><a href="">질문게시판</a></li>
          <li><a href="">랭킹</a></li>
        </ul>
        <ul class="navbar_sign">
          <li><a href="">로그인</a></li>
          <li><a href="">회원가입</a></li>
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
            <form class="login_form" id="login" action="main.jsp" method="post">
              <h1>Log In</h1>
              <br />
              <input type="text" id="login_id" name="login_id" placeholder="Email" />
              <input type="password" id="login_pw" name="login_pw" placeholder="PW" /><br />
              <div class="login_option">
                <span class="login_option_background"><input type="checkbox" />로그인 유지</span>
                <span class="login_option_background"><a href="findIDPW.jsp">비밀번호 찾기</a></span>
              </div>
              <br /><input type="button" class="login_button" id="login_button" onclick="loginCheck()" value="로그인" />
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
      <footer></footer>
    </div>
<%!
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
StringBuffer values=new StringBuffer();
StringBuffer pws=new StringBuffer();
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
	if(values.length()>0)
	{
		values.append(',');
		pws.append(',');
	}
	values.append('\'').append(rs.getString("id")).append('\'');
	pws.append('\'').append(rs.getString("pw")).append('\'');
}
stmt.close();
conn.close();
%>
	<script type="text/javascript">
	
	let idcheck=document.getElementById("idcheck");
	function idCheck()
	{
		let regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
		let id_list=[<%=values.toString()%>];
		let id=document.getElementById("id").value;
		//for(var i=0;i<id_list.length;i++)
			//console.log(id_list[i]);
		if(id=="")
		{
			alert("이메일을 입력해주세요.");
			return;
		}
		if(regex.test(id)===false)
		{
			alert("이메일 형식으로 입력하세요");
			return;
		}
		
		if(!id_list.includes(id))
		{
			alert("사용 가능한 이메일입니다.");
			idcheck.className="check";
		}
		else
		{
			alert("이미 사용중인 이메일입니다.");
			idcheck.className="uncheck";
		}
	}
	
	function loginCheck() {
		let id_list=[<%=values.toString()%>];
		let pw_list=[<%=pws.toString()%>];
		let id=document.getElementById("login_id").value;
		let pw=document.getElementById("login_pw").value;
		let idIndex=id_list.indexOf(id);
		
		if(!id_list.includes(id))
		{
			alert("입력하신 이메일에 해당하는 회원정보가 존재하지 않습니다.");
		}
		else
		{
			if(pw!=pw_list[idIndex])
			{
				alert("비밀번호가 일치하지 않습니다.");
			}
			else
			{
				document.getElementById("login").submit();
			}
		}
	}
  </script>
  </body>  
</html>

























