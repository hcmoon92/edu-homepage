<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TTA Food Court</title>
</head>
<body>
    <sql:setDataSource
        var="myDS"
        driver="org.mariadb.jdbc.Driver"
        url="jdbc:mysql://211.253.241.229:3306/academy"
        user="root" password="rkvldk9711"
    />
     
    <sql:query var="listItems"   dataSource="${myDS}">
        SELECT * FROM food_table;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Food List</h2></caption>
            <tr>
                <th>ID</th>
                <th>Category</th>
                <th>Name</th>
                <th>Address</th>
            </tr>
            <c:forEach var="item" items="${listItems.rows}">
                <tr>
                    <td><c:out value="${item.id}" /></td>
                    <td><c:out value="${item.type}" /></td>
<td>
<c:url value="https://map.kakao.com" var="url1">
  <c:param name="q" value="${item.name}" />
</c:url>
<a href="${url1}" />${item.name}</a>
</td>
<td>
<c:url value="./map.jsp" var="url">
  <c:param name="name" value="${item.name}" />
  <c:param name="addr" value="${item.addr}" />
</c:url>
<a href="${url}" />MAP</a>
</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
