<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../session/sessionCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>TTA 아카데미 교육/세미나 행사 일정 안내</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=IE8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" type="text/css" rel="stylesheet">
        <link href="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.css" rel="stylesheet" type="text/css">
        <style type="text/css">
            body {
                font-family: Helvetica, Arial, sans-serif;
                font-size: 13px;
                padding: 0 0 50px 0;
            }
            h1 {
                margin: 40px 0 20px 0;
            }
            h2 {
                font-size: 1.5em;
                padding-bottom: 3px;
                border-bottom: 1px solid #DDD;
                margin-top: 50px;
                margin-bottom: 25px;
            }
            table th:first-child {
                width: 150px;
            }

            /* === LEFT PANEL === */

            .fn-gantt .leftPanel {
                float: left;
                width: 450px;
                overflow: hidden;
                border-right: 1px solid #DDD;
                position: relative;
                z-index: 20;
            }            
        </style>
    </head>
    <body>

        <div class="container">

            <h1>
                TTA 아카데미
                <small>&mdash; 연간 교육/세미나 행사 일정</small>
            </h1>
            <input type="text" name="daterange" value="01/01/2020 - 03/01/2020" />

            <div class="gantt"></div>

            <input type=hidden id="idStartDate" value="20200101"></input>
            <input type=hidden id="idEndDate" value="20200301"></input>

        </div>
    <script src="js/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script src="js/jquery.fn.gantt.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <script>

    // Add 12 months to 29 Feb 2016 -> 28 Feb 2017
    //console.log(addMonths(new Date(2016,1,29),12).toString());
    function addMonths(date, months) {
        var d = date.getDate();
        date.setMonth(date.getMonth() + months);
        if (date.getDate() != d) {
        date.setDate(0);
        }
        return date;
    }

    /*
    * yyyyMMdd 날짜문자열을 Date형으로 반환
    */
    
    function toDate(dateStr)
    {
        var yyyyMMdd = String(dateStr);
        var sYear = yyyyMMdd.substring(0,4);
        var sMonth = yyyyMMdd.substring(4,6);
        var sDate = yyyyMMdd.substring(6,8);

        return new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
    }


    // 20200101 + days
    function addDays(dateStr, days) { //20200101
        var date = toDate(dateStr);

        date.setDate(date.getDate() + days);
        return date;
    }

    // 20200101 -> date
    function date_add(dateStr, nDays) {
        var sDate = String(dateStr);
        var yy = parseInt(sDate.substring(0, 4), 10);
        var mm = parseInt(sDate.substring(4, 2), 10);
        var dd = parseInt(sDate.substring(6), 10);
    
        d = new Date(yy, mm - 1, dd + nDays);
    
        return d;
    }

    // date -> date
    function date_add1(date, nDays) {

        yy = date.getFullYear();
        mm = date.getMonth(); 
        dd = date.getDate(); 
    
        d = new Date(yy, mm, dd + nDays);
        
        return d;
    }


    function formatDate(date, format) {
        var day = date.getDate();
        var month = date.getMonth()+1;
        var year = date.getFullYear();

        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;


        var dateStr;
        
        if (format == '1') dateStr = year + "" +month + "" + day; 
        else if (format == '2') dateStr =  month + "/" + day +"/" + year; 

        return dateStr;
    }


    $(document).ready(function() {

        var date = new Date();
        date = date_add1(date, -10);
        var prevDay = formatDate(date, '1');  
        var prevDay1 = formatDate(date, '2'); 

        console.log(prevDay);

        var d = addMonths(date, 1);

        var nextDay = formatDate(d, '1');  
        var nextDay1 = formatDate(d, '2');
        console.log(nextDay);

        $('#idStartDate').val(prevDay);
        $('#idEndDate').val(nextDay);
        $('input[name=daterange]').val(prevDay1+' - '+nextDay1);

        var startDate = $('#idStartDate').val();
        var endDate = $('#idEndDate').val();

        $(".gantt").gantt({
            source: "fetch-event.jsp?startDate="+startDate+"&endDate="+endDate,
            //source: demoSource,
            navigate: "scroll",
            scale: "days", //months, weeks, days, hours
            maxScale: "days",
            minScale: "days",
            itemsPerPage: 20,
            scrollToToday: true,
            useCookie: false,
            months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            dow: ["일", "월", "화", "수", "목", "금", "토"],
            onItemClick: function(data) {
                //alert("Item clicked - show some details"+data);
            },
            onAddClick: function(dt, rowId) {
                /*
                alert("Empty space clicked - add an item!");
                */
            },
            onRender: function() {
                if (window.console && typeof console.log === "function") {
                    console.log("chart rendered");
                }
            }
        });

            /*
            $(".gantt").popover({
                selector: ".bar",
                title: function _getItemText() {
                    return this.textContent;
                },
                container: '.gantt',
                content: "Here's some useful information.",
                trigger: "hover",
                placement: "auto right"
            });
            */

            //prettyPrint();

            $('input[name="daterange"]').daterangepicker({
                opens: 'left'
            }, function(start, end, label) {
                //console.log("A new date selection was made: " + start.format('YYYYMMDD') + ' to ' + end.format('YYYYMMDD'));
                //console.log(start);

                $(".gantt").gantt({
                    source: "fetch-event.jsp?startDate="+start.format('YYYYMMDD')+"&endDate="+end.format('YYYYMMDD'),
                    //source: demoSource,
                    navigate: "scroll",
                    scale: "days", //months, weeks, days, hours
                    maxScale: "days",
                    minScale: "days",
                    itemsPerPage: 20,
                    scrollToToday: true,
                    useCookie: false,
                    months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    dow: ["일", "월", "화", "수", "목", "금", "토"],
                    onItemClick: function(data) {
                        //alert("Item clicked - show some details"+data);
                    },
                    onAddClick: function(dt, rowId) {
                        /*
                        alert("Empty space clicked - add an item!");
                        */
                    },
                    onRender: function() {
                        if (window.console && typeof console.log === "function") {
                            console.log("chart rendered");
                        }
                    }
                });
            });

        });
    </script>

    </body>
</html>
