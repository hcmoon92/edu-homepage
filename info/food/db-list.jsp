<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>
</head>
<body>
    <sql:setDataSource
        var="myDS"
        driver="org.mariadb.jdbc.Driver"
        url="jdbc:mysql://211.253.241.229:3306/academy"
        user="root" password="rkvldk9711"
    />
     
    <sql:query var="listItems"   dataSource="${myDS}">
        SELECT * FROM board_table;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Items</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Contents</th>
                <th>Date</th>
            </tr>
            <c:forEach var="user" items="${listItems.rows}">
                <tr>
                    <td><c:out value="${user.ID}" /></td>
                    <td><c:out value="${user.TITLE}" /></td>
                    <td><c:out value="${user.CONTENTS}" /></td>
                    <td><c:out value="${user.CREATE_DATE}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
