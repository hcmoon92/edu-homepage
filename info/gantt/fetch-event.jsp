<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>

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
    String sql ="select EVENT_SE, B.EVENT_ID, B.EVENT_CD, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, "+
    " EVENT_PLACE, EVENT_CHARGER, EVENT_CHARGER_TELNO, PARTCPT_CT, C.NAME  " +
    " FROM COMTNEVENTMANAGE B LEFT JOIN EDU_MENU_SECOND C ON B.EVENT_CD = C.EVENT_CD WHERE 1=1 " +
    //" AND EVENT_BGNDE >= "+startDate+" AND EVENT_BGNDE < DATE_ADD(DATE("+endDate+"), INTERVAL +1 MONTH) " +
    " AND EVENT_BGNDE >= "+startDate+" AND EVENT_BGNDE < "+endDate +
    " ORDER BY EVENT_BGNDE ASC";

    JSONArray itemList = new JSONArray();

    resultSet = statement.executeQuery(sql);
    int i=0;
    while(resultSet.next()){
        String eventSector=resultSet.getString("EVENT_SE");
        String eventId=resultSet.getString("EVENT_ID");
        String eventCode=resultSet.getString("C.NAME");
        String eventNm=resultSet.getString("EVENT_NM");
        String eventBegin = resultSet.getString("EVENT_BGNDE");
        String eventEnd = resultSet.getString("EVENT_ENDDE");
        String from = resultSet.getString("EVENT_BGNDE");
        String to = resultSet.getString("EVENT_ENDDE");        
        String eventPlace = resultSet.getString("EVENT_PLACE");
        String eventCharger = resultSet.getString("EVENT_CHARGER");
        String eventChargerTelno = resultSet.getString("EVENT_CHARGER_TELNO");
        String eventValue = resultSet.getString("PARTCPT_CT");
        i++;

        if (eventCode == null) eventCode = "세미나";

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();

        JSONArray arrayValue = new JSONArray();
        JSONObject objValue = new JSONObject();
        /*
        {
            name: "Sprint 0",
            desc: "Analysis",
            values: [{
                from: 1320192000000,
                to: 1322401600000,
                label: "Requirement Gathering",
                customClass: "ganttRed"
            }]
        },
        */

 
        String str =eventBegin.substring(eventBegin.length()-2, eventBegin.length());
        String str1 =eventEnd.substring(eventEnd.length()-2, eventEnd.length());

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); // String 날짜 형식을 정의 합니다. 
        Date fromVal = sdf.parse(eventBegin);	// 20200101 -> 199999900000 시간으로 변경을 합니다. 
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd"); // String 날짜 형식을 정의 합니다. 
        Date toVal = sdf1.parse(eventEnd);	// 20200101 -> 199999900000 시간으로 변경을 합니다. 

        String label = str;
        if (!str.equals(str1)) label = str+"~"+ str1;

        objValue.put("from", fromVal.getTime());
        objValue.put("to", toVal.getTime()+300000);
        objValue.put("label", label);
        objValue.put("customClass", "ganttRed");
        objValue.put("dataObj", eventNm);
        arrayValue.add(objValue);
  
        obj.put("name", "<i><a href=../attend/show-event.jsp?eventId="+eventId+" target=_blank>"+eventNm+"</a></i>");
        //obj.put("desc", "Analysis");
        obj.put("values", arrayValue);


        /*
        obj.put("result", "ok");
        obj.put("eventSector", eventSector);
        obj.put("eventCode", eventCode);
        obj.put("eventNm", eventNm);
        obj.put("eventBegin", eventBegin);
        obj.put("eventEnd", eventEnd);
        obj.put("from", eventBegin);
        obj.put("to", eventEnd);
        obj.put("eventPlace", eventPlace);
        obj.put("eventCharger", eventCharger);
        obj.put("eventChargerTelno", eventChargerTelno);
        obj.put("eventValue", eventValue);
        */

        itemList.add(obj);       
    }

    out.print(itemList.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>