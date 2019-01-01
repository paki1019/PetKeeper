<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"
	import="PetKeeper.*,java.util.*"%>
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

<title>PetKeeper:마이페이지_관리자</title>
</head>
<body>
	<%
		User account = new User();
		Beans gb = new Beans();
		if (session.getAttribute("account") == null) {
			response.sendRedirect("login.jsp");
		} else {
			account = (User) session.getAttribute("account");
			ArrayList<Contract> datas = (ArrayList<Contract>) request.getAttribute("datas");
			ArrayList<Contract> datass = (ArrayList<Contract>) request.getAttribute("datass");
	%>
	<div class="container">
		<h1><a href="index.jsp" style="color: black; text-decoration: none;"><img src="photo/PETfont.png" width=100px height=40px style="margin-bottom: 10px;"><strong>Keeper</strong></a></h1>
		<div class="row">
			<h2>접수 대기중인 계약</h2>
			<table class="table" style="width: 100%; height: 100%;">
				<tr>
					<th>반려견 이름</th>
					<th>견종</th>
					<th>나이</th>
					<th>성별</th>
					<th>맡기기/부르기</th>
					<th>시작 날짜</th>
					<th>종료 날짜</th>
					<th>주소</th>
					<th>주소확인</th>
					<th>요청사항</th>
					<th>접수하기</th>
				</tr>
				<%
					for (Contract contract : datas) {
							Pet pet = gb.doPetRead(contract.getPet_num());
				%>
				<tr>
					<td><%=pet.getName()%></td>
					<td><%=pet.getBreed()%></td>
					<td><%=pet.getAge()%></td>
					<td><%=pet.getGender()%></td>
					<%
						if (contract.getType() == 0) {
					%>
					<td>맡기기</td>
					<%
						} else {
					%>
					<td>부르기</td>
					<%
						}
					%>
					<td><%=contract.getStart_date() %></td>
					<td><%=contract.getEnd_date() %></td>
					<%if(contract.getType()==0){ %>
					<td>접수대기중</td>
					<td>접수대기중</td>
					<%}else{ %>
					<td><%=contract.getLocation_user() %></td>
					<td><a href="location_check.jsp?location=<%=contract.getLocation_user()%>&x=<%=contract.getLocation_user_x()%>&y=<%=contract.getLocation_user_y() %>"><button class="btn btn-default">주소확인</button></a></td>
					<%} %>
					<td width=200px><%=contract.getEtcs() %></td>
					<td><a href="Servlet?action=receipt&num=<%=contract.getNum()%>"><button class="btn btn-primary">접수하기</button></a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<hr>
		<div class="row">
			<h2>내 계약</h2>
			<table class="table">
				<tr>
					<th>반려견 이름</th>
					<th>견종</th>
					<th>나이</th>
					<th>성별</th>
					<th>맡기기/부르기</th>
					<th>시작 날짜</th>
					<th>종료 날짜</th>
					<th>주소</th>
					<th>주소확인</th>
					<th>요청사항</th>
					<th>작성하기</th>
				</tr>
				<%
					for (Contract contract : datass) {
							Pet pet = gb.doPetRead(contract.getPet_num());
				%>
				<tr>
				<%if(contract.getReceipt()==1){ %>
					<td><a href="Servlet?action=diary&id=<%=contract.getNum()%>"><%=pet.getName()%></a></td>
					<%}else{ %>
					<td><%=pet.getName() %></td>
					<%} %>
					<td><%=pet.getBreed()%></td>
					<td><%=pet.getAge()%></td>
					<td><%=pet.getGender()%></td>
					<%
						if (contract.getType() == 0) {
					%>
					<td>맡기기</td>
					<%
						} else {
					%>
					<td>부르기</td>
					<%
						}
					%>
					<td><%=contract.getStart_date() %></td>
					<td><%=contract.getEnd_date() %></td>
					<td><%=contract.getLocation_user() %></td>
					<td><a href="location_check.jsp?location=<%=contract.getLocation_user()%>&x=<%=contract.getLocation_user_x()%>&y=<%=contract.getLocation_user_y() %>"><button class="btn btn-default">주소확인</button></a></td>
					<td width=200px><%=contract.getEtcs() %></td>
					<td><a href="diary_add.jsp?contract_num=<%=contract.getNum()%>&pet_num=<%=contract.getPet_num()%>"><button class="btn btn-primary">작성하기</button></a></td>
				</tr>
				<%
					}
				%>
			</table>
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
