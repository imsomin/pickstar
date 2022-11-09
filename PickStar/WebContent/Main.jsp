<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- Google API 활용하여 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">

<style type="text/css">
    .txt_animate span
    {
     /* font-family: 'Gugi', cursive;  */
	 /* font-family: 'Sunflower', sans-serif;  */
	font-size: 50px;
    font-family: 'Stylish', sans-serif;
    position: relative;
  	top: -180px;
  	left:900px;
    color:white;
    opacity: 0;
    transform: translate(-300px, 0) scale(0);
    animation:txtE 2s infinite;
    }
</style>


<script type="text/javascript">
$(function(){
	$("#Login").click(function(){
		$.ajax({
				type:"POST"
				, url:"Main.jsp"
				, dataType:"html"
				, success:function(data)
				{
					console.log("success");
					console.log(data)
					let url = "LoginForm.jsp";
					console.log(url);
					location.replace(url);
				},
				error: function(request , status, error){
					alert("잘못된 접근입니다.");
				}
		});
	});
});
		
	
$(function(){
	$("#Join").click(function(){
		$.ajax({
				type:"POST"
				, url:"Main.jsp"
				, dataType:"html"
				, success:function(data)
				{
					
					console.log("success");
					console.log(data)
					let url = "JoinForm.jsp";
					console.log(url);
					location.replace(url);
				},
				error: function(request , status, error){
					alert("잘못된 접근입니다.");
				}
		});
	});
});
	
</script>

</head>
<body>

<div class="image">

	<div class="main_box">
		<h1 class="mainh1">Pick<br>Your<br>Star</h1>
		<button type="button" class="main_btn" id="Login" >로그인</button>
		<button type="button" class="main_btn" id="Join" >회원가입</button>

	</div>

<div class="txt_animate">
		<span>별</span> nbsp;<span>주</span><span>우</span><span>러</span>nbsp;<span>갈</span> nbsp;<span>시</span><span>간</span> <br />
	
</div>


</div>

</body>
</html>