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

    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    /*
    String sql ="select MBER_NM, BRTHDY, A.EVENT_ID, TLPHON, MOBLPHON, EMAIL, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, "+
    "EVENT_PLACE, EVENT_CHARGER, EVENT_CHARGER_TELNO, B.FRST_REGIST_PNTTM, APPLCNT_ID " +
    "FROM comtneventuserinfo A LEFT JOIN COMTNEVENTMANAGE B ON A.EVENT_ID = B.EVENT_ID WHERE 1=1 " +
    " AND EVENT_BGNDE >= DATE_ADD(NOW(), INTERVAL -1 MONTH) AND EVENT_BGNDE < DATE_ADD(NOW(), INTERVAL +1 MONTH) " +
    " AND (APPLCNT_ID=(select ESNTL_ID FROM comtngnrlmber WHERE MBER_ID='"+query+"') OR MOBLPHON LIKE '%"+query+"%' )";
    */

    String sql ="select MBER_NM, BRTHDY, A.EVENT_ID, TLPHON, MOBLPHON, EMAIL, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, "+
    "EVENT_PLACE, EVENT_CHARGER, EVENT_CHARGER_TELNO, B.FRST_REGIST_PNTTM, APPLCNT_ID " +
    "FROM comtneventuserinfo A LEFT JOIN COMTNEVENTMANAGE B ON A.EVENT_ID = B.EVENT_ID WHERE 1=1 " +
    " AND EVENT_BGNDE >= DATE_ADD(NOW(), INTERVAL -1 MONTH) AND EVENT_BGNDE < DATE_ADD(NOW(), INTERVAL +1 MONTH) " +
//    " AND APPLCNT_ID='"+query+"' ";
    " AND MOBLPHON LIKE'%"+query+"%' ";

    //out.print(sql);

    JSONArray itemList = new JSONArray();

    resultSet = statement.executeQuery(sql);
    int i=0;
    while(resultSet.next()){
        String memberNm=resultSet.getString("MBER_NM");
        String eventNm=resultSet.getString("EVENT_NM");
        String email=resultSet.getString("EMAIL");
        String telno=resultSet.getString("TLPHON");
        String mobileno=resultSet.getString("MOBLPHON");
        String eventId = resultSet.getString("EVENT_ID");
        String applicantId = resultSet.getString("APPLCNT_ID");
        String eventBegin = resultSet.getString("EVENT_BGNDE");
        String eventEnd = resultSet.getString("EVENT_ENDDE");
        i++;
        //out.println(name+','+eventNm);

        telno = telno.replace("-", "");
        mobileno = mobileno.replace("-","");
        if (telno.length()>4) telno = telno.substring(telno.length()-4);
        if (mobileno.length()>4) mobileno = mobileno.substring(mobileno.length()-4);
        String emailArray[] = email.split("@");

        String detailKey = 'E'+eventId+",A"+applicantId+",@"+emailArray[0]+",T"+telno+",M"+mobileno;
        String detail='E'+eventId.substring(14)+'A'+applicantId.substring(14)+memberNm+emailArray[0]+'T'+telno+'M'+mobileno;
        String detailUrl= detailKey;

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("result", "ok");
        obj.put("eventId", eventId);
        obj.put("applicantId", applicantId);
        obj.put("memberNm", memberNm);
        obj.put("eventNm", eventNm);
        obj.put("email", emailArray[0]);
        obj.put("telno", telno);
        obj.put("mobileno", mobileno);
        obj.put("detail", detailUrl);
        obj.put("eventBegin", eventBegin);
        obj.put("eventEnd", eventEnd);

        itemList.add(obj);       
    }

    out.print(itemList.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>