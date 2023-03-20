<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션값 가져오기
    String id = (String) session.getAttribute("id"); // Object 타입이므로 다운캐스팅
    //out.println(id);
    //return false;

    if(id == null || id.equals("") ) {                            // id가 Null 이거나 없을 경우
        response.sendRedirect("/info/session/sessionLogin.jsp");    // 로그인 페이지로 리다이렉트 한다.
    } else {
        //out.println(id);
    }
%>