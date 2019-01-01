<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
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

<title>PetKeeper:로그인</title>
</head>
<body>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<hr>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div align="center">
					<h2>로그인</h2>
				</div>
				<%
					if (request.getParameter("fail") != null) {
				%>
				<script>alert("로그인 실패: 아이디 혹은 패스워드가 틀렸습니다.");</script>
				<%
					}
				%>
				<form name=form method=post action=Servlet>
					<input type="hidden" name="action" value="login">
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
					<div class="row">
						<div class="col-md-4">
							<button type="submit" class="btn btn-primary">로그인</button>
							<a href="index.jsp"><input class="btn btn-default"
								type="button" value="취소"></a><br>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-4">
							아직 계정이 없으십니까? <a href="sign.jsp">가입하기</a><br>
						</div>
					</div>
			</div>
			</form>
			<div class="col-md-2"></div>
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
