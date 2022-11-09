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
<jsp:include page="./header.jsp" flush="true">
<jsp:param value="email" name="email"/>

</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Login_Contact</title>
<!-- <link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/more.css">


<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript"></script>
</head>
<body>

<!-- <h1 class="contact_h1">Contact</h1> -->

<div class="more1">
<h2>👧Contact!🧑</h2>
        <hr>
			<form action="Login_Contact.jsp" method="post" name="" >  
				🎈 닉네임 
				<input type="text" placeholder="닉네임" id="" value ="" class="txt" style="width:10%;"/><br />
				🎈‍ 이메일
				<input type="text" placeholder="이메일" id="" value ="" class="txt" style="width:10%;"/><br />
				
			<textarea class="txarea" cols="30" rows="10" placeholder="내용" style=" resize: none;"></textarea>	
			<br />


			<button type="submit" style="background-color: white"> 제출하기 </button>
	 		<button type="reset" style="background-color: white"> 취소하기</button>
	
			<br /><br />
			
		
			</form>
		</hr>
</div>
</body>
</html>