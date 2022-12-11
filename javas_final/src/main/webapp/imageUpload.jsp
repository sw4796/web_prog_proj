<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.util.Enumeration"%>	
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
<%
	//인증된 세션인지 확인
	boolean login = true;
	if(session.getAttribute("id") == null) {
		login = false;
		//response.sendRedirect("main.jsp");
	}
%>
<%

    int fileSize = 1024 * 1024 * 10; //3mb로 파일 크기를 제한
    String image = "";
    String originFile = "";
    String uploadPath = request.getRealPath("image");
    MultipartRequest multi = null;

    try {
      multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());

      Enumeration files = multi.getFileNames();
      String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

      image = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
    }
    catch(Exception e) {
		   out.println("업로드 오류입니다 :" + e.getMessage());
	}
    
 %>
 <%
 	String id = (String)session.getAttribute("id");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql_update;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost/javasclimbing?serverTimezone=UTC";
		conn = DriverManager.getConnection(jdbcurl,"javasclimbing","javas!21!");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select * from user_info where user_id = '" + id + "'";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e) {
		   out.println("DB 연동 오류입니다.:" + e.getMessage());
	}
	
	sql_update = "update user_info set image='" + image + "' where user_id = '" + id + "'";
	
	try {
		stmt.executeUpdate(sql_update);
	}
	catch(Exception e) {
	   out.println("DB 연동 오류입니다.:" + e.getMessage());
	}
	
%>
<script>
	location.href="mypage.jsp";
</script>
</body>
</html>