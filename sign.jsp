<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
body {
	background: linear-gradient(to bottom, #E0F8F7, white);
}

h3 {
	color: orange;
}
</style>

<title>PetKeeper:회원가입</title>
</head>
<body>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<hr>
	<div class="row">
	<div class=col-md-2></div>
	<div class="col-md-8" >
	<div align="center">
		<h2>회원가입</h2>
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
			}
			}
		%>
<form name=form method=post action=Servlet>
			<input type="hidden" name="action" value="sign">
  <div class="form-group">
    <label for="exampleInputEmail1">아이디</label>
    <input type="text" name="id" maxlength="30" class="form-control" id="exampleInputEmail1" placeholder="아이디를 입력하세요">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">패스워드</label>
    <input type="password" name="password" maxlength="30" class="form-control" id="exampleInputPassword1" placeholder="패스워드">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">패스워드 확인</label>
    <input type="password" name="password_check" maxlength="30" class="form-control" id="exampleInputPassword1" placeholder="패스워드 확인">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">전화번호</label>
    <input type="text" name="phone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="20" class="form-control" id="exampleInputEmail1" placeholder="전화번호:(010-0000-0000)">
  </div>
  <button type="submit" class="btn btn-primary">회원가입</button>
  <a href="index.jsp"><input class="btn btn-default" type="button" value="취소">
</a>
</form>
<div class="col-md-2"></div>
</div>
</div>
</div> <!--  div -->
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
