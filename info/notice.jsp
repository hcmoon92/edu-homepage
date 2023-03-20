<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>TTA 교육/세미나 안내</title>
<!-- head안 태그는 로딩되지않는다, quirks모드 이기 때문에 -->

<script>
    $(document).ready(function() {
        var query = $('#query').val();

        $.ajax({
            url: "fetch-event.jsp",
            type: 'POST',
            data: { query: query},
            dataType: "JSON",
            success: function (data) {
				alert(data);
                //$('#tbl_result').bootstrapTable('load', data); 
            }
        });
	});
</script>
</head>
<body>
	<table width="800" style="margin:0 auto; font-family:'Malgun Gothic','맑은 고딕', sans-serif; border-collapse:collapse;">
		<tbody>
			<tr>
				<td style="height:80px; padding:0 20px;">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center" style="margin:0 auto; table-layout:fixed;border-collapse:collapse";>
						<tbody>
							<tr>
								<td><img src="images/mail4_img1.png" alt="TTA 아카데미"></td>
								<td style="text-align:right; color:#727272; font-size:16px; font-weight:bold;"><a href="http://edu.tta.or.kr">https://edu.tta.or.kr</a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td style="height:297px; background:url(images/mail4_bg2.jpg) no-repeat; vertical-align:top">
					<table>
						<tr>
							<td style="padding:34px 0 0 25px; font-size:18px; color:#fff; font-weight:bold;">2019년<br><span style=" color:#fffc00">협회 회원사는 교육비 무료 !!</span></td>
						</tr>
						<tr>
							<td style="padding:63px 0 0 40px; font-size:30px; color:#2f4577; font-weight:bold;"><span style="font-size:37px;">TTA</span><br>아카데미 <span style="color:#000">교육 안내</span></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="padding:20px 20px;">
					<table>
						<tr>
							<td><img src="images/mail4_bg3.jpg" alt="" style="vertical-align:top"></td>
							<td style="font-size:20px; font-weight:bold;">교육과정 및 내용</td>
						</tr>
					</table>
				</td>
			</tr>
			<!-- 표 부분 -->
			<tr>
				<td style="padding-top:1px; padding:0 20px;">
					<table style="width:100%; background-color:#fff; border-collapse:collapse; border-spacing:0; font-size:13px; text-align:center; line-height:1.4; word-break:keep-all;">
						<thead style="color:#fff; font-size:14px; font-weight:bold; background-color:#515c75;">
							<tr>
<th style="width:35%; padding:10px 0; border-right:1px solid #fff; background-color:#32373a;">교육과정</th>
								<!-- <th style="width:auto; padding:10px 0; border-right:1px solid #fff; background-color:#32373a;">교육내용</th> -->
								<th style="width:10%; padding:10px 0; border-right:1px solid #fff; background-color:#32373a;">교육시간</th>
								<th style="width:10%; padding:10px 0; border-right:1px solid #fff; background-color:#32373a;">교육기간</th>
								<th style="width:10%; padding:10px 0; border-right:1px solid #fff; background-color:#32373a;">교육비용</th>								
								<th style="width:10%; padding:10px 0; border-right:1px solid #fff; background-color:#32373a;">담당자</th>								
								<th style="width:10%; padding:10px 0; background-color:#32373a;">교육장소</th>
							</tr>
						</thead>
						<tbody>
{% for item in items %}							
<tr>
               <td style="padding: 20px 8px; border-left:1px solid #b0b0b0; border-bottom:1px solid #b0b0b0; color:#000; font-weight:bold; text-align:left;">{{item.title}}</td>
								<!-- <td style="padding: 20px 8px; border-left:1px solid #b0b0b0; border-bottom:1px solid #b0b0b0; text-align:left;">{{item.content}}</td> -->
								<td style="padding: 20px 8px; border-left:1px solid #b0b0b0; border-bottom:1px solid #b0b0b0;">{{item.hours}}</td>
								<td style="padding: 20px 8px; border-left:1px solid #b0b0b0; border-bottom:1px solid #b0b0b0;">{{item.date}}</td>
								<td style="padding: 20px 8px; border-left:1px solid #b0b0b0; border-bottom:1px solid #b0b0b0;">{{item.rate}}</td>
								<td style="padding: 20px 8px; border-left:1px solid #b0b0b0; border-bottom:1px solid #b0b0b0;">{{item.person}}</td>
								<td style="padding: 20px 8px; border-left:1px solid #b0b0b0; border-right:1px solid #b0b0b0; border-bottom:1px solid #b0b0b0;">{{item.place}}</td>
							</tr>
{% endfor %}
							
						</tbody>
					</table>
				</td>
			</tr>
			<!-- // 표 부분 -->
			<tr>
				<td style="padding:10px 20px 20px;color:#000; font-size:14px;">* 사정에 따라 교육내용 및 일정은 일부 변경될 수 있음</td>
			</tr>
			<tr>
				<td style="padding:0 20px;">
					<table style="border-collapse:collapse; border-spacing:0; background-color:#f1f1f1; padding:25px 15px">
						<tr style="font-size:14px;">
							<td style="width:63px; padding:25px 15px 8px 25px; color:#fff; background:url(images/mail4_bg1.png) 16px 22px no-repeat;">교육 대상</td>
							<td style="padding:15px 15px 0 0;"><span style="color:#f6003a">재직자에 한함</span>(고용보험 가입 재직자 및 협회와 교육협약 체결기업의 임직원)</td>
						</tr>
						<tr style="font-size:14px">
							<td style="padding:3px 15px 10px 25px; color:#fff; background:url(images/mail4_bg1.png) 16px 0 no-repeat; vertical-align:top;">수&nbsp;&nbsp;강&nbsp;&nbsp;료</td>
							<td style="padding: 0 15px 0 0; vertical-align:top;">1일당 1만원 (한국사물인터넷협회 회원사 임직원 무료) </td>
						</tr>
						<tr style="font-size:14px;">
							<td style="padding:3px 15px 10px 25px; color:#fff; background:url(images/mail4_bg1.png) 16px 0 no-repeat;">제공 사항</td>
							<td style="padding: 0 15px 0 0; vertical-align:top;">중식, 교재 수료증(수료생에 한함)</td>
						</tr>
						<tr style="font-size:14px;">
							<td colspan="2" style="padding:3px 15px 10px 25px; color:#fff; background:url(images/mail4_bg1.png) 16px 0 no-repeat;">교육 장소</td>
						</tr>
						<tr style="font-size:14px;">
							<td colspan="2" style="padding:0 15px 0 30px;">한국정보통신기술협회 교육장(경기도 성남시 분당구 분당로 47) <br>
분당선 서현역 4번 출구에서 AK플라자 6번 GATE에서 분당구청 방면으로 약 100M 지점 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
<br></td>
						</tr>
						<tr style="font-size:14px;"> </tr>
						<tr style="font-size:14px;">
							<td style="padding:3px 15px 20px 25px; color:#fff; background:url(images/mail4_bg1.png) 16px 0 no-repeat; vertical-align:top;">문&nbsp;&nbsp;의&nbsp;&nbsp;처</td>
							<td style="vertical-align:top; padding:3px 15px 20px 0;">TTA아카데미 &nbsp; &nbsp;Tel. 02-3454-1480 &nbsp;&nbsp; E-mail. edu@kiot.or.kr</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="display:block; padding:20px 20px 0">
					<table style="width:100%; margin-bottom:40px; background-color:#e6eef1; text-align:center; font-size:13px; color:#5d5d5d; font-weight:bold;">
						<tr>
							<td colspan="2" style="padding:15px 0;"> 하단 표시 내용 </td>
						</tr>
					</table>

				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>	
