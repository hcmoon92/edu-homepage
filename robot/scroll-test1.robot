*** Settings ***
Library  	SeleniumLibrary

Suite Setup    Open Browser    https://champ.tta.or.kr    chrome     options=add_argument('--start-maximized');add_argument('--no-sandbox')


*** Test Cases ***
TC1.1
  Maximize Browser Window
  Go To   https://champ.tta.or.kr/usr/EgovUsrSelectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&baseUsrMenuNo=5&imgNum=1
  Click Link    xpath=//*[contains(text(), 'beacon')]
  ${width}   ${height}=    Get Window Size
  Log   ${width}, ${height}

  ${endScroll} =   Get Scroll Height
  Log   ${endScroll}

  FOR   ${index}   IN RANGE   1   ${endScroll}   ${endScroll}/(${endScroll}/(${height}-200))
    Scroll Page To Location    0  ${index}      
    Sleep  1s
  END

*** Keywords ***
Scroll Page To Location
  [Arguments]    ${x_loc}    ${y_loc}
  Execute JavaScript   window.scrollTo(${x_loc}, ${y_loc});

Get Scroll Height
  ${scrollHeight} =     Execute JavaScript   return document.body.scrollHeight
  RETURN     ${scrollHeight}

