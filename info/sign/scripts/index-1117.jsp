<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
body { 
  text-align: center
}
table
{
  margin-right: auto;
  margin-left: auto;
}

.grid-container {
    margin: 0 auto; // center
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
img {
  height: 420px;
}
</style>
</head>
<body>
<%
  // Set refresh, autoload time as 30 seconds
  response.setIntHeader("Refresh", 30);
%>

<h1> <font color=blue>TTA 아카데미 교육/행사 안내</font></h1>

<div class="grid-container">
  <table border=1>
    <tr>
      <td>
        <div class="item1">
          <img src=./slides/201118-left-1.png>
        </div>
      </td><td>
        <div class="item2">
          <img src=./slides/201118-right-1.png>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="item1">
          <img src=./slides/201118-left-2.png>
        </div>
      </td><td>
        <div class="item2">
          <img src=./slides/201118-right-2.png>
        </div>
      </td>
    </tr>
  </table>
</div>

</body>
</html>
