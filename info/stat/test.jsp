<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행사관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<c:url value='/js/jquery/jquery-1.8.3.min.js'/>"></script>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>

<sql:setDataSource var="myDS" driver="org.mariadb.jdbc.Driver" url="jdbc:mysql://211.253.241.229:3306/edutta"
user="root" password="rkvldk9711" />

<sql:query sql="SELECT * FROM comtneventmanage" 
  var="eventManageList" 
  dataSource="${myDS}">
</sql:query>

<div class="pageContainer">
<div id="border">
<table border="0" width="100%">
  <tr>
    <td>
	<table width="717" cellpadding="8" class="tbl_type pd_lst">
     <caption>행사관리 목록</caption>
	<thead>

	</thead>
	<tbody>
	<c:forEach items="${eventManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3" nowrap>

        	<input type="hidden" name="eventId" value="<c:out value="${resultInfo.eventId      }"/>">
            <span class="link"><c:out value="${resultInfo.eventNm}"/></span>

		</td>
		<td class="lt_text3" style="text-align:center;" nowrap><c:out value="${resultInfo.eventPlace}"/></td>
		<td class="lt_text3" style="text-align:center;" nowrap><c:out value="${resultInfo.eventTemp3}"/></td>
		<td class="lt_textL" style="text-align:center;" nowrap><c:out value="${resultInfo.eventBeginDe}"/> <br/>~ <c:out value="${resultInfo.eventEndDe}"/></td>

		<td class="lt_text3" style="text-align:center;" nowrap>
            <c:out value="${resultInfo.eventTemp2}"/>/<c:out value="${resultInfo.psncpa}"/>
        </td>
		<td class="lt_textL" style="text-align:center;" nowrap><c:out value="${resultInfo.rceptBeginDe}"/> <br/>~ <c:out value="${resultInfo.rceptEndDe}"/></td>
		<td class="lt_text3" style="text-align:center;" nowrap><!-- 등록자 아이디 -->
            <c:out value="${resultInfo.createId}"/>
        </td>


	</tr>
	</c:forEach>

	</tbody>
	</table>

</td>
</tr>
</table>
</DIV>
</div>

</body></html>
