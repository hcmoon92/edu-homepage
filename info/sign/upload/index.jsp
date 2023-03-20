<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<style>

a:link {  color: green;} /* unvisited link */
a:visited {  color: green;}/* visited link */
a:hover {  color: red;}/* mouse over link */
a:active {  color: yellow;}/* selected link */

.grid-container {
  display: grid;
  grid-template-columns: auto auto auto;
  grid-gap: 10px;
  //background-color: #2196F3;
  padding: 10px;
}

.grid-container > div {
  //background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
  border: 1px solid rgba(0, 0, 0, 0.8);
}

.item1 {
  grid-column-start: 1;
  grid-column-end: 3;
}

td {
      padding: 20px 20px;
}
</style>
</head>
<body>

<h1> <font color=blue>TTA 아카데미 교육/행사 안내판 (레이아웃 선택)</font></h1>

<a href=./index-1.jsp>행사1개(좌측 또는 우측)</a>
<table border=1>
  <tr>
    <td>1</td>
    <td>2</td>
  </tr>
</table>
<br><br>

<a href=./index-2.jsp>행사2개(좌측 및 우측)</a>
<table border=1>
  <tr>
    <td>1</td>
    <td>3</td>
  </tr><tr>
    <td>2</td>
    <td>4</td>  
  </tr>
</table>

<br><br>

<a href=./index-3.jsp>행사3개(좌측, 중앙, 우측)</a>
<table border=1>
  <tr>
    <td>1</td>
    <td>3</td>
    <td>5</td>
  </tr><tr>
    <td>2</td>
    <td>4</td>  
    <td>6</td>  
  </tr>
</table>


</body>
</html>
