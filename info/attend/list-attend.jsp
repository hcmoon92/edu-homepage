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