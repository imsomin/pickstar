<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<title>Board Insert Form</title>
<script type="text/javascript">
function fnSubmit() {
	if(confirm("작성하신 글을 등록하시겠습니까?")) {
		return true;
	}
	return false;
}
function fnReset() {
	if(confirm("입력하신 내용을 삭제하시겠습니까?")) {
		fnLoad();
		return true;
	}
	return false;
}
function fnLoad() {
	document.regForm.b_writer.focus();
}
</script>
</head>
<body onload="fnLoad()">
<div align="center">
	<h3> 🎠 글 작성하기 🎡 </h3>
	<form action="boardInsert.do" method="post" name="regForm" onsubmit="return fnSubmit()" onreset="return fnReset()">
		<table border="1" style="width: 80%;">
			<tr>
				<th style="background-color: #eeeee; text-align: center;">작성자</th>
				<td><input type="text" name="b_writer" maxlength="20" required="required" /></td>
			</tr>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">비밀번호</th>
				<td><input type="password" name="b_pwd" maxlength="20" required="required" />
			</tr>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">제목</th>
				<td><input type="text" name="b_subject" maxlength="50" required="required" /></td>
			</tr>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">내용</th>
				<td>
					<textarea rows="10" cols="50" name="b_content" required="required"></textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록" />
					<input type="reset" value="내용 삭제" />
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