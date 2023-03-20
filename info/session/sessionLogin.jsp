<!-- sessionLogin.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h1>Login</h1>
<form action="sessionLoginProcess.jsp" method="post">
ID : <input type="text" name="id"><br />
PW : <input type="password" name="pw"><br />
<input type="submit" value="Login">
</form>
</body>
</html>