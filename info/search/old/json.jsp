<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String driverName="org.mariadb.jdbc.Driver";
    String url = "jdbc:mysql://211.253.241.229:3306/academy";
    String id = "root";
    String pwd ="rkvldk9711";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try{
        //[1] JDBC 드라이버 로드
        Class.forName(driverName);     
    }catch(ClassNotFoundException e){
        out.println("Where is your mysql jdbc driver?");
        e.printStackTrace();
        return;
    }
    //out.println("mysql jdbc Driver registered!!");
   
    try{
        connection = DriverManager.getConnection(url, id, pwd);
        statement=connection.createStatement();
        String sql ="select * from food_table";
        resultSet = statement.executeQuery(sql);

        while(resultSet.next()){
%>
            <tr>
            <td><%=resultSet.getString("id") %></td>
            </tr>
<%
        }
        connection.close();     //[3]데이타베이스 연결 해제

    } catch (Exception e) {
        e.printStackTrace();
        return;
    }
%>
</body>
</html>