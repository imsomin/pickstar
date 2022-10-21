<%@page import="com.sm.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
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


<title>Board Update Form</title>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("정말 수정 하시겠습니까?")) {
		return true;
	}
	return false;
}
function fnReset() {
	if(confirm("정말 초기화 하시겠습니까?")) {
		return true;
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
	<h3> 🎈 작성글 수정하기 🎆 </h3>
	<form action="boardUpdate.do" method="post" onsubmit="return fnSubmit()" onreset="return fnReset()">
	<input type="hidden" name="b_num" value="${dto.b_num }"/>
		<table border="1" style="width: 80%;">
			<tr>
				<th style="background-color: #eeeee; text-align: center;">작성자</th>
				<td><input type="text" name="b_writer" value="${dto.b_writer }" /></td>
			</tr>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">제목</th>
				<td><input type="text" name="b_subject" value="${dto.b_subject }" /></td>
			</tr>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">내용</th>
				<td>
					<textarea rows="10" cols="50" name="b_content">${dto.b_content }</textarea>
				</td>
			</tr>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">수정할 비밀번호</th>
				<td align="center">
					<input type="password" name="b_pwd" value="${dto.b_pwd }" />
					<input type="submit" value="수정 완료" />
					<input type="reset" value="초기화" />
					<input type="button" value="글 목록" onclick="location.href='boardList.do'" />
				</td>
			</tr>
		</table>
	</form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 

</body>
</html>