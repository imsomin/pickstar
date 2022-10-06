<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sm.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
List<BoardDTO> list = (List<BoardDTO>)request.getAttribute("list");
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


<title>BoardList</title>
</head>
<body>

<div align="center">
	<!-- http://localhost:8090/starBoard/boardList.do 로 연결~-->
	<h3>[게시판 전체 목록 보기]</h3>
	<!-- <table border="1" style="width: 80%;"> -->
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<tr>
			<th style="background-color: #eeeee; text-align: center;">번호</th>
			<th style="background-color: #eeeee; text-align: center;">제목</th>
			<th style="background-color: #eeeee; text-align: center;">작성자</th>
			<th style="background-color: #eeeee; text-align: center;">작성일</th>
			<th style="background-color: #eeeee; text-align: center;">조회수</th>
		</tr>
		
		
		<!-- JSTL(JSP에서 사용하는 커스텀 태그) 활용-->
		<!-- Core Tags : 변수와 url, 조건문, 반복문 등의 로직과  관련된 jstl 문법 제공-->
		<c:if test="${empty list }"> <!-- list.size()가 0이라면... -->
			<tr align="center">
				<td colspan="5">작성된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${list != null }">
			<c:forEach var="i" items="${list }">
				<tr align="center">
					<td>${i.b_num }</td>
					<td>${i.b_subject }</td>
					<td>${i.b_writer }</td>
					<td>${i.b_date }</td>
					<td>${i.b_readcount }</td>
				</tr>
			</c:forEach>
		</c:if>
		 

		 <tr align="center">
		 	<td colspan="5">
		 	 <form action="boardSearch.do" method="post">
		 			<select name="part">
		 				<option value="b_subject">제목</option>
		 				<option value="b_content">내용</option>
		 				<option value="b_writer">작성자</option>
		 			</select>
		 			<input type="text" name="searchData" required="required"/>
		 			<input type="submit" value="검색" /> 
		 			<input type="button" value="글쓰기" onclick="location.href='boardInsertForm.do'"/> <!-- ★ -->
		 	</form> 
		 	</td>
		 </tr>
		 
	</table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 



</body>
</html>