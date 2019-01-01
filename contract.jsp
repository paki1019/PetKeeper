<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"
	import="PetKeeper.*,java.util.*"%>
<%
	User account = new User();
	if (session.getAttribute("account") == null) {
		response.sendRedirect("login.jsp");
	} else {
		account = (User) session.getAttribute("account");
		String action = request.getParameter("type");
		ArrayList<Pet> datas = (ArrayList<Pet>) request.getAttribute("datas");
%>
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
<%
	if(request.getParameter("error")!=null){
		%><script>alert("주소확인을 하지 않으셨습니다.");</script><%
	}
	if (action.equals("put")) {
%>
<title>PetKeeper:맡기기</title>
<%
	} else {
%>
<title>PetKeeper:부르기</title>
<%
	}
%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ffc813571c751caaa41dc49e5976113&libraries=services"></script>
<script type="text/javascript">
	function fnAppendHidden(p_form) {
		if (!p_form)
			return;
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch(p_form.location.value, function(result, status) {
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				var o_hidden1 = document.createElement("input");
				var o_hidden2 = document.createElement("input");
				o_hidden1.type = "hidden";
				o_hidden1.name = "location_user_x";
				o_hidden2.type = "hidden";
				o_hidden2.name = "location_user_y";
				var x = result[0].x;
				var y = result[0].y;
				o_hidden1.value = x;
				o_hidden2.value = y;
				p_form.appendChild(o_hidden1);
				p_form.appendChild(o_hidden2);
				p_form.address_check.style="color=red";
				alert("적절한 주소입니다: " + p_form.location.value);
			}else{
				alert("적절하지 않은 주소입니다, 다음과 같이 입력해주세요 (예: 복대동 2282)");
				return;
			}
		});
	}
</script>

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
				<div align="center">
					<%
						if (action.equals("put")) {
					%>
					<h2>돌보미 집에 맡기기</h2>
					<%
						} else {
					%>
					<h2>집으로 돌보미 부르기</h2>
					<%
						}
					%>

				</div>
				<form name=form method=post action=Servlet>
					<input type="hidden" name="action" value="<%=action%>"> <input
						type="hidden" name="user_num" value="<%=account.getNum()%>">

					<div class="form-group">
						<label for="exampleInputEmail1">반려견</label> <select
							class="form-control" name="pet_num">
							<option value="">반려견 선택</option>
							<%
								for (Pet pet : datas) {
							%>
							<option value="<%=pet.getNum()%>"><%=pet.getName()%></option>
							<%
								}
							%>
						</select> <a href="pet_add.jsp"><input class="btn btn-primary"
							type="button" value="반려견 추가하기"> </a>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">시작 날짜</label> <input type="date"
							name="start_date" class="form-control" id="exampleInputEmail1"
							placeholder="시작 날짜">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">종료 날짜</label> <input type="date"
							name="end_date" class="form-control" id="exampleInputEmail2"
							placeholder="시작 날짜">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">주소</label> <input type="text"
							name="location" maxlength="50" class="form-control"
							id="exampleInputEmail5" placeholder="주소">
					<input type="button" name="address_check"
					 onclick="fnAppendHidden(document.form);" class="btn btn-default" value="주소확인">
					 (가장 가까운 돌보미 매칭을 위해 주소확인을 해주세요.)
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">요청 사항</label>
						<textarea name="etcs" class="form-control" rows="5"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">제출</button>
					<a href="index.jsp"><input class="btn btn-default"
						 type="button" value="취소"></a>
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
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
