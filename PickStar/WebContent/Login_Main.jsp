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

<div class="more3">

	<img src="images/moon.png" width="400" height="300" alt="mainmoon"/>
	
	<div>
	어서오세요! 😀👨‍👧‍👧♥  <br>
	PickYourStar는 '환경보호'를 생각하면서 시작되었어요. <br>
	쓰레기가 가득찬 거리, 대기오염으로 인해 또렷하게 밝은 별을 보기 힘들어진 하늘... <br>
	우리들의 힘으로 조금씩이라도 나아지는 방법은 없을까요? <br>
	아주 작은 방법이라도 괜찮아요. 우리 함께 쓰레기를 줍고 맑은 공기를 마시는 날을 그려봐요. <br>
	쓰레기를 하나씩 주으며, 당신의 별이 조금씩 밝아지는 것을 느끼실 수 있으실거예요!<br>
	</div>
	<br><br><br>

</div>
	


</body>
</html>