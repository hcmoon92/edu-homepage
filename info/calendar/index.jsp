<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%
	String dataSel=request.getParameter("dataSel"); //    champ or edu

	String btnEdu = "";
	String btnChamp = "";
	if (dataSel !=null) {
		if (dataSel.equals("champ")) {
			btnChamp = "btn-inverse";
		} else {
			btnEdu = "btn-inverse";
		}
	} else {
		btnEdu = "btn-inverse";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>TTA 아카데미 교육/행사 일정</title>

	<meta name="description" content="Full view calendar component for twitter bootstrap with year, month, week, day views.">
	<meta name="keywords" content="jQuery,Bootstrap,Calendar,HTML,CSS,JavaScript,responsive,month,week,year,day">
	<meta name="author" content="Serhioromano">
	<meta charset="UTF-8">

	<link rel="stylesheet" href="components/bootstrap2/css/bootstrap.css">
	<link rel="stylesheet" href="components/bootstrap2/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="css/calendar.css">
	<link rel="stylesheet" href="css/app.css">

	<style type="text/css">
		.btn-twitter {
			padding-left: 30px;
			background: rgba(0, 0, 0, 0) url(https://platform.twitter.com/widgets/images/btn.27237bab4db188ca749164efd38861b0.png) -20px 6px no-repeat;
			background-position: -20px 11px !important;
		}
		.btn-twitter:hover {
			background-position:  -20px -18px !important;
		}
		.aClass {
			font-size: 12px;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="top">
		<h2>TTA 아카데미 교육/행사 일정</h2>	

		<a class="btn <%=btnEdu%>" href="?dataSel=edu">EDU 교육/행사</a>
		<a class="btn <%=btnChamp%>" href="?dataSel=champ">CHAMP 교육/행사</a>
	</div>

	<div class="page-header">
		<div class="pull-center form-inline">
			<div class="btn-group">
				<button class="btn btn-primary" data-calendar-nav="prev"><< 이전</button>
				<button class="btn" data-calendar-nav="today">오늘</button>
				<button class="btn btn-primary" data-calendar-nav="next">다음 >></button>
			</div>
		</div>

		<h3></h3>
	</div>

	<div class="row">
		<div class="span7">
			<div id="calendar"></div>
		</div>
		<div class="span5">
			<h4>행사목록</h4>
			<ul id="eventlist" class="nav nav-list"></ul>
		</div>
	</div>


	<div class="clearfix"></div>

	<div class="modal hide fade" id="events-modal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>Event</h3>
		</div>
		<div class="modal-body" style="height: 400px">
		</div>
		<div class="modal-footer">
			<a href="#" data-dismiss="modal" class="btn">Close</a>
		</div>
	</div>

	<input type=hidden id="dataSel" value=<%=dataSel%>></input>

	<script type="text/javascript" src="components/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="components/underscore/underscore-min.js"></script>
	<script type="text/javascript" src="components/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="components/jstimezonedetect/jstz.min.js"></script>
	<script type="text/javascript" src="js/language/nl-NL.js"></script>
	<script type="text/javascript" src="js/language/fr-FR.js"></script>
	<script type="text/javascript" src="js/language/de-DE.js"></script>
	<script type="text/javascript" src="js/language/el-GR.js"></script>
	<script type="text/javascript" src="js/language/it-IT.js"></script>
	<script type="text/javascript" src="js/language/hu-HU.js"></script>
	<script type="text/javascript" src="js/language/pl-PL.js"></script>
	<script type="text/javascript" src="js/language/pt-BR.js"></script>
	<script type="text/javascript" src="js/language/ro-RO.js"></script>
	<script type="text/javascript" src="js/language/es-MX.js"></script>
	<script type="text/javascript" src="js/language/es-ES.js"></script>
	<script type="text/javascript" src="js/language/ru-RU.js"></script>
	<script type="text/javascript" src="js/language/sv-SE.js"></script>
    <script type="text/javascript" src="js/language/zh-CN.js"></script>
    <script type="text/javascript" src="js/language/cs-CZ.js"></script>
    <script type="text/javascript" src="js/language/ko-KR.js"></script>
    <script type="text/javascript" src="js/language/zh-TW.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/app.js"></script>

</div>
</body>
</html>
