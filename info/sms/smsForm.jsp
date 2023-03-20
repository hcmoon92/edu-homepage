<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>TTA아카데미</title>
<meta name="generator" content="whoisweb">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/StringUtil.js"></script>
<script type="text/javascript">
	doShowDate = function(_gb) {
		if (_gb == 'reserve') {
			document.getElementById('reserveTr').style.display = "";
		} else {
			document.getElementById('reserveTr').style.display = "none";
		}
	}

	doSendSms = function() {
		if (document.smsForm.sms_msg.value == "") {
			document.smsForm.sms_msg.focus();
			alert('메세지를 입력해 주십시오');
			return;
		}
		if (confirm('SMS를 발송 하시겠습니까?')) {
			document.smsForm.submit();
		}
	}

	doSetText = function(_type) {
	}
</script>
</head>
<body style="overflow-X: hidden;">
	<form method="post" action="./smsSend.jsp" name="smsForm">

		<div class="container" style="margin-left: 12px;">
			<h4 class="tit_s">문자메세지 발송</h4>
		</div>
		<table class="writeLayout4" summary="메일발송" style="margin-left: 12px;">
			<tbody>
				<tr>
					<th class="subjectC"><label for="">메세지</label></th>
					<td><textarea name="sms_msg" id="sms_msg" rows="10" cols="52"></textarea><br />
					<b><span id="rtTxt">0</span></b>&nbsp;byte</td>
				</tr>
				<tr>
					<th class="subjectC"><label for="">받는사람 번호</label></th>
					<td>
 						<input name="sms_to" value="010-5111-1340" /> <br />
					</td>
				</tr>
				<tr>
					<th class="subjectC"><label for="">보내는 사람 번호</label></th>
					<td>
						<select name="sms_from" id="sms_from">
							<option value="031-780-9071">한윤경</option>
							<option value="031-780-9386">문형철</option>							
							<option value="031-780-9394">김지희</option>
							<option value="031-780-9061">정다운</option>
							<option value="031-780-9401">박문정</option>
							<option value="010-5110-9765">강지운(무선)</option>
							<option value="010-5111-1092">정다운(무선)</option>
							<option value="010-5103-0035">김승주(무선)</option>
						</select>

					</td>
				</tr>
		</table>
	</form>
	<ul class="buttons2"
		style="padding-bottom: 27px; padding-right: 11px; float: right;">
		<li><a href="javascript:void(0)" onclick="self.close()">취소</a></li>
		<li><a href="javascript:void(0)" onclick="doSendSms()">발송</a></li>
	</ul>
	<iframe name="hiddenframe" style="display: none;"></iframe>
</body>
</html>