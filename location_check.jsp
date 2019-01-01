<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"
	import="PetKeeper.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 합쳐지고 최소화된 최신 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>PetKeeper:지도 확인</title>
<%
	Double x = Double.parseDouble(request.getParameter("x"));
	Double y = Double.parseDouble(request.getParameter("y"));
	String location = request.getParameter("location");
%>

<style>
body {
	background: linear-gradient(to bottom, #E0F8F7, white);
}

h3 {
	color: orange;
}
</style>

</head>
<body>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<hr>
		<div class="row">
			<div class=col-md-2></div>
			<div class="col-md-8">
				<h2>주소확인</h2>
				<div id="map" style="width: 100%; height: 500px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ffc813571c751caaa41dc49e5976113"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					mapOption = {
						center : new daum.maps.LatLng(
				<%=y%>
					,
				<%=x%>
					), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new daum.maps.Map(mapContainer, mapOption);

					// 마커가 표시될 위치입니다
					var markerPosition = new daum.maps.LatLng(
				<%=y%>
					,
				<%=x%>
					);

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						position : markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);


  					var iwContent = '<div style="padding:5px;"><%=location%></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
  				    iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다


					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
						position : iwPosition,
						content : iwContent
					});

					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker);
				</script>
				<input class="btn btn-default" type="button" value="확인"
					onclick="history.go(-1)">
			</div>
			<div class=col-md-2></div>
		</div>
	</div>
	<br /><br /><hr style="border: 1px solid #D8D8D8;">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-3">
			<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
			<br /> <br /> <br />
		</div>
		<div class="col-md-6">
			<p>
				<strong>상호명</strong> : PetKeeper<br /> <strong>대표</strong> : 오수빈
				이진호<br /> <strong>주소</strong> : 충북대학교 소프트웨어학과<br /> <strong>고객센터</strong>
				: 010-8570-3681
		</div>
	</div>
</body>
</html>
