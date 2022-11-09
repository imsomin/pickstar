<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

	// 로그인 정보가 없으면 로그인 창으로 쫓아내는 코드
	if(session.getAttribute("email")==null)
	{
		response.sendRedirect("Logout.jsp");
	}

%>
<jsp:include page="./header.jsp" flush="true"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_Main</title>
<!-- <link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/more.css">

<!-- jquery 활용-->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript"></script>
</head>
<body>
	<!-- <p>😊<p> -->
	
<div class="box_wrap">
	<div class="box">
	<h3>Community😊</h3>
	
	<!-- <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd"> -->
	<table border="2" align="center">
		<tr>
			<th style="background-color: #eeeee; text-align: center;">번호</th>
			<th style="background-color: #eeeee; text-align: center;">제목</th>
			<th style="background-color: #eeeee; text-align: center;">작성자</th>
			<th style="background-color: #eeeee; text-align: center;">작성일</th>
			<th style="background-color: #eeeee; text-align: center;">조회수</th>
		</tr>
		
		<%-- <c:if test="${empty list }">  --%>
			<!-- <tr align="center">
				<td colspan="5">작성된 글이 없습니다.</td>
			</tr> -->
		<%-- </c:if> --%>
		<%-- <c:if test="${list != null }">
			<c:forEach var="i" items="${list }"> --%>
				<tr align="center">
					<%-- <td>${i.b_num }</td>
					<td>${i.b_subject }</td>
					<td>${i.b_writer }</td>
					<td>${i.b_date }</td>
					<td>${i.b_readcount }</td> --%>
					<td>1</td>
					<td>제주에서 줍깅해요</td>
					<td>돌하르방</td>
					<td>22.11.9</td>
					<td>6</td>
				</tr>
		<%-- </c:forEach>
		</c:if> --%>


		 <tr>
		 	<td colspan="5">
		 	 <form action="" method="post">
		 			<select name="part">
		 				<option value="b_subject">제목</option>
		 				<option value="b_content">내용</option>
		 				<option value="b_writer">작성자</option>
		 			</select>
		 			<input type="text" name="searchData" required="required"/>
		 			<input type="submit" value="검색" /> 
		 			<input type="button" value="글쓰기" onclick="location.href=''"/> 
		 	</form> 
		 	</td>
		 </tr>
		 
	</table>
</div>
</div>




	

</body>
</html>