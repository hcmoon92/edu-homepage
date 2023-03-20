<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TTA 교육 실적 집계</title>
    <style>
        th, td {
            padding: 5px;
            text-align: left;
            vertical-align: top;
        }

        a:link { color: green; }
        a:visited { color: green; }
        a:hover { color: blue; }
        a:active { color: green; }
    </style>
</head>

<body>
    <sql:setDataSource var="myDS" driver="org.mariadb.jdbc.Driver" url="jdbc:mysql://211.253.241.229:3306/edutta"
        user="root" password="rkvldk9711" />

    <table id=tbl_wrapper><tr><td>
    <sql:query sql="SELECT	@RNUM:=@RNUM+1	AS	rowCount
    ,	A.EVENT_ID	AS	eventId
    ,	A.EVENT_SE	AS	eventSe
    ,	A.EVENT_NM	AS	eventNm
    ,	A.EVENT_PURPS	AS	eventPurps
    ,	A.EVENT_BGNDE	AS	eventBeginDe
    ,	A.EVENT_ENDDE	AS	eventEndDe
    ,	A.EVENT_AUSPC_INSTT_NM	AS	eventAuspcInsttNm
    ,	A.EVENT_MNGT_INSTT_NM	AS	eventMngtInsttNm
    ,	A.EVENT_PLACE	AS	eventPlace
    /* ,	A.EVENT_CN	AS	eventCn */
    ,	A.CT_OCCRRNC_AT	AS	ctOccrrncAt
    ,	A.PARTCPT_CT	AS	partcptCt
    ,	A.ST_PARTCPT_CT	AS	stPartcptCt
    ,	A.EVENT_DATE_CCR	AS	eventDateCcr
    ,	A.EVENT_DSCNT_MB	AS	eventDscntMb
    ,	A.EVENT_DSCNT_ST	AS	eventDscntSt
    ,	A.EVENT_DSCNT_MU	AS	eventDscntMu
    ,	A.EVENT_DSCNT_FB	AS	eventDscntFb
    ,	A.PSNCPA	AS	psncpa
    ,	A.WAIT_PSNCPA	AS	waitPsncpa
    ,	A.REFRN_URL	AS	refrnUrl
    ,	A.NOTICE_AT	AS	noticeAt
    ,	A.RCEPT_CLOS	AS	rceptClos
    ,	CONCAT(TO_DAYS(A.EVENT_ENDDE) - TO_DAYS(A.EVENT_BGNDE) + 1) AS eventTemp1
    ,	IFNULL(B.ATDRN_COUNT, 0)	AS	eventTemp2
    ,	(SELECT code_nm FROM COMTCCMMNDETAILCODE  WHERE  code_id ='COM053'  AND    CODE    = A.EVENT_SE) AS eventTemp3
    FROM    (SELECT @RNUM:=0) R,  COMTNEVENTMANAGE A
        LEFT OUTER JOIN	(
            SELECT	EVENT_ID, COUNT(DISTINCT(APPLCNT_ID))	AS	ATDRN_COUNT
            FROM	COMTNEVENTATDRN 
            WHERE	1=1
            AND	CONFM_AT IN ('','A','C')
            GROUP BY	EVENT_ID
        )	B	/*	반려('R') 없는 신청 수	*/
        ON	B.EVENT_ID = A.EVENT_ID  
    WHERE NOT A.EVENT_NM LIKE '%취소%' AND A.EVENT_BGNDE > '20200101' ORDER BY eventTemp3 ASC, eventBeginDe ASC"
     var="listItems" dataSource="${myDS}">
    </sql:query>

    <div align="center">
        <table border="1" cellspacing="0" cellpadding="1">
            <caption>
            </caption>
            <tr>
                <th>분류</th>
                <th>시작</th>
                <th>종료</th>
                <th>행사명</th>
                <th>정원</th>
                <th>신청</th>
                <th>누적</th>
            </tr>
            <c:forEach var="item" items="${listItems.rows}">
                <tr>
                    <td>
                        <c:out value="${item.eventTemp3}" />
                    </td>
                    <td>
                        <c:out value="${item.EVENT_BGNDE}" />
                    </td>    
                    <td>
                        <c:out value="${item.EVENT_ENDDE}" />
                    </td>                                       
                    <td>
                        <c:out value="${item.EVENT_NM}" />
                    </td>
                    <td>
                        <c:out value="${item.PSNCPA}" />
                    </td>
                    <td>
                        <c:out value="${item.eventTemp2}" />
                    </td>
                    <td>
                        <c:set var="sum" value="${sum+ item.eventTemp2}"/>
                        <c:out value="${sum}" />
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>

</html>