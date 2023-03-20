<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
  
<head>
    <title>
        How to convert an HTML element
        or document into image ?
    </title>
      
    <style>
        #sub-contents {
    margin-top: 2px;
    position: relative;
    width: 870px;
    line-height: 2em;
    float: left;
    margin-left: 270px;
    margin-bottom: 90px;
    min-height: 730px;
}
    .titDepth01.pr {
        padding-right: 80px;
    }

    .btn_apply3 {
    display: inline-block;
    width: 95px;
    height: 25px;
    line-height: 20px;
    font-size: 15px;
    font-weight: bold;
    color: #fff;
    text-align: center;
    background-color: #656565;
    margin-top: 15px;
    margin-bottom: 5px;
    padding-top: 5px;
    float: right;
}
    </style>
    <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
    </script>
      
    <script src=
"https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js">
    </script>

    <link rel="stylesheet" href="edu/common.css" type="text/css">
    <link rel="stylesheet" href="edu/sub.css" type="text/css">
    <link rel="stylesheet" href="edu/board.css" type="text/css">

</head>
  
<body>
    <center>   
    <div id="getHtml"></div>   

      
    <div id="previewImage"></div>
      
    <script>


        $(document).ready(function() {
          
            $.ajax({
                url: "https://edu.tta.or.kr/semina/TTAReqstView.do?eventId=EVENT_00000000002282&sul=2",
                type: "get",
                dataType: "html",
                success: function (data) {
                    var result = $(data).find("div#printTable").html();
                    $('#getHtml').html(result);
                },
                complete: function () {

                    /*

                    //var element = $("#html-content-holder"); 
                    var element = $("#getHtml"); 
                    
                    html2canvas(element, {
                        width: 700, 
                        height: 500,
                        scale: 1,
                        //dpi : 400,
                        onrendered: function(canvas) {
                            $("#previewImage").append(canvas);
                        }
                    });
                    */
                }
            });

        });
    </script>
    </center>
</body>
  
</html>       