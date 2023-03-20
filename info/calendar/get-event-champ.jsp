
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
String driver = "org.mariadb.jdbc.Driver";
String connectionUrl = "jdbc:mysql://211.253.241.229:3306/";
String database = "champtta";
String userid = "root";
String password = "rkvldk9711";

try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}

HashMap<String,String> map1 = new HashMap<String,String>();//HashMap생성
map1.put("101", "event-success");
map1.put("102", "event-info");
map1.put("508", "event-warning");
map1.put("510", "event-inverse");
map1.put("csts", "event-important");
map1.put("etc", "event-special");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{


    String sFrom=request.getParameter("from"); //    '1598886000000'
    String sTo=request.getParameter("to");

    Date date1 = new Date(Long.parseLong(sFrom));
    Date date2 = new Date(Long.parseLong(sTo));
    SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
    String from = transFormat.format(date1);
    String to = transFormat.format(date2);

    connection = DriverManager.getConnection(connectionUrl+database, userid, password);

    statement=connection.createStatement();
    String sql ="SELECT a.idx, a.pdx, a.sdate, a.edate, a.etc3, b.title " +
        " from (`tb_edu` `a` left join `tb_edu_master` `b` on((`a`.`pdx` = `b`.`idx`))) " +
        "  WHERE 1=1  AND SDATE >= "+from+" AND EDATE < "+to +
        " ORDER BY SDATE ASC";


    JSONArray itemList = new JSONArray();

    resultSet = statement.executeQuery(sql);
    int i=0;

    while(resultSet.next()){
        //String eventSector=resultSet.getString("D.NAME");
        //String eventCode=resultSet.getString("C.NAME");
        String eventNm=resultSet.getString("b.title");
        String eventBegin = resultSet.getString("a.sdate");
        String eventEnd = resultSet.getString("a.edate");
        //String eventPlace = resultSet.getString("EVENT_PLACE");
        String eventCharger = resultSet.getString("a.etc3");
        //String eventChargerTelno = resultSet.getString("EVENT_CHARGER_TELNO");

        //String eventSeq = resultSet.getString("D.SEQ_NO");
        String eventClass = "event-important";

        i++;

        // String to Date
        SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyyMMdd");
        String sStart =  String.valueOf(transFormat1.parse(eventBegin).getTime());
        String sEnd =  String.valueOf(transFormat1.parse(eventEnd).getTime());

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("id", i);
        obj.put("title", eventNm);
        obj.put("start", sStart);
        obj.put("end", sEnd);
        obj.put("class", eventClass);
        itemList.add(obj);       
    }

    JSONObject obj = new JSONObject();

    obj.put("success", "1");
    obj.put("result", itemList);

    out.print(obj.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>