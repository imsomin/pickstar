<%@page import="com.sm.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");
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

<title>BoardSearchList</title>
</head>
<body>
<div align="center">
	<h3>[검색 결과]</h3>
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<tr>
			<th style="background-color: #eeeee; text-align: center;">번호</th>
			<th style="background-color: #eeeee; text-align: center;">제목</th>
			<th style="background-color: #eeeee; text-align: center;">작성자</th>
			<th style="background-color: #eeeee; text-align: center;">작성일</th>
			<th style="background-color: #eeeee; text-align: center;">조회수</th>
		</tr> <%
			 if(list.size() == 0) {
				 out.println("<tr align='center'><td colspan='5'>작성된 글이 없습니다.</td></tr>");
			 } else {
				 for(int i = 0; i < list.size(); i++) {
					 out.println("<tr align='center'>");
						//out.println("<td>" + list.get(i).getB_num() + "</td>");
						out.println("<td>" + (list.size() - i) + "</td>");
						out.println("<td><a href='boardDetail.do?b_num=" + list.get(i).getB_num() + "'>" + list.get(i).getB_subject() + "</a></td>");
						out.println("<td>" + list.get(i).getB_writer() + "</td>");
						out.println("<td>" + list.get(i).getB_date() + "</td>");
						out.println("<td>" + list.get(i).getB_readcount() + "</td>");
					out.println("</tr>");
				 }
			 }
			 %>
			
			<tr align="center">
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='boardInsertForm.do'" />
					<input type="button" value="글 목록" onclick="location.href='boardList.do'" />
				</td>
			</tr>
	</table>
	
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 

</body>
</html>