<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String scanData = request.getParameter("scanData");

if (scanData == null) return;

String driver = "org.mariadb.jdbc.Driver";
String connectionUrl = "jdbc:mysql://211.253.241.229:3306/";
String database = "academy";
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
try {

    //E001737,A010140,@paai99,T1394,M1394

    String[] strArray = scanData.split(",");

    //String eventId="000000";
    //String applicantId="111111";
    String eventId=strArray[0].substring(1);
    String applicantId=strArray[1].substring(1);
    //String memberId=strArray[2].substring(1);
    //String phoneNo=strArray[3].substring(1);
    //String mobileNo=strArray[4].substring(1);
    String note = scanData;

    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement = connection.createStatement();
    String sql ="INSERT INTO eventmanage_register (EVENT_ID, APPLCNT_ID, NOTE) VALUES ('"+eventId+"','"+applicantId+"','"+note+"')";
    resultSet = statement.executeQuery(sql);
    out.print("insert ok"); // 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}

%>