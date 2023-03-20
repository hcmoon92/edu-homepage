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
try{
    String startDate=request.getParameter("startDate");
    String endDate=request.getParameter("endDate");
    //String eventId=request.getParameter("eventId");

    String eventId = "EVENT_00000000001766";

    connection = DriverManager.getConnection(connectionUrl, userid, password);

    statement=connection.createStatement();
    String sql ="SELECT * FROM academy.eventmanage_attend WHERE EVENT_ID = '"+eventId+"'";

    JSONArray itemList = new JSONArray();

    resultSet = statement.executeQuery(sql);

    while(resultSet.next()){
        String attendTime=resultSet.getString("ATTEND_DATETIME");

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("result", "ok");
        obj.put("time", attendTime);

        itemList.add(obj);       
    }
    out.print(itemList.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
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
<table style="width:400px;">
  <tr>
    <th>구분</th>
    <th>1일</th>
    <th>2일</th>
    <th>3일</th>
  </tr>
  <tr>
    <td>참석자1</td>
    <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
    <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
    <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
  </tr>
  <tr>
    <td>참석자2</td>
    <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
    <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
    <td> <img width=32px src="../images/check_circle_grey.png"><img width=32px src="../images/check_circle.png"> </td>
  </tr>

</table>

</body>

</html>