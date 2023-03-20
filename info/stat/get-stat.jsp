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
    String sql ="SELECT	@RNUM:=@RNUM+1	AS	rowCount " +
    " ,	A.EVENT_ID	AS	eventId " +
    " ,	A.EVENT_SE	AS	eventSe " +
    " ,	A.EVENT_NM	AS	eventNm " +
    " ,	A.EVENT_PURPS	AS	eventPurps " +
    " ,	A.EVENT_BGNDE	AS	eventBeginDe " +
    " ,	A.EVENT_ENDDE	AS	eventEndDe " +
    " ,	A.EVENT_AUSPC_INSTT_NM	AS	eventAuspcInsttNm " +
    " ,	A.EVENT_MNGT_INSTT_NM	AS	eventMngtInsttNm " +
    " ,	A.EVENT_PLACE	AS	eventPlace " +
    " ,	A.CT_OCCRRNC_AT	AS	ctOccrrncAt " +
    " ,	A.PARTCPT_CT	AS	partcptCt " +
    " ,	A.ST_PARTCPT_CT	AS	stPartcptCt " +
    " ,	A.EVENT_DATE_CCR	AS	eventDateCcr " +
    " ,	A.EVENT_DSCNT_MB	AS	eventDscntMb " +
    " ,	A.EVENT_DSCNT_ST	AS	eventDscntSt " +
    " ,	A.EVENT_DSCNT_MU	AS	eventDscntMu " +
    " ,	A.EVENT_DSCNT_FB	AS	eventDscntFb " +
    " ,	A.PSNCPA	AS	psncpa " +
    " ,	A.WAIT_PSNCPA	AS	waitPsncpa " +
    " ,	A.REFRN_URL	AS	refrnUrl " +
    " ,	A.NOTICE_AT	AS	noticeAt " +
    " ,	A.RCEPT_CLOS	AS	rceptClos " +
    " ,	CONCAT(TO_DAYS(A.EVENT_ENDDE) - TO_DAYS(A.EVENT_BGNDE) + 1) AS eventTemp1 " +
    " ,	IFNULL(B.ATDRN_COUNT, 0)	AS	eventTemp2 " +
    " ,	(SELECT code_nm FROM COMTCCMMNDETAILCODE  WHERE  code_id ='COM053'  AND    CODE    = A.EVENT_SE) AS eventTemp3 " +
    " FROM    (SELECT @RNUM:=0) R,  COMTNEVENTMANAGE A " +
        " LEFT OUTER JOIN	( " +
            " SELECT	EVENT_ID, COUNT(DISTINCT(APPLCNT_ID))	AS	ATDRN_COUNT " +
            " FROM	COMTNEVENTATDRN  " +
            " WHERE	1=1 " +
            " AND	CONFM_AT IN ('','A','C') " +
            " GROUP BY	EVENT_ID " +
        " )	B " +
        " ON	B.EVENT_ID = A.EVENT_ID   " +
    " WHERE NOT A.EVENT_NM LIKE '%취소%' AND A.EVENT_BGNDE > '20200101' ORDER BY eventTemp3 ASC, eventBeginDe ASC";

    JSONArray itemList = new JSONArray();

    resultSet = statement.executeQuery(sql);

    int i=0;
    while(resultSet.next()){
        String eventSector=resultSet.getString("eventSe");
        i++;

        out.print(i);

        // json 형태로 리턴하기 위한 json객체 생성
        JSONObject obj = new JSONObject();
        obj.put("result", "ok");
        obj.put("eventSector", eventSector);

        itemList.add(obj);       
    }
    out.print(itemList.toString()); // json 형식으로 출력

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>