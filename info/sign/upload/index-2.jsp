<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
.grid-container {
  display: grid;
  grid-template-columns: auto auto;
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
  grid-column-end: 2;
}
</style>
</head>
<body>

<h1> <font color=blue>TTA 아카데미 교육/행사 안내판 (파일 올리기)</font></h1>

<form action="upload.jsp" method="post" enctype="multipart/form-data">




<div class="grid-container">
  <div class="item3">
    좌측-상단<br>파일명:201117-201117-left-1.png
    <br><br><br>
    <input type="file" name="file1"/>
    <br><br>
    </div>  
  <div class="item4">
    우측-상단<br>파일명:201117-201117-right-1.png
    <br><br><br>
    <input type="file" name="file2"/>
    <br><br>
  </div>
  <div class="item5">
    좌측-하단<br>파일명:201117-201117-left-2.png
    <br><br><br>
    <input type="file" name="file3"/>
    <br><br>
  </div>
  <div class="item6">
    우측-하단<br>파일명:201117-201117-right-2.png
    <br><br><br>
    <input type="file" name="file4"/>
    <br><br>
  </div>  
</div>
<input type="submit" value="전송" />
</form>
</body>
</html>
