<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR Code Generator</title>

    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"
        integrity="sha256-QVBN0oT74UhpCtEo4Ko+k3sNo+ykJFBBtGduw13V9vw=" crossorigin="anonymous" />
    <script src="../qrcode.min.js"></script>
</head>

<body>
    <div class="cont">
        <div class="">
            <div class="ui input">
                <input type="text" placeholder="Search...">
            </div>

            <button class="ui primary button" onclick="genQR()">아카데미QR코드</button>
        </div>

        <div class="qrcode">
            <canvas id="canvas">
            </canvas>
        </div>

    </div>

    <form method="post" action="../../sms/smsSend.jsp" name="smsForm">

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
							<option value="031-780-9401">박문정</option>
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

    <script src="../script.js"></script>
    <script>
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

</body>

</html>