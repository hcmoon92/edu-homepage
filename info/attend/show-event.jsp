<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.JSONArray" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Collections" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.lang.String" %>
<%@ page buffer="16kb" %> 

<%! 
    //선언부 : 변수 선언, 메소드 선언
    public int multiply(int a, int b) {
		int c = a * b;
		return c;
	}

    public int multiply1(int a, int b) {
		int c = a * b;
		return c;
	}

    public Boolean isValidate(String str) throws Exception {
        if(!str.equals("NULL")&&!str.equals("")&&str.length()>0){
            return true;
        } else {
            return false;
        }
    }


    public String toDateString(String dateStr) throws Exception {
        if(!dateStr.equals("NULL")&&!dateStr.equals("")&&dateStr.length()>0){
            return dateStr.substring(0,4) + "-" + dateStr.substring(4,6) + "-" + dateStr.substring(6,8);
        } else {
            return "";
        }
    }

    public Date getDateFromString(String dateStr) throws Exception {

        //String currentDateString = "02/27/2012 17:00:00";
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
        Date date = sd.parse(dateStr);

        return date;
    }

    // get 1030
    public String getDateString(Date date) throws Exception {

        //String currentDateString = "02/27/2012 17:00:00";
        SimpleDateFormat sd = new SimpleDateFormat("MMdd");
        String dateStr = sd.format(date);

        return dateStr;
    }

    public Date addDate(Date date, int days)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days); //minus number would decrement the days
        return cal.getTime();
    }

    /*
    public attendCheck(attendTimeStr, aDateList) { // 1030AM, 1029AM, [1029AM, 1029PM, 1030AM, 1030PM]

        var aTimes = attendTimeStr.split(",");

        var checkArray = [];
        for (i=0; i<aTimes.length; i++) {
            checkArray.push(aDateList.indexOf(aTimes[i]));
        }

        console.log(checkArray);

        var attendCheckImg = ['<img width=32px src="../images/check_circle_grey.png">', '<img width=32px src="../images/check_circle.png">'];
    }
    */

%>

<%
String driver = "org.mariadb.jdbc.Driver";
String connectionUrl = "jdbc:mysql://211.253.241.229:3306/";
String database = "edutta";
String userid = "root";
String password = "rkvldk9711";

try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
JSONArray itemList = new JSONArray();

try{
    String startDate=request.getParameter("startDate");
    String endDate=request.getParameter("endDate");
    String eventId=request.getParameter("eventId");

    //String eventId = "EVENT_00000000001766";
    //String eventId = "EVENT_00000000002055";

    connection = DriverManager.getConnection(connectionUrl, userid, password);

    statement=connection.createStatement();

    /*
    SELECT A.APPLCNT_ID, MBER_NM, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, DATEDIFF(EVENT_ENDDE,EVENT_BGNDE)+1 AS diff, 
       C.ATTEND_DATETIME, DATE_FORMAT(C.ATTEND_DATETIME,'%p') AS `date_field`
    FROM edutta.comtneventuserinfo A LEFT JOIN edutta.comtneventmanage B ON A.EVENT_ID= B.EVENT_ID 
    LEFT JOIN academy.eventmanage_attend C ON A.APPLCNT_ID = C.APPLCNT_ID  AND (DATE(C.ATTEND_DATETIME) BETWEEN EVENT_BGNDE AND EVENT_ENDDE) 
    WHERE A.EVENT_ID = 'EVENT_00000000001766' GROUP BY IFNULL(`date_field`, MBER_NM)
    */
    // 해당 행사 참석자 목록
    String sql ="SELECT A.APPLCNT_ID, A.PSINT_NM, A.MOBLPHON, B.EVENT_ID, C.REG_OK, MBER_NM, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, DATEDIFF(EVENT_ENDDE,EVENT_BGNDE)+1 AS diff, "+
    " C.ATTEND_DATETIME, DATE_FORMAT(C.ATTEND_DATETIME,'%Y%m%d%p') AS `ampm`, DATE_FORMAT(C.ATTEND_DATETIME,'%d') AS `date`, "+
    " GROUP_CONCAT(DISTINCT(DATE_FORMAT(C.ATTEND_DATETIME,'%m%d%p')) SEPARATOR ',' ) AS attendTimes FROM edutta.comtneventuserinfo A LEFT JOIN edutta.comtneventmanage B ON A.EVENT_ID= B.EVENT_ID "+
    " LEFT JOIN academy.eventmanage_attend C ON A.APPLCNT_ID = C.APPLCNT_ID  AND (DATE(C.ATTEND_DATETIME) BETWEEN EVENT_BGNDE AND EVENT_ENDDE) "+
    " WHERE A.EVENT_ID = '"+eventId+"' GROUP BY MBER_NM ORDER BY MBER_NM ASC, C.ATTEND_DATETIME ASC";

    resultSet = statement.executeQuery(sql);


    while(resultSet.next()){
        String data1=resultSet.getString("APPLCNT_ID");
        String data2=resultSet.getString("MBER_NM");
        String data3=resultSet.getString("EVENT_NM");
        String data4=resultSet.getString("EVENT_BGNDE");
        String data5=resultSet.getString("EVENT_ENDDE");
        String data6=resultSet.getString("diff");
        //String data7=resultSet.getString("ampm");
        String data7=resultSet.getString("attendTimes");
        String data8=resultSet.getString("EVENT_ID");
        String data9=resultSet.getString("REG_OK");
        String mobilePhone=resultSet.getString("MOBLPHON");
        String companyName=resultSet.getString("PSINT_NM");

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("result", "ok");
        obj.put("data1", data1);
        obj.put("data2", data2);
        obj.put("data3", data3);
        obj.put("data4", data4);
        obj.put("data5", data5);
        obj.put("data6", data6);
        obj.put("data7", data7);
        obj.put("data8", data8);
        obj.put("data9", data9);
        obj.put("mobilePhone", mobilePhone);
        obj.put("companyName", companyName);

        //str.add(data1);

        itemList.add(obj);       
    }
    //out.print(itemList.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}

JSONObject titleObj = (JSONObject) itemList.get(0);
String title = (String) titleObj.get("data3"); // event name
String diff = (String) titleObj.get("data6"); // dateDiff
int iDiff = Integer.parseInt(diff);
String eventId= (String) titleObj.get("data8");
String beginDate= (String) titleObj.get("data4");
String endDate= (String) titleObj.get("data5");


//---- find attend times 1030PM, 1029AM  of [1029AM, 1029PM, 1030AM, 1030PM]
Date start = getDateFromString(beginDate);

ArrayList aDateCheck = new ArrayList();
for (int i=0; i<iDiff; i++) {
    Date date = addDate(start, i);
    String dateStr = getDateString(date);

    aDateCheck.add( dateStr + "AM" );
    aDateCheck.add( dateStr + "PM" );

}

String[] aDateCheckImg = {"<img width=32px src=\"../images/check_circle_grey.png\">", "<img width=32px src=\"../images/check_circle.png\">"};

//out.print(aDateCheck);
/*
String attend1 = "1030PM,1029AM";
String[] aTimes = attend1.split(",");
ArrayList posTimes = new ArrayList();
for ( int i=0; i < aTimes.length; i++ ) {
    posTimes.add(aDateCheck.indexOf(aTimes[i]));
}
*/

/*
ArrayList aCheckList = new ArrayList();

for ( int i=0; i < aDateCheck.size(); i++ ) {
    if (posTimes.contains(i)) aCheckList.add(aDateCheckImg[1]);
    else aCheckList.add(aDateCheckImg[0]);
}
//Collections.sort(posTimes);
out.print(aCheckList);
*/


/*
for (i=0; i<aTimes.length; i++) {
    aDateCheck.indexOf(aTimes[i]);
}
*/
//boolean java7 = aDateCheck.contains("AM");

/*
 * yyyyMMdd 날짜문자열을 Date형으로 반환
 */

    /*
    SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
    Date from = fm.parse(beginDate);
    Date to = fm.parse(endDate);
    out.print(from);
    Date from1 = new Date(from.getTime() + (1000 * 60 * 60 * 24));
    */

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>

<style>
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
  text-align: center;
}
</style>

<script>

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

function formatDate(date, ampm) {
    var day = date.getDate();
    var month = date.getMonth()+1;
    var year = date.getFullYear();

    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;

    var dateStr = month +""+ day +"" + ampm.toUpperCase();  

    return dateStr;
}

function attendCheck(attendTimeStr, aDateList) { // 1030AM, 1029AM, [1029AM, 1029PM, 1030AM, 1030PM]

    var aTimes = attendTimeStr.split(",");

    var checkArray = [];
    for (i=0; i<aTimes.length; i++) {
        checkArray.push(aDateList.indexOf(aTimes[i]));
    }

    console.log(checkArray);

    var attendCheckImg = ['<img width=32px src="../images/check_circle_grey.png">', '<img width=32px src="../images/check_circle.png">'];
}

$( document ).ready(function() {

    $( "button.classConfirm" ).click(function() {
        var data =  $(this).attr("data-id");
        console.log(data);

        $.ajax({
          url: "./update-attend.jsp",
          type: 'POST',
          data: { act: "confirm", postData : data },
          success: function (data) {
              console.log(data);
              alert('현장확인 완료!!!');
              location.reload();
          }
        });

    });

    $( "button.classDelete" ).click(function() {
        var data =  $(this).attr("data-id");
        console.log(data);

        $.ajax({
          url: "./update-attend.jsp",
          type: 'POST',
          data: { act: "delete", postData : data },
          success: function (data) {
              console.log(data);
              alert('삭제 완료!!!');
              location.reload();
          }
        });

    });    
});
</script>
</head>

<body>
<h1> <%=title%> </h1>
<h1> <%=beginDate%> ~ <%=endDate%> </h1>
<table style="width:1200px;">
  <tr>
    <th>번호</th>
    <th>성명</th>
    <th>회사</th>
    <th>휴대전화</th>
    <th>출석체크</th>
    <%
    for(int j=0;j<iDiff;j++) {
    %>      
    <th><%=(j+1)%>일차</th>
    <%
    }
    %>
    <th>서명</th>
    <th>담당자</th>
    <th>상태</th>
  </tr>
    <%
    for(int i=0;i<itemList.size();i++) {
        JSONObject itemObj = (JSONObject) itemList.get(i);
        String applicantId= (String) itemObj.get("data1");
        String itemId= (String) itemObj.get("data2");
        String attend= (String) itemObj.get("data7");
        String regOk= (String) itemObj.get("data9");
        String mobilePhone= (String) itemObj.get("mobilePhone");
        String companyName= (String) itemObj.get("companyName");

        if (regOk == null) regOk = "";
        if (attend == null) attend = "";

        String[] aTimes = attend.split(",");
        ArrayList posTimes = new ArrayList();
        for ( int j=0; j < aTimes.length; j++ ) {
            posTimes.add(aDateCheck.indexOf(aTimes[j]));
        }

        ArrayList aCheckList = new ArrayList();
        for ( int j=0; j < aDateCheck.size(); j++ ) {
            if (posTimes.contains(j)) aCheckList.add(aDateCheckImg[1]);
            else aCheckList.add(aDateCheckImg[0]);
        }
        //Collections.sort(posTimes);
        //out.print(aCheckList);

    %>
        <tr>
            <td><%=(i+1)%></td>
            <td><%=itemId%></td>
            <td><%=mobilePhone%></td>
            <td><%=companyName%></td>
            <td><%=attend%></td>
            <%
            for(int j=0;j<iDiff;j++) {
                out.print("<td>"+aCheckList.get(2*j)+aCheckList.get(2*j+1)+"</td>");
            }
            %>
            <td></td>
            <td><button class="classConfirm" data-id="<%=applicantId%>-<%=eventId%>">확인</button>
            <button class="classDelete" data-id="<%=applicantId%>-<%=eventId%>">삭제</button></td>
            <td><%=regOk%></td>
        </tr>
    <%
    }
    %>

</table>

</body>

</html>