<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR Code Generator</title>

    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css"
        integrity="sha256-QVBN0oT74UhpCtEo4Ko+k3sNo+ykJFBBtGduw13V9vw=" crossorigin="anonymous" />
    <script src="qrcode.min.js"></script>
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
    <script src="script.js"></script>

</body>

</html>