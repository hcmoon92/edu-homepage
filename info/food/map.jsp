<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao .. ....</title>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12c27b29c7094998870d65adc061244f&libraries=services"></script>
	<script>
<% 
String x = request.getParameter("x"); 
String y = request.getParameter("y"); 
String name = request.getParameter("name"); 
String addr = request.getParameter("addr"); 
%>
		var container = document.getElementById('map');
		var options = {
		center: new kakao.maps.LatLng(<%=x%>,<%=y%>),
		level: 3
		};

		var map = new kakao.maps.Map(container, options);

// ... ... ..... 
//var markerPosition  = new kakao.maps.LatLng(<%=x%>,<%=y%> ); 
//var marker = new kakao.maps.Marker({
//    position: markerPosition
//});
// ... .. .. ..... .....
//marker.setMap(map);

// ..-.. .. ... .....
var geocoder = new kakao.maps.services.Geocoder();

// ... ... .....
geocoder.addressSearch("<%=addr%>", function(result, status) {

    // ..... ... ..... 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // ..... .. ... ... .....
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // ...... ... .. ... .....
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:250px;text-align:center;padding:6px 0;"><a href=https://map.kakao.com/?q=<%=name%>><%=name%><a></div>'
        });
        infowindow.open(map, marker);

        // ... ... ..... .. ... ......
        map.setCenter(coords);
    } 
});    

// .. ... ..... .. ... ... . .. .... .... .....
var mapTypeControl = new kakao.maps.MapTypeControl();

// ... .... .... .... .....
// kakao.maps.ControlPosition. .... ... ... ..... TOPRIGHT. ... .. .....
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// .. .. ... ... . ..  . .... .....
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>
addr: <%=addr%>
</body>
</html>
