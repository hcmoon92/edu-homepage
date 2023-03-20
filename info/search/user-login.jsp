<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="./android-icon-72x72.png">

<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

h2 {
    text-align: center;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  //width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<h2>아카데미 신청 정보 확인</h2>

<form action="user-login-proc.jsp" method="post">
  <div class="imgcontainer">
    <img src="android-icon-72x72.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">

    <label for="id"><b>아카데미 회원ID</b></label>
    <input type="text" placeholder="아카데미 회원ID" name="id" required>

    <label for="uname"><b>회원 성명</b></label>
    <input type="text" placeholder="회원 성명" name="uname" required>

    <!--
    <label for="phone"><b>전화번호 (끝4자리)</b></label>
    <input type="text" placeholder="전화번호 끝4자리" name="phone" required>
    -->

    <button type="submit">들어가기</button>

  </div>
</form>

</body>
</html>
