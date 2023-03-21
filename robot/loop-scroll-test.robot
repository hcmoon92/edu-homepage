*** Settings ***
Library  	SeleniumLibrary

Suite Setup    Open Browser    https://champ.tta.or.kr    chrome

Test Teardown    Go To Beacon Page 

*** Test Cases ***

TC 1.1
  Repeat Keyword   5     Open Beacon Notice

*** Keywords ***
Go To Beacon Page
  Go To   https://champ.tta.or.kr/usr/EgovUsrSelectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&baseUsrMenuNo=5&imgNum=1
  Click Link    xpath=//*[contains(text(), 'beacon')]

Scroll Page To Location
  [Arguments]    ${x_loc}    ${y_loc}
  Execute JavaScript   window.scrollTo(${x_loc}, ${y_loc});

Get Scroll Height
  ${scrollHeight} =     Execute JavaScript   return document.body.scrollHeight
  RETURN     ${scrollHeight}

Open Beacon Notice
  Maximize Browser Window
  Go To Beacon Page

  ${width}   ${height}=    Get Window Size
  Log   ${width}, ${height}

  ${endScroll} =   Get Scroll Height
  Log   ${endScroll}

  FOR   ${index}   IN RANGE   1   ${endScroll}   ${endScroll}/(${endScroll}/(${height}-200))
    Scroll Page To Location    0  ${index}      
    Sleep  1s
  END

