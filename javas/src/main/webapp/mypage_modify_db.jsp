<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<body>
<%
String id = (String)session.getAttribute("id");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql_update;
String new_level = "";
int new_white=0, new_yellow=0, new_orange=0, new_green=0, new_blue=0, new_red=0, new_purple=0,
	new_gray=0, new_brown=0, new_black=0, clear=0, attendance=0;

try {
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/javas?serverTimezone=UTC";
	conn = DriverManager.getConnection(url, "root", "0000");
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	String sql = "select * from user_info where user_id='" + id + "'";
	rs = stmt.executeQuery(sql);
}
catch(Exception e) {
	out.println("DB 연동 오류입니다.:" + e.getMessage());
}

rs.last();
rs.beforeFirst();

while (rs.next()) {
	new_white = Integer.parseInt(rs.getString("white_clear")) + Integer.parseInt(request.getParameter("white_cnt"));
	new_yellow = Integer.parseInt(rs.getString("yellow_clear")) + Integer.parseInt(request.getParameter("yellow_cnt"));
	new_orange = Integer.parseInt(rs.getString("orange_clear")) + Integer.parseInt(request.getParameter("orange_cnt"));
	new_green = Integer.parseInt(rs.getString("green_clear")) + Integer.parseInt(request.getParameter("green_cnt"));
	new_blue = Integer.parseInt(rs.getString("blue_clear")) + Integer.parseInt(request.getParameter("blue_cnt"));
	new_red = Integer.parseInt(rs.getString("red_clear")) + Integer.parseInt(request.getParameter("red_cnt"));
	new_purple = Integer.parseInt(rs.getString("purple_clear")) + Integer.parseInt(request.getParameter("purple_cnt"));
	new_gray = Integer.parseInt(rs.getString("gray_clear")) + Integer.parseInt(request.getParameter("gray_cnt"));
	new_brown = Integer.parseInt(rs.getString("brown_clear")) + Integer.parseInt(request.getParameter("brown_cnt"));
	new_black = Integer.parseInt(rs.getString("black_clear")) + Integer.parseInt(request.getParameter("black_cnt"));
	attendance = Integer.parseInt(rs.getString("total_attendance")) + Integer.parseInt(request.getParameter("attendance"));
	clear = new_white + new_yellow + new_orange + new_green + new_blue + new_red + new_purple + new_gray + new_brown + new_black;
	
	if (new_black > 0)
		new_level = "검정";
	else if (new_brown > 0)
		new_level = "갈색";
	else if (new_gray > 0)
		new_level = "회색";
	else if (new_purple > 0)
		new_level = "보라";
	else if (new_red > 0)
		new_level = "빨강";
	else if (new_blue > 0)
		new_level = "파랑";
	else if (new_green > 0)
		new_level = "초록";
	else if (new_orange > 0)
		new_level = "주황";
	else if (new_yellow > 0)
		new_level = "노랑";
	else
		new_level = "하양";
}

sql_update = "update user_info set level='" + new_level + "', black_clear=" + new_black + ", brown_clear=" + new_brown +
", gray_clear=" + new_gray + ", purple_clear=" + new_purple + ", red_clear=" + new_red +
", blue_clear=" + new_blue + ", green_clear=" + new_green + ", orange_clear=" + new_orange +
", yellow_clear=" + new_yellow + ", white_clear=" + new_white + ", total_attendance=" + attendance +
", total_clear=" + clear + " where user_id='" + id + "'";

try {
	stmt.executeUpdate(sql_update);
}
catch(Exception e) {
	out.println("DB 연동 오류입니다.:" + e.getMessage());
}

response.sendRedirect("mypage.jsp");
%>
<script>
</script>
</body>
</html>