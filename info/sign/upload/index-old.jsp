<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<!--
    //파일전송일 때는 항상 METHOD는 POST로 하고 ENCTYPE을
    //항상 주 어야 함
    //TYPE은 FILE로 주어야 함!!
-->
<br><br><br>
<form action="upload.jsp" method="post" enctype="multipart/form-data">

좌측-상단: <input type="file" name="file1"/> (ex: 201116-left-1.png)<br> 
좌측-하단: <input type="file" name="file2"/> (ex: 201116-left-2.png)<br>
우측-상단: <input type="file" name="file3"/> (ex: 201116-right-1.png)<br>
우측-하단: <input type="file" name="file4"/> (ex: 201116-right-2.png)<br>
중앙-상단: <input type="file" name="file5"/> (ex: 201116-center-1.png)<br>
중앙-하단: <input type="file" name="file6"/> (ex: 201116-center-2.png)<br>
<!--
파라미터1: <input type="text" name="param1"/><br>
파라미터2: <input type="text" name="param2"/><br>
파라미터3: <input type="text" name="param3"/><br>
파라미터4: <input type="text" name="param4"/><br>
-->
<br>

<input type="submit" value="전송" />
</form>
</body>
</html>