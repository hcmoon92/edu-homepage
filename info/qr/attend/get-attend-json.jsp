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
    String query=request.getParameter("query");

    connection = DriverManager.getConnection(connectionUrl, userid, password);

    statement=connection.createStatement();
    /*
    String sql ="select MBER_NM, BRTHDY, A.EVENT_ID, TLPHON, MOBLPHON, EMAIL, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, "+
    "EVENT_PLACE, EVENT_CHARGER, EVENT_CHARGER_TELNO, B.FRST_REGIST_PNTTM, APPLCNT_ID " +
    "FROM edutta.comtneventuserinfo A LEFT JOIN edutta.COMTNEVENTMANAGE B ON A.EVENT_ID = B.EVENT_ID WHERE 1=1 " +
    " AND EVENT_BGNDE >= DATE_ADD(NOW(), INTERVAL -12 MONTH) AND EVENT_BGNDE < DATE_ADD(NOW(), INTERVAL +12 MONTH) ORDER BY EVENT_BGNDE DESC";
    */
    // http://egloos.zum.com/sweeper/v/3002133 INNER JOIN 사용법
    String sql ="SELECT A.EVENT_ID, A.APPLCNT_ID, A.ATTEND_DATETIME, B.EVENT_NM, C.MBER_ID, C.MBER_NM " +
    " FROM ((academy.eventmanage_attend A LEFT JOIN edutta.COMTNEVENTMANAGE B ON A.EVENT_ID = B.EVENT_ID) " +
  	" LEFT JOIN edutta.comtngnrlmber C ON A.APPLCNT_ID = C.ESNTL_ID) " +
    " ORDER BY B.EVENT_ID; ";

    JSONArray itemList = new JSONArray();

    resultSet = statement.executeQuery(sql);
    int i=0;
    while(resultSet.next()){
        String eventId=resultSet.getString("EVENT_ID");
        String applicantId=resultSet.getString("APPLCNT_ID");
        String attendTime=resultSet.getString("ATTEND_DATETIME");
        String eventName=resultSet.getString("EVENT_NM");
        String memberName=resultSet.getString("MBER_NM");
        i++;

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("result", "ok");
        //obj.put("eventId", eventId);
        //obj.put("applicantId", applicantId);
        obj.put("eventName", eventName);
        obj.put("attendTime", attendTime);
        obj.put("memberName", memberName);

        itemList.add(obj);       
    }

    out.print(itemList.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>