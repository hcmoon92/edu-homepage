<!-- sessionMain.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>
<%
// 세션값 가져오기
String id = (String) session.getAttribute("id"); // Object 타입이므로 다운캐스팅
%>
<h1>Main page</h1>
<a href="../dashboard">관리자</a> <br><br>
<a href="../gantt">아카데미 행사 일정</a> <br><br><br>


로그인: <%=id %> <br>
<input type="button" onclick="location.href='sessionLogout.jsp'" value="LogOut" />
</body>
</html>