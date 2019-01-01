<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp" import="PetKeeper.*"%>
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

<title>PetKeeper:펫 추가</title>
</head>
<body>
	<%
		User account = new User();
		if (session.getAttribute("account") == null) {
			response.sendRedirect("login.jsp");
		} else {
			account = (User) session.getAttribute("account");
		}
		String action = request.getParameter("type");
	%>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<hr>
		<div class="row">
			<div class=col-md-2></div>
			<div class="col-md-8">
				<div align="center">
					<h2>펫 추가</h2>
				</div>
				<form name=form method=post action=Servlet>
					<input type="hidden" name="action" value="pet_add"> <input
						type="hidden" name="user_num" value="<%=account.getNum()%>">

					<div class="form-group">
						<label for="exampleInputEmail1">반려견 이름</label> <input type="text"
							name="name" maxlength="30" class="form-control"
							id="exampleInputEmail1" placeholder="반려견 이름">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">견종</label> <input type="text"
							name="breed" maxlength="30" class="form-control"
							id="exampleInputEmail1" placeholder="견종">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">나이</label> <input type="text"
							name="age" class="form-control" maxlength="3"
							id="exampleInputEmail1" placeholder="나이">
					</div>
					<div class="form-group">
					<label for="exampleInputEmail1">성별</label>
					<label class="radio-inline"> <input type="radio"
						name="gender" id="inlineRadio1" value="1">
						수컷
					</label> <label class="radio-inline"> <input type="radio"
						name="gender" id="inlineRadio2" value="0">
						암컷
					</label>
					</div>
					<button type="submit" class="btn btn-primary">제출</button>
					<a href="index.jsp"><input class="btn btn-default"
						type="button" value="취소"> </a>
				</form>
			</div>
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
