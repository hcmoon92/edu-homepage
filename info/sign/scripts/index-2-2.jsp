<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
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
</style>
</head>
<body>


<h1> <font color=blue>TTA Academy</font></h1>

<div class="grid-container">
  <div class="item1"><img width=850px src=./slides/201204-right-arrow.png></div>
  <div class="item2"><img width=850px src=./slides/201204-main.png></div>
</div>

</body>
</html>
