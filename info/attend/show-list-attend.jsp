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

    String eventId = "EVENT_00000000001766";

    connection = DriverManager.getConnection(connectionUrl, userid, password);

    statement=connection.createStatement();

    // 해당 행사 참석자 목록
    String sql ="SELECT APPLCNT_ID, MBER_NM, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE FROM edutta.comtneventuserinfo A LEFT JOIN edutta.comtneventmanage B ON A.EVENT_ID= B.EVENT_ID WHERE A.EVENT_ID = '"+eventId+"'";

    resultSet = statement.executeQuery(sql);

    while(resultSet.next()){
        String data1=resultSet.getString("APPLCNT_ID");
        String data2=resultSet.getString("MBER_NM");
        String data3=resultSet.getString("EVENT_NM");
        String data4=resultSet.getString("EVENT_BGNDE");
        String data5=resultSet.getString("EVENT_ENDDE");

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("result", "ok");
        obj.put("data1", data1);
        obj.put("data2", data2);
        obj.put("data3", data3);
        obj.put("data4", data4);
        obj.put("data5", data5);

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
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
}
</style>

</head>

<body>
<h1> <%=title%> </h1>
<table style="width:400px;">
  <tr>
    <th>구분</th>
    <th>1일</th>
    <th>2일</th>
    <th>3일</th>
  </tr>
    <%
    for(int i=0;i<itemList.size();i++) {
        JSONObject itemObj = (JSONObject) itemList.get(i);
        String itemId= (String) itemObj.get("data2");
    %>
        <tr>
            <td><%=itemId%></td>
            <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
            <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
            <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
        </tr>
    <%
    }
    %>

</table>

</body>

</html>