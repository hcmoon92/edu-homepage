<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%
  // Set refresh, autoload time as 30 seconds
  response.setIntHeader("Refresh", 15);
%>
<!DOCTYPE html>
<html>

<head>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
    display:none;
    max-width: 100%;
    //max-height: 100%;
}

.center {
  margin: auto;
  padding: 0px;
}

body {
  overflow-y: hidden; /* Hide vertical scrollbar */
}

</style>
</head>

<body>
<%
File jsp = new File(request.getRealPath(request.getServletPath()));
File dir = jsp.getParentFile();
File[] list = dir.listFiles();
//File[] list = jsp.listFiles();

String f;

%>

<div class="w3-content w3-section" style="max-width: 100%;">
<%

if (list.length > 0) {

    for (int i = 0; i < list.length; i++) {
        f = list[i].getName();
        if (f.toLowerCase().endsWith(".jpg") || f.toLowerCase().endsWith(".png")) {
%>
            <img class="mySlides center" src="<%=f%>" style="width: 100%;">
<%
        }
    }
}
%>
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  

  setTimeout(carousel, 3000); // Change image every 2 seconds
}
</script>

</body>
</html>
