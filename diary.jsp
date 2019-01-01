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

<title>PetKeeper:돌봄일지</title>
</head>
<body>
	<%
		User account = new User();
		Beans gb = new Beans();
		if (session.getAttribute("account") == null) {
			response.sendRedirect("login.jsp");
		} else {
			account = (User) session.getAttribute("account");
			ArrayList<Diary> datas = (ArrayList<Diary>) request.getAttribute("datas");
			Contract contract_data = (Contract)request.getAttribute("contract_data");
			Pet pet_data = (Pet)request.getAttribute("pet_data");
			int count = 0;
	%>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-7">
				<h2>돌봄일지</h2>
				<table class="table" style="width: 100%; height: 100%;">
				<%
					for (Diary diary : datas) {
				%>
				<tr><td><%=diary.getTitle()%></td></tr>
				<tr><td><%=diary.getTime() %></td></tr>
				<tr><td><img src="<%=diary.getPhoto() %>" width=400px heigh=300px></td></tr>
				<tr><td><%=diary.getText()%></td></tr>
				<%
					count++;
						}
				if(count==0){
				%>작성된 돌봄일지가 없음 <%
				}
				%>
				</table>
			</div>
			<div class="col-md-3">
				<h2>반려견 프로필</h2>
				<table class="table">
				<tr>
				<th>반려견 이름</th>
				<td><%=pet_data.getName() %></td>
				</tr>
				<tr>
				<th>견종</th>
				<td><%=pet_data.getBreed() %></td>
				</tr>
				<tr>
				<th>나이</th>
				<td><%=pet_data.getAge() %></td>
				</tr>
				<tr>
				<th>성별</th>
				<td><%=pet_data.getGender() %></td>
				</tr>
				</table>
				<h2>요청사항</h2>
				<div><%=contract_data.getEtcs() %></div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<%
			}
		%>
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
