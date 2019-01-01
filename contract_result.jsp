<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp" import="PetKeeper.*"%>
<jsp:useBean id="contract_data" scope="request"
	class="PetKeeper.Contract" />
<jsp:useBean id="pet_data" scope="request" class="PetKeeper.Pet" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<style>
	body {
		background: linear-gradient(to bottom, #E0F8F7, white);
	}

	h3 {
		color: orange;
	}
	</style>

<title>PetKeeper:접수완료</title>
</head>
<body>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<hr>
		<div class="row">
			<div class=col-md-2></div>
			<div class="col-md-8">
				<h2>접수완료</h2>
				<table class="table">
					<tr>
						<th>반려견 이름</th>
						<td><%=pet_data.getName()%></td>
					</tr>
					<tr>
						<th>견종</th>
						<td><%=pet_data.getBreed()%></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><%=pet_data.getAge()%></td>
					</tr>
					<tr>
						<th>성별</th>
						<%if(pet_data.getGender()==0){ %>
						<td>암컷</td>
						<%}else{ %>
						<td>수컷</td>
						<%} %>
					</tr>
					<tr>
						<th>시작 날짜</th>
						<td><%=contract_data.getStart_date()%></td>
					</tr>
					<tr>
						<th>종료 날짜</th>
						<td><%=contract_data.getEnd_date()%></td>
					</tr>
					<tr>
						<%-- 						<%
							if (contract_data.getType() == 1) {
						%>
 --%>
						<th>주소</th>
						<td><%=contract_data.getLocation_user()%></td>
						<%-- 						<%
							}
						%>
 --%>
					</tr>
					<tr>
						<th>요청 사항</th>
						<td><%=contract_data.getEtcs()%></td>
					</tr>
					<tr>
						<td colspan=2><a href="index.jsp"><input
								class="btn btn-default" type=submit value="확인"></a> </td>
					</tr>
				</table>
			</div>
		</div>
		<%if(request.getAttribute("map")!=null){ %>
		<div class="row">
			<div class=col-md-2></div>
			<div class="col-md-8">
				<div id="map" style="width: 100%;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ffc813571c751caaa41dc49e5976113&libraries=services"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다
				var map = new daum.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'<%=contract_data.getLocation_user()%>',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면
									if (status === daum.maps.services.Status.OK) {

										var coords = new daum.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new daum.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new daum.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;"><%=contract_data.getLocation_user()%></div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}else{
									alert("다음 맵에서 해당 주소를 찾을수가 없습니다.");
								}
								});
			</script>
			</div>
			<div class=col-md-2></div>
		</div>
		<%} %>
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
