<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"
	import="PetKeeper.*, java.util.*"%>
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

<title>PetKeeper:돌봄일지 작성</title>
</head>
<body>
	<%
		User account = new User();
		Beans gb = new Beans();
		if (session.getAttribute("account") == null) {
			response.sendRedirect("login.jsp");
		} else {
			account = (User) session.getAttribute("account");
			int contract_num = Integer.parseInt(request.getParameter("contract_num"));
			int pet_num= Integer.parseInt(request.getParameter("pet_num"));
	%>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>돌봄일지 작성</h2>
				<%
					if (request.getParameter("fail") != null) {
				%>
				<script>
					alert("돌봄일지 작성 실패.");
				</script>
				<%
					}
				%>
				<form name=form method=post enctype="multipart/form-data" action="Servlet">
					<input type="hidden" name="action" value="diary_add">
					<input type="hidden" name="contract_num" value="<%=contract_num%>">
					<input type="hidden" name="pet_num" value="<%=pet_num%>">
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> <input type="text"
							name="title" maxlength="50" class="form-control"
							id="exampleInputEmail1" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="exampleInputFile">사진 업로드</label> <input type="file"
							name="image" id="exampleInputFile">
					</div>
					<div class="form-group">
					<textarea name="text" class="form-control" rows="5"></textarea>
					</div>
							<input type="submit" class="btn btn-primary" value="제출">
							<input onclick="history.go(-1);" class="btn btn-default"
								type="button" value="취소">

				</form>
			</div>
			<div class="col-md-2"></div>
			<%
				}
			%>
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
