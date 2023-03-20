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

    connection = DriverManager.getConnection(connectionUrl+database, userid, password);

    statement=connection.createStatement();
    String sql ="select EVENT_SE, B.EVENT_CD, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, "+
    " EVENT_PLACE, EVENT_CHARGER, EVENT_CHARGER_TELNO, PARTCPT_CT, C.NAME  " +
    " FROM COMTNEVENTMANAGE B LEFT JOIN EDU_MENU_SECOND C ON B.EVENT_CD = C.EVENT_CD WHERE 1=1 " +
    //" AND EVENT_BGNDE >= "+startDate+" AND EVENT_BGNDE < DATE_ADD(DATE("+endDate+"), INTERVAL +1 MONTH) " +
    " AND EVENT_BGNDE >= "+startDate+" AND EVENT_BGNDE < "+endDate +
    " ORDER BY EVENT_CD ASC, EVENT_BGNDE DESC";

    JSONArray itemList = new JSONArray();

    resultSet = statement.executeQuery(sql);
    int i=0;
    while(resultSet.next()){
        String eventSector=resultSet.getString("EVENT_SE");
        String eventCode=resultSet.getString("C.NAME");
        String eventNm=resultSet.getString("EVENT_NM");
        String eventBegin = resultSet.getString("EVENT_BGNDE");
        String eventEnd = resultSet.getString("EVENT_ENDDE");
        String eventPlace = resultSet.getString("EVENT_PLACE");
        String eventCharger = resultSet.getString("EVENT_CHARGER");
        String eventChargerTelno = resultSet.getString("EVENT_CHARGER_TELNO");
        String eventValue = resultSet.getString("PARTCPT_CT");
        i++;

        if (eventCode == null) eventCode = "세미나";

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("result", "ok");
        obj.put("eventSector", eventSector);
        obj.put("eventCode", eventCode);
        obj.put("eventNm", eventNm);
        obj.put("eventBegin", eventBegin);
        obj.put("eventEnd", eventEnd);
        obj.put("eventPlace", eventPlace);
        obj.put("eventCharger", eventCharger);
        obj.put("eventChargerTelno", eventChargerTelno);
        obj.put("eventValue", eventValue);

        itemList.add(obj);       
    }

    out.print(itemList.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>