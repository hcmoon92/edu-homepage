<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>QR Sanner(RPI)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="instascan.min.js"></script>

    <style>
        #preview{
           //width: 100;
           height: 400px;
           margin:0px auto;
        }
        .scanner {
            width: 620px;
            border: 1px solid;
            padding: 50px;
            margin:0 auto;
            text-align: left;
        }
        .banner {
            height: 180px;
            border: 1px solid;
            margin:0 auto;
            text-align: left;

        }    
        .bar {
            //margin-top: 100px;
            margin:0 auto;
            //height: 30px;
            border: 2px solid;
            text-align: left;
            font-size: 20px;   
            color: blue;
          }                   
        </style>
  </head>
  <body>
    <table><tr><td>
      <div>
      <h1 style="color:red;font-size:50px;">  https://edu.tta.or.kr/info/ <h1>
      <h1 style="color:blue;font-size:50px;"> phone number (4 digit)  </h1>
      <br><img width=128px src=qr.png><img width=128px src=right-arrow.png></div>
      </div>
    </td><td>
    <div class="scanner">
      <video id="preview"></video>
      <br><br>
      <div id="result">QR Scanner Ready !!!</div>
    </div>
    </td>
    </tr></table>
    <script type="text/javascript">
    $(document).ready(function() { 

    let opts = {
        // Whether to scan continuously for QR codes. If false, use scanner.scan() to manually scan.
        // If true, the scanner emits the "scan" event when a QR code is scanned. Default true.
        continuous: true,
        
        // The HTML element to use for the camera's video preview. Must be a <video> element.
        // When the camera is active, this element will have the "active" CSS class, otherwise,
        // it will have the "inactive" class. By default, an invisible element will be created to
        // host the video.
        video: document.getElementById('preview'),
        
        // Whether to horizontally mirror the video preview. This is helpful when trying to
        // scan a QR code with a user-facing camera. Default true.
        mirror: true,
        
        // Whether to include the scanned image data as part of the scan result. See the "scan" event
        // for image format details. Default false.
        captureImage: false,
        
        // Only applies to continuous mode. Whether to actively scan when the tab is not active.
        // When false, this reduces CPU usage when the tab is not active. Default true.
        backgroundScan: true,
        
        // Only applies to continuous mode. The period, in milliseconds, before the same QR code
        // will be recognized in succession. Default 5000 (5 seconds).
        refractoryPeriod: 5000,
        
        // Only applies to continuous mode. The period, in rendered frames, between scans. A lower scan period
        // increases CPU usage but makes scan response faster. Default 1 (i.e. analyze every frame).
        scanPeriod: 1
        };


      let scanner = new Instascan.Scanner(opts);

      Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
          scanner.start(cameras[0]);
        } else {
          console.error('No cameras found.');
        }
      }).catch(function (e) {
        console.error(e);
      });

      scanner.addListener('scan', function (content) {
        var timeStamp = new Date();
        $('#result').html('<font color=blue>'+timeStamp+'updated'+'</font>');
        scanUpdate( content );
        console.log( content );

        setTimeout(clearResult, 3000);

      });

      function scanUpdate( content ) {
        $.ajax({
          url: "../attend/update-attend.jsp",
          type: 'POST',
          data: { scanData : content },
          success: function (data) {
          }
        });
      }

      function clearResult() {
        $('#result').html('QR Scanner Ready !!!');
      }

    });

    </script>
  </body>
</html>