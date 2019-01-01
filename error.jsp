<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	<div align="center">
		<h2>에러</h2>
		<hr>
		<table cellpadding=5 width=400>
			<tr width="100%" bgcolor="yellow">
				<td>요청 처리중 에러가 발생했습니다.<br>관리자에게 문의해 주세요
					<hr>에러내용 : <%=request.getAttribute("exception")%><hr></td>
			</tr>
		</table>
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
