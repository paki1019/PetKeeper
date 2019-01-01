<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
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

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ffc813571c751caaa41dc49e5976113&libraries=services"></script>
<script type="text/javascript">
	function fnAppendHidden(p_form) {
		if (!p_form)
			return;
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch(p_form.address.value, function(result, status) {
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				var o_hidden1 = document.createElement("input");
				var o_hidden2 = document.createElement("input");
				o_hidden1.type = "hidden";
				o_hidden1.name = "location_x";
				o_hidden2.type = "hidden";
				o_hidden2.name = "location_y";
				var x = result[0].x;
				var y = result[0].y;
				console.log(result[0].x);
				console.log(result[0].y);
				o_hidden1.value = x;
				o_hidden2.value = y;
				p_form.appendChild(o_hidden1);
				p_form.appendChild(o_hidden2);
				alert("적절한 주소입니다: " + p_form.address.value);
			} else {
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

<title>PetKeeper:돌보미 회원가입</title>
</head>
<body>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<hr>
		<div class="row">
			<div class=col-md-2></div>
			<div class="col-md-8">
				<div align="center">
					<h2>돌보미 회원가입</h2>
				</div>
				<%
					if (request.getParameter("fail") != null) {
						int fail = Integer.parseInt(request.getParameter("fail"));
						if (fail == 1) {
				%>
				<script>
					alert("회원가입 실패: 아이디 중복");
				</script>
				<%
					} else if (fail == 2) {
				%>
				<script>
					alert("회원가입 실패: 패스워드 확인 불일치");
				</script>
				<%
					} else if (fail == 3) {
				%>
				<script>
					alert("회원가입 실패: 주소 미확인");
				</script>
				<%
					}
					}
				%>
				<form name=form method=post action=Servlet>
					<input type="hidden" name="action" value="sign_admin">
					<div class="form-group">
						<label for="exampleInputEmail1">아이디</label> <input type="text"
							name="id" maxlength="30" class="form-control"
							id="exampleInputEmail1" placeholder="아이디를 입력하세요">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">패스워드</label> <input
							type="password" name="password" maxlength="30"
							class="form-control" id="exampleInputPassword1"
							placeholder="패스워드">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">패스워드 확인</label> <input
							type="password" name="password_check" maxlength="30"
							class="form-control" id="exampleInputPassword1"
							placeholder="패스워드 확인">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">전화번호</label> <input type="text"
							name="phone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}"
							maxlength="20" class="form-control" id="exampleInputEmail1"
							placeholder="전화번호:(010-0000-0000)">

					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">주소</label> <input type="text"
							name="address" maxlength="50" class="form-control"
							id="exampleInputEmail1" placeholder="주소"> <input
							type="button" onclick="fnAppendHidden(document.form);"
							class="btn btn-default" value="주소확인">
					</div>
					<button type="submit" class="btn btn-primary">회원가입</button>
					<a href="index.jsp"><input class="btn btn-default"
						type="button" value="취소"> </a>
				</form>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<!--  div -->
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
