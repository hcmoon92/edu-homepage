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
<%

String eventId = request.getParameter("eventId");
response.setStatus(200);

//String eventId = "EVENT_00000000001766";
%>
<body>
    <table id='tbl_result' class="table-striped border-success"> </table> 

    <script>
    $(document).ready(function() {

        $('#tbl_result').bootstrapTable({
          columns: [
            [{
                field: 'eventName',  title: '행사명',  sortable: true, align: 'left',
            },{
                field: 'memberName',  title: '참석자',  sortable: true, align: 'center',
            },{
                field: 'attendTime', title: '출석시간', sortable: true, align: 'center'
            }]
          ]
        });

        $('#tbl_result').on('click-cell.bs.table', function (field, value, row, $el) {
            if (value !=""){
                genQR($el.detail);
            }
        });


        $.ajax({
            url: "get-attend-json.jsp?eventId=<%=eventId%>",
            type: 'GET',
            //data: { eventId: eventId},
            dataType: "JSON",
            success: function (data) {
                $('#tbl_result').bootstrapTable('load', data); 
            }
        });

       
    });

    function detailFormatter(value) {
        var color = '#' + Math.floor(Math.random() * 6777215).toString(16)
        return '<div style="color: ' + color + '">' +
        '<button value=' +value + '>QR</button></div>'
    }

    </script>
</body>

</html>