*** Settings ***
Library  	SeleniumLibrary

Suite Setup    Open Browser    https://champ.tta.or.kr    chrome

*** Test Cases ***
TC1.1
  FOR  ${index}  IN RANGE   10
  Sleep    5
  Go To    https://champ.tta.or.kr/usr/EgovUsrSelectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&baseUsrMenuNo=5&imgNum=1 
  END
