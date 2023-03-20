<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.io.*,java.util.*" %>

<%
File jsp = new File(request.getRealPath(request.getServletPath()));
File dir = jsp.getParentFile();
File[] list = dir.listFiles();
//File[] list = jsp.listFiles();

String f;

%>

<h1>Directories</h1>
<ul>
<%

if (list.length > 0) {

    for (int i = 0; i < list.length; i++) {
        f = list[i].getName();
        if (f.toLowerCase().endsWith(".jpg") || f.toLowerCase().endsWith(".png")) {
%>
            <li><a href="<%=f%>" target="_top"><%=f%></a><br>
<%
        }
    }
}
%>
</ul>