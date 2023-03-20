<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>

<%
//String eventId = request.getParameter("eventId");
//String applicantId = request.getParameter("applcntId");
String act = request.getParameter("act");
String postData = request.getParameter("postData");

if (postData == null) return;

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

    String[] strArray = postData.split("-");

    String applicantId=strArray[0];
    String eventId=strArray[1];
    String regOk = "Ok";
    String sql;

    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement = connection.createStatement();

    if (act.equals("confirm")) {
        sql = "INSERT INTO eventmanage_attend (EVENT_ID, APPLCNT_ID, REG_OK) VALUES ('"+eventId+"','"+applicantId+"','"+regOk+"')";
        resultSet = statement.executeQuery(sql);
        out.print("confirm ok"); // 출력    
    } else if (act.equals("delete")) {
        //DELETE FROM 테이블명 [WHERE 조건];
        //sql ="UPDATE eventmanage_attend SET REG_OK='', ATTEND_DATETIME=NULL WHERE EVENT_ID='"+eventId+"' AND APPLCNT_ID='"+applicantId+"' AND REG_OK='Ok'";
        sql ="DELETE FROM eventmanage_attend WHERE EVENT_ID='"+eventId+"' AND APPLCNT_ID='"+applicantId+"' AND `REG_OK`='Ok'";
        resultSet = statement.executeQuery(sql);
        out.print("delete ok"); // 출력    
    }

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}

%>