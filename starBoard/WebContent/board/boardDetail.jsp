<%@page import="com.sm.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
pageContext.setAttribute("enter", "\r\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<title>Board Detail</title>
<script type="text/javascript">
function fnDelete(b_pwd) {
	var user_pwd = document.detailForm.user_pwd.value;
	alert("User PW : " + user_pwd + "\nDB PW : " + b_pwd);
	
	if(user_pwd == "") {			//비밀번호 미입력
		alert("비밀번호를 입력하세요!");
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else if(user_pwd != b_pwd) {	//비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!")
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else {						//비밀번호 일치
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "boardDelete.do?b_num=" + ${dto.b_num 	};
		} else {
			document.detailForm.user_pwd.value = "";
			document.detailForm.user_pwd.focus();
		}
	}
}
function fnUpdate(b_pwd) {
	var user_pwd = document.detailForm.user_pwd.value;
	alert("User PW : " + user_pwd + "\nDB PW : " + b_pwd);
	
	if(user_pwd == "") {			//비밀번호 미입력
		alert("비밀번호를 입력하세요!");
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else if(user_pwd != b_pwd) {	//비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!")
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else {						//비밀번호 일치
		location.href = "boardUpdateForm.do?b_num=" + ${dto.b_num };
	}
}
</script>
</head>
<body>


<div align="center">
	<h3> 🎉 작성글 내용 🎊 </h3>
	<table border="1" style="width: 80%;">
		<tr>
			<th style="background-color: #eeeee; text-align: center;">작성자</th>
			<td>${dto.b_writer }</td>
			<th style="background-color: #eeeee; text-align: center;">조회수</th>
			<td align="center">${dto.b_readcount }</td>
		</tr>
		<tr>
			<th style="background-color: #eeeee; text-align: center;">제목</th>
			<td colspan="3">${dto.b_subject }</td>			
		</tr>
		<tr>
			<th style="background-color: #eeeee; text-align: center;">내용</th>
			
			<td colspan="3">
				${fn : replace(dto.b_content, enter, "<br />") }
				<!-- fn:replace(string, before, after) -->
				<!-- string내에 있는 before 문자열을 after 문자열로 반환함을 의미  -->
			</td>
		</tr>
		<tr>
			<th style="background-color: #eeeee; text-align: center;">비밀번호</th>
			<td colspan="3">
				<form name="detailForm" onsubmit="return false" >
					<input type="password" name="user_pwd"/>
					<input type="button" value="삭제" onclick="fnDelete('${dto.b_pwd}')"/>
					<input type="button" value="수정" onclick="fnUpdate('${dto.b_pwd}')"/>
					<input type="button" value="글 목록" onclick="location.href='boardList.do'"/>				 
				</form>
			</td>
		</tr>
	</table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 



</body>
</html>