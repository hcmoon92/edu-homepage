*** Settings ***
Library  	SeleniumLibrary

Suite Setup    Open Browser    https://champ.tta.or.kr    chrome

*** Test Cases ***
TC1.1
  Go To    https://champ.tta.or.kr/usr/EgovUsrSelectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&baseUsrMenuNo=5&imgNum=1 
  Sleep  3
  Maximize Browser Window
  Execute JavaScript   window.scrollTo(0, document.body.scrollHeight);
