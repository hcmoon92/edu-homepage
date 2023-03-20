<%
/**
 * Send Message
 * success : Code=>0, CodeMsg=>Success!!, LastPoint=>9999
 * fail 1  : Code=>100, CodeMsg=>Not Registered ID
 * fail 2  : Code=>200, CodeMsg=>Not Enough Point
 * fail 3  : Code=>300, CodeMsg=>Login Fail
 * fail 4  : Code=>400, CodeMsg=>No Valid Number
 * fail 5  : Code=>500, CodeMsg=>No Valid Message
 * fail 6  : Code=>600, CodeMsg=>Auth Fail
 * fail 7  : Code=>700, CodeMsg=>Invalid Recall Number
 */
%>
<%@ page import = "whois.whoisSMS,java.util.*,java.text.*" session="true" contentType="text/html;charset=utf-8" %>
<%
System.out.println("로그00");
%>
<jsp:useBean id="whois_sms" class="whois.whoisSMS" scope="session"/>
<%
System.out.println("로그11111111111111");
%>
<jsp:setProperty name="whois_sms" property="*"/>
<%

// 문자발송
/*C:\work\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp3\wtpwebapps\sjcf
* 후이즈와 계약한 아이디와 패스워드로 아래 값을 변경해서 사용해주세요
*/

System.out.println("로그01");
String sms_id = "ttaacademy";
String sms_passwd = "tta@9711";
String sms_type = "L";	// 설정 하지 않는다면 80byte 넘는 메시지는 쪼개져서 sms로 발송, L 로 설정하면 80byte 넘으면 자동으로 lms 변환

// 로그인
whois_sms.login (sms_id, sms_passwd);

System.out.println("로그02");

/*
* 문자발송에 필요한 발송정보
*/
// 받는사람번호
//String sms_to = request.getParameter("sms_to");
String [] sms_to = request.getParameterValues("sms_to");
System.out.println("로그03");
// 보내는 사람번호
String sms_from = request.getParameter("sms_from");
System.out.println("로그04");
// 발송예약시간 (현재시간보다 작거나 같으면 즉시 발송이며 현재시간보다 10분이상 큰경우는 예약발송입니다.)
String sms_date = request.getParameter("sms_date");
System.out.println("로그05");
// 보내는 메세지
String sms_msg = request.getParameter("sms_msg");
System.out.println("로그06");


//발송형태
String sms_gb = request.getParameter("sms_gb");
System.out.println("로그07");

if("reserve".equals(sms_gb)){
	sms_date = request.getParameter("yyyy")+request.getParameter("mm")+request.getParameter("dd")+request.getParameter("hh")+"1000";
	System.out.println("로그08");
}else{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.KOREA);
   	Date cNow = new Date();
   	sms_date = sdf.format(cNow);
   	System.out.println("로그09");
}

System.out.println("로그10");
// UTF-8 설정
whois_sms.setUtf8();
System.out.println("로그11");
for(int i = 0; i < sms_to.length; i++){
	System.out.println("로그12");
	// 파라메터 설정
	whois_sms.setParams (sms_to[i],sms_from,sms_msg,sms_date, sms_type);
	System.out.println("로그13");
	// 문자발송
	whois_sms.emmaSend();
}
System.out.println("로그14");

// 결과값 가져오기
int retCode = whois_sms.getRetCode();

// 발송결과 메세지
String retMessage = whois_sms.getRetMessage();

// 성공적으로 발송한경우 남은 문자갯수( 종량제 사용의 경우, 남은 발송가능한 문자수를 확인합니다.)
int retLastPoint = whois_sms.getLastPoint();

%>
<script>
	var rtCode = "<%= retCode %>";
	var msg = "";
	switch (rtCode){
		case "0":
			msg = '정상적으로 발송 되었습니다.';
		break;
		case "100":
			msg = '등록된 아이디가 아닙니다.';
		break;
		case "200":
			msg = 'SMS 포인트가 부족합니다.';
		break;
		case "300":
			msg = '로그인에 실패하였습니다.';
		break;
		case "400":
			msg = '유효한 번호가 아닙니다.';
		break;
		case "500":
			msg = '유효한 메세지가 아닙니다.';
		break;
		case "600":
			msg = '권한이 없습니다.';
		break;
		default:
			msg = '오류가 발생하였습니다.';
		break;
	}

	alert(msg+"\n남은 문자 갯수는 <%=retLastPoint%>건 입니다.\ncode(<%= retCode %>)");
	self.close();
	window.history.back();
</script>
