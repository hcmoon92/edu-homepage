<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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

int loginCheck = -1;
request.setCharacterEncoding("UTF-8"); 
String loginType=request.getParameter("loginType");
String phone=request.getParameter("phone");

String applcntId = "";

try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);

    statement=connection.createStatement();

    String sql;

    /*
        sql ="select MBER_NM, BRTHDY, A.EVENT_ID, TLPHON, MOBLPHON, EMAIL, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, "+
        "EVENT_PLACE, EVENT_CHARGER, EVENT_CHARGER_TELNO, B.FRST_REGIST_PNTTM, APPLCNT_ID " +
        "FROM comtneventuserinfo A LEFT JOIN COMTNEVENTMANAGE B ON A.EVENT_ID = B.EVENT_ID WHERE 1=1 " +
        " AND EVENT_BGNDE >= DATE_ADD(NOW(), INTERVAL -1 MONTH) AND EVENT_BGNDE < DATE_ADD(NOW(), INTERVAL +1 MONTH) " +
        //" AND APPLCNT_ID=(select ESNTL_ID FROM comtngnrlmber WHERE MBER_ID='"+id+"') AND MBER_NM='"+uname+"' AND (TLPHON LIKE '%"+phone+"%' OR MOBLPHON LIKE '%"+phone+"%')";
        " AND APPLCNT_ID=(select ESNTL_ID FROM comtngnrlmber WHERE MBER_ID='"+id+"') AND MBER_NM='"+uname+"'";

    */
    sql ="select MBER_NM, BRTHDY, A.EVENT_ID, TLPHON, MOBLPHON, EMAIL, EVENT_NM, EVENT_BGNDE, EVENT_ENDDE, "+
    "EVENT_PLACE, EVENT_CHARGER, EVENT_CHARGER_TELNO, B.FRST_REGIST_PNTTM, APPLCNT_ID " +
    "FROM comtneventuserinfo A LEFT JOIN COMTNEVENTMANAGE B ON A.EVENT_ID = B.EVENT_ID WHERE 1=1 " +
    " AND EVENT_BGNDE >= DATE_ADD(NOW(), INTERVAL -1 MONTH) AND EVENT_BGNDE < DATE_ADD(NOW(), INTERVAL +1 MONTH) " +
    //" AND MBER_NM='김우성' AND MOBLPHON LIKE '%"+phone+"%'";
    " AND MOBLPHON LIKE '%"+phone+"%'";

    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
        //out.print(resultSet.getString("MBER_NM"));
        //applcntId = resultSet.getString("APPLCNT_ID");
        //query = resultSet.getString()
        //out.print(applcntId);
        loginCheck = 1;
    }

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}

%>

<html>
<head>
    <title>로그인 처리 JSP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <%

        // URL 및 로그인관련 전달 메시지
        String msg = "";

        if (loginCheck == 1) {
            // 세션에 현재 아이디 세팅
            //session.setAttribute("sessionID", id);
            //msg = "user-event.jsp?query="+applcntId;
            msg = "user-event.jsp?query="+phone;
            // URL뒤에 get방식 처럼 데이터를 전달가능
            response.sendRedirect(msg);

            //out.print(applcntId);
        }
        else    // 기타오류
        {
            out.print("해당 정보가 없습니다.!!! 다시 입력 바랍니다<br>");
            out.print("<button onclick=\"javascript:history.back()\">Go Back</button>");
        }

    %>
</body>
</html>

