<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

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
    //String eventId=request.getParameter("eventId");

    //String eventId = "EVENT_00000000001766";
    String eventId = "EVENT_00000000002055";

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
    " C.ATTEND_DATETIME, DATE_FORMAT(C.ATTEND_DATETIME,'%Y%m%d%p') AS `ampm`, DATE_FORMAT(C.ATTEND_DATETIME,'%d') AS `date` "+
    " FROM edutta.comtneventuserinfo A LEFT JOIN edutta.comtneventmanage B ON A.EVENT_ID= B.EVENT_ID "+
    " LEFT JOIN academy.eventmanage_attend C ON A.APPLCNT_ID = C.APPLCNT_ID  AND (DATE(C.ATTEND_DATETIME) BETWEEN EVENT_BGNDE AND EVENT_ENDDE) "+
    " WHERE A.EVENT_ID = '"+eventId+"' GROUP BY IFNULL(`ampm`, MBER_NM) ORDER BY MBER_NM ASC, C.ATTEND_DATETIME ASC";

    resultSet = statement.executeQuery(sql);


    while(resultSet.next()){
        String data1=resultSet.getString("APPLCNT_ID");
        String data2=resultSet.getString("MBER_NM");
        String data3=resultSet.getString("EVENT_NM");
        String data4=resultSet.getString("EVENT_BGNDE");
        String data5=resultSet.getString("EVENT_ENDDE");
        String data6=resultSet.getString("diff");
        String data7=resultSet.getString("ampm");
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

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
<style>
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
}
</style>

<script>

/*
 * yyyyMMdd 날짜문자열을 Date형으로 반환
 */
function toDate(date_str)
{
    var yyyyMMdd = String(date_str);
    var sYear = yyyyMMdd.substring(0,4);
    var sMonth = yyyyMMdd.substring(4,6);
    var sDate = yyyyMMdd.substring(6,8);

    return new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
}

$( document ).ready(function() {
    $( "button" ).click(function() {
        var data =  $(this).attr("data-id");
        console.log(data);

        $.ajax({
          url: "./update-attend.jsp",
          type: 'POST',
          data: { postData : data },
          success: function (data) {
              console.log(data);
          }
        });

    });
});
</script>
</head>

<body>
<h1> <%=title%> </h1>
<h1> <%=beginDate%> ~ <%=endDate%> </h1>
<table style="width:800px;">
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
    <th>상태</th>
    <th>접수</th>
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
    %>
        <tr>
            <td><%=(i+1)%></td>
            <td><%=itemId%></td>
            <td><%=mobilePhone%></td>
            <td><%=companyName%></td>
            <td><%=attend%></td>
            <%
            for(int j=0;j<iDiff;j++) {
            %>            
            <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
            <%
            }
            %>
            <td><%=regOk%></td>
            <td><button class=aClass data-id="<%=applicantId%>-<%=eventId%>">접수</button></td>
        </tr>
    <%
    }
    %>

</table>

</body>

</html>