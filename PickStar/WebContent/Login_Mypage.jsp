<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
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
<title>Login_Mypage</title>
<link rel="stylesheet" type="text/css" href="css/login.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript"></script>
</head>
<body>
<div class="mypage">
     <%= request.getParameter("email") %> 님의 인증 횟수 :      <br />
    	
        
        <progress class="progressbar" value="10" max="50"></progress> <br/>
   	
   		<div style="display:inline;" class="star0">★&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div style="display:inline;" class="star10">★&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div style="display:inline;" class="star20">★&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div style="display:inline;" class="star30">★&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div style="display:inline;" class="star40">★&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div style="display:inline;" class="star50">★</div>
        
        <br />
        0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        30&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        40&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        50
	      
        
        <br />

      
    현재   <%= email %>님은  별에 살고 계십니다.   <br />
</div>    
 
<div class="box">
	아이디(이메일) : <%= email %> <br />
	닉네임 :		<br />
	생년월일 :		<br />


</div>

<div class="btn_mypage">
	<input type="button" class="btn_mp" value="정보수정 "> 
	<input type="button" class="btn_mp" value="회원탈퇴">
</div>
    
</body>
</html>