*** Settings ***
Library         SeleniumLibrary

Suite Setup    Open Browser    https://champ.tta.or.kr/usr/EgovUsrSelectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA&baseUsrMenuNo=5&imgNum=1    chrome     options=add_argument('--start-maximized');add_argument('--no-sandbox');add_argument('--kiosk');add_argument('--disable-infobars')

*** Test Cases ***
Find Beacon Notice
    Go To Beacon Notice

Run Kiosk Mode
  FOR  ${count}   IN RANGE  0   5000
    Scroll Page Of Beacon Notice
  END

*** Keywords ***
Go To Beacon Notice
  Click Link    xpath=//*[contains(text(), 'beacon')]

Scroll Page Of Beacon Notice
  ${width}   ${height}=    Get Window Size
  Log   ${width}, ${height}

  ${endScroll} =   Get Scroll Height
  Log   ${endScroll}

  FOR   ${index}   IN RANGE   380   ${endScroll}   ${endScroll}/(${endScroll}/(${height}-200))
    Scroll Page To Location    130  ${index}
    Sleep  5s
  END
  Scroll Page To Location     130     380

Scroll Page To Location
  [Arguments]    ${x_loc}    ${y_loc}
  Execute JavaScript   window.scrollTo(${x_loc}, ${y_loc});

Get Scroll Height
  ${scrollHeight} =     Execute JavaScript   return document.body.scrollHeight
  RETURN     ${scrollHeight}
