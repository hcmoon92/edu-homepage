<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<title>Echo JSP</title>
 <meta charset="UTF-8">
</head>

<body>

 

<h1>Incoming HTTP Request</h1>

<div><div class="subHeader" style="position: relative; width: 750px; height: 60px; padding-top: 20px; color: rgb(78, 78, 78); font-family: Dotum, 돋움;"><div class="navi" style="position: absolute; right: 0px; top: 10px; height: 20px; font-size: 11px; color: rgb(172, 172, 172);"><br></div></div><div class="container" style="width: 750px; padding-bottom: 50px; clear: both; color: rgb(78, 78, 78); font-family: Dotum, 돋움;"><div class="infoWrap2" style="position: relative; clear: both; padding-top: 20px;"><h4 class="tit" style="margin: 0px; padding: 0px; height: 35px; clear: both;"><img src="http://hrdi.koreatech.ac.kr/title/tit_info_t2_nnn2.gif" alt="교육대상 및 입교자격" style="border: 0px none; vertical-align: top;"><a name="a2" style="color: rgb(0, 0, 0); cursor: pointer;">&nbsp;</a></h4><div class="content" style="padding: 5px 0px 20px;"><p style="padding-bottom: 5px; padding-left: 5px; line-height: 18px; text-align: justify;">직업능력개발훈련교사 자격기준 중 향상훈련과정에 해당하는 자</p><ul class="itemList" style="margin: 0px; padding: 0px 0px 10px 10px; list-style: none;"><li style="margin: 0px; padding: 0px; list-style: none; line-height: 18px;">- 1급 : 훈련교사 2급의 자격을 받고 3년 이상의 교육훈련경력이 있는자</li><li style="margin: 0px; padding: 0px; list-style: none; line-height: 18px;">- 2급 : 훈련교사 3급의 자격을 받고 3년 이상의 교육훈련경력이 있는자</li></ul></div><span class="btnTop" style="position: absolute; right: 0px; top: 25px;"><a href="http://hrdi.koreatech.ac.kr/info/info2_3.asp#" style="color: rgb(181, 31, 31); text-decoration-line: none; cursor: pointer;"><img src="http://hrdi.koreatech.ac.kr/images/common/btn/btn_top.gif" alt="top" style="border: 0px none;"></a></span></div><div class="infoWrap2" style="position: relative; clear: both; padding-top: 20px;"><h4 class="tit" style="margin: 0px; padding: 0px; height: 35px; clear: both;"><img src="http://hrdi.koreatech.ac.kr/title/tit_info_t2_nnn3.gif" alt="교육기간" style="border: 0px none; vertical-align: top;"><a name="a3" style="color: rgb(0, 0, 0); cursor: pointer;">&nbsp;</a></h4><div class="content" style="padding: 5px 0px 20px;"><table class="table01 __se_tbl_ext" summary="구분, 온라인교육, 오프라인교육을 제공한 표" style="border-spacing: 0px; border-collapse: collapse; clear: both; width: 749.6px; border-top: 2px solid rgb(235, 105, 3);"><caption style="position: absolute; top: 0px; left: -3000px; visibility: hidden; overflow: hidden; line-height: 0px; font-size: 8px; width: 0.75px; height: 0.175px;">&nbsp;</caption><colgroup><col style="width:40%;"><col style="width:30%;"><col style="width:30%;"></colgroup><thead style="margin: 0px; padding: 0px;"><tr><th scope="col" style="width:40%; margin: 0px; padding: 0px; height: 32px; text-align: center; color: rgb(68, 68, 68); border-bottom: 1px solid rgb(216, 216, 216); background: rgb(246, 246, 246); border-right: 1px solid rgb(216, 216, 216);">구분</th><th scope="col" style="width:30%; margin: 0px; padding: 0px; height: 32px; text-align: center; color: rgb(68, 68, 68); border-bottom: 1px solid rgb(216, 216, 216); background: rgb(246, 246, 246); border-right: 1px solid rgb(216, 216, 216);">온라인교육</th><th scope="col" style="width:30%; margin: 0px; padding: 0px; height: 32px; text-align: center; color: rgb(68, 68, 68); border-bottom: 1px solid rgb(216, 216, 216); background: rgb(246, 246, 246);">오프라인교육</th></tr></thead><tbody style="margin: 0px; padding: 0px;"><tr><th scope="row" style="width:40%; margin: 0px; padding: 0px; font-weight: normal; border-bottom: 1px solid rgb(216, 216, 216); text-align: center;">&nbsp;</th><td style="width:30%; margin: 0px; padding: 5px; text-align: center; min-height: 21px; border-bottom: 1px solid rgb(216, 216, 216); border-left: 1px solid rgb(216, 216, 216);">6</td><td style="width:30%; margin: 0px; padding: 5px; text-align: center; min-height: 21px; border-bottom: 1px solid rgb(216, 216, 216); border-left: 1px solid rgb(216, 216, 216);">64</td></tr><tr><th scope="row" style="width:40%; margin: 0px; padding: 0px; font-weight: normal; border-bottom: 1px solid rgb(216, 216, 216); text-align: center;">사전 모듈과정</th><td style="width:30%; margin: 0px; padding: 5px; text-align: center; min-height: 21px; border-bottom: 1px solid rgb(216, 216, 216); border-left: 1px solid rgb(216, 216, 216);">-</td><td style="width:30%; margin: 0px; padding: 5px; text-align: center; min-height: 21px; border-bottom: 1px solid rgb(216, 216, 216); border-left: 1px solid rgb(216, 216, 216);">30(5일)</td></tr><tr><th scope="row" style="width:40%; margin: 0px; padding: 0px; font-weight: normal; border-bottom: 1px solid rgb(216, 216, 216); text-align: center;">몰입식 과정</th><td style="width:30%; margin: 0px; padding: 5px; text-align: center; min-height: 21px; border-bottom: 1px solid rgb(216, 216, 216); border-left: 1px solid rgb(216, 216, 216);">6</td><td style="width:30%; margin: 0px; padding: 5px; text-align: center; min-height: 21px; border-bottom: 1px solid rgb(216, 216, 216); border-left: 1px solid rgb(216, 216, 216);">34(5일)</td></tr></tbody></table></div><span class="btnTop" style="position: absolute; right: 0px; top: 25px;"><a href="http://hrdi.koreatech.ac.kr/info/info2_3.asp#" style="color: rgb(181, 31, 31); text-decoration-line: none; cursor: pointer;"><img src="http://hrdi.koreatech.ac.kr/images/common/btn/btn_top.gif" alt="top" style="border: 0px none;"></a></span></div><div class="infoWrap2" style="position: relative; clear: both; padding-top: 20px;"><h4 class="tit" style="margin: 0px; padding: 0px; height: 35px; clear: both;"><br></h4></div></div></div>

</body>

</html>
