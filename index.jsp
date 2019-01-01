<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PetKeeper</title>
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
	<%
		if (request.getParameter("logout") != null) {
	%><script>
		alert("로그아웃 되었습니다!");
	</script>
	<%
		}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
			</div>
			<%
				if (session.getAttribute("account") == null) {
			%>
			<div class="col-mde-3" align=center>
				<a href="login.jsp">
					<button class="btn btn-primary" style="margin-top: 20px">로그인</button>
				</a> <a href="sign.jsp"><button class="btn btn-primary"
						style="margin-top: 20px">회원가입</button></a>
						<a href="sign_admin.jsp"><button class="btn btn-warning"
						style="margin-top: 20px">돌보미 회원가입</button></a>
			</div>
			<%
				} else {
			%>

			<div class="col-mde-2" align=center>
				<a href="Servlet?action=mypage"><button class="btn btn-primary"
						style="margin-top: 20px">마이페이지</button></a> <a
					href="Servlet?action=logout">
					<button class="btn btn-primary" style="margin-top: 20px">로그아웃</button>
				</a>
			</div>
			<%
				}
			%>
		</div>
		<hr style="border: 1px solid #D8D8D8;">
		<div class="row">
			<div class="col-md-6" style="padding-right: 0px; padding-left: 0px;">
				<a href="Servlet?action=contract&type=put"><button id="mainbtn1">
						<img src="photo/a1.jpg" width="100%" height="100%" class="img-responsive">
					</button></a>
			</div>
			<div class="col-md-6" style="padding-right: 0px; padding-left: 0px;">
				<a href="Servlet?action=contract&type=call">
					<button id="mainbtn2">
						<img src="photo/a2.jpg" width="100%" height="100%" class="img-responsive">
					</button>
				</a>
			</div>
		</div>
		<div class="row" align=center>
			<br />
			<h1>펫시터 서비스 소개</h1>
			<br /> <br />
		</div>
		<div class="row" align=center>
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<img src="photo/a3.jpg" width=50% height=50%>
				<h3>엄선된 돌보미</h3>
				<p>
					펫키퍼에서 직접 검증한<br />내 주변의 믿을 수 있는 돌보미를 만나보세요!
				</p>
			</div>
			<div class="col-md-5">
				<img src="photo/a4.jpg" width=50% height=50%>
				<h3>오직 한마리!</h3>
				<p>
					한가정의 강아지만 맡기 때문에<br />내 반려견을 위한 맞춤 돌봄을 경험해보세요!
				</p>
				<br /> <br /> <br /> <br />
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row" align=center>
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<img src="photo/a5.jpg" width=50% height=50%>
				<h3>안심 서비스</h3>
				<p>
					1일 1회 산책은 기본! 떨어져 있어도 걱정 No!<br />사진 전송 서비스로 내 반려견을 확인할 수 있습니다.
				</p>
			</div>
			<div class="col-md-5">
				<img src="photo/a6.jpg" width=50% height=50%>
				<h3>돌봄일지</h3>
				<p>
					내가 없는 동안 반려견이 어떻게 지냈는지<br />알 수 있도록 매일 매일 돌봄일지를 작성합니다.
				</p>
				<br /> <br />
			</div>
			<div class="col-md-1"></div>
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