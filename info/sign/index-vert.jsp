<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {margin: 0px;}
img {
    max-width: 100%;
    max-height: 100%;
    width: 100%;
    bottom: 0;
    left: 0;
    margin: auto;
    overflow: auto;
    position: fixed;
    right: 0;
    top: 0;
}
</style>
</head>
<body>
<%
  // Set refresh, autoload time as 30 seconds
  response.setIntHeader("Refresh", 30);
%>

<img src="./slides/vert.png">

</body>
</html>
