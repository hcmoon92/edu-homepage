<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax 간단 테스트</title>
 
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
   
<script type="text/javascript" language="javascript">
 
    $(document).ready(function(){
         
         
        $.ajax({
             
            type : "GET",
            url : "ajaxData.jsp?type=1",
            dataType : "text",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
                alert("통신데이터 값 : " + data) ;
                $("#dataArea").html(data) ;
            }
             
        });
         
 
    });
 
</script>
 
</head>
<body>
 
    <div id="dataArea"></div>
 
</body>
</html>
