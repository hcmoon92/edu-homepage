<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.0/bootstrap-table.min.js" 
    integrity="sha512-r+k0ZHRS62LiRIFpBwrwQ14MIT9YPusK7AcoeT34gHdzh2p7FBmU43/aE2ZDem9NM7bSIbMMV23u6zYny28oqg==" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.0/bootstrap-table.min.css" 
    integrity="sha512-9+eWL83icQU9EurxdlXQjhqhQbq/wtbpoQZiWp73jXRHw5cIshFkSw5/d0XOXuQe9AjmWeOQfvdgu/WAA4KDVw==" crossorigin="anonymous" />

    <script src="../qr/qrcode.min.js"></script>

    <meta name="viewport" content="width=device-width, user-scalable=no">

    <style>
    .row {
        display: inline-block;
    }
    .out {
        border: 1px solid;
        padding: 50px;
        margin:0 auto;
        text-align: center;
    }
    </style>
</head>
<body>
    <div style="padding-left:30px; padding-top:50px">
        <form id="form1" name="form1" method="post">
            <div class="row">
                    <input type="text" class="form-control" placeholder="검색어" id="query">
            </div>
            <button type="submit" class="btn btn-primary btn-default" id="search">검색</button>
        </form>
    </div>
    <table id='tbl_result' class="table-striped border-success"> 
    </table> 

    <br><br>
    <div class="out">
        <div class="qrcode">
            <canvas id="canvas"></canvas>
        </div>      
    </div>
    <script>
    $(document).ready(function() {

        $('#tbl_result').bootstrapTable({
          columns: [
            [{
                field: 'memberNm', title: '성명', sortable: true, align: 'center'
            }, {
                field: 'eventNm',  title: '신청목록',  sortable: true, align: 'center',
            }, {
                field: 'eventBegin',  title: '시작일',  sortable: true, align: 'center',
            }, {
                field: 'detail', title: '+', align: 'center', clickToSelect: false, formatter: detailFormatter
            }]
          ]
        });

        $('#tbl_result').on('click-cell.bs.table', function (field, value, row, $el) {
            if (value !=""){
                genQR($el.detail);
            }
        });

        $("#search").click(function () {
            var query = $('#query').val();

            $.ajax({
                url: "fetch-user.jsp",
                type: 'POST',
                data: { query: query},
                dataType: "JSON",
                success: function (data) {
                    $('#tbl_result').bootstrapTable('load', data); 
                    clearCanvas();
                    if (data.length == 0) alert('신청목록이 존재하지 않습니다!!');
                }
            });

            return false; // form stop reload
        });
    });

    function clearCanvas() {
        var canvas= document.getElementById('canvas');
        var ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0,  canvas.width, canvas.height);
    }
    function detailFormatter(value) {
        var color = '#' + Math.floor(Math.random() * 6777215).toString(16)
        return '<div style="color: ' + color + '">' +
        '<button value=' +value + '>QR</button></div>'
    }
    function genQR(str) {
        QRCode.toCanvas(document.getElementById("canvas"), str, function(error) {
        if (error) console.error(error);
            console.log(str);
        });
    }
    </script>
</body>

</html>