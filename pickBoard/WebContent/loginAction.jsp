<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.userDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="u_id"></jsp:setProperty>
<jsp:setProperty name="user" property="u_password"></jsp:setProperty>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<title>pick your star</title>
</head>
<body>

	<%
		String u_id = null;
	if(session.getAttribute("u_id") != null){
		u_id = (String) session.getAttribute("u_id");
	}
	if(u_id != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인된 상태입니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
	userDAO UserDAO = new userDAO();
	int result = UserDAO.login(user.getU_id(), user.getU_password());
	if(result == 1) {
		session.setAttribute("u_id", user.getU_id());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 되었습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.')");
		script.println("history.back()");  //이전 페이지로 이동
		script.println("<script>");
	}
	else if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");  //이전 페이지로 이동
		script.println("</script>");
	}
	else if(result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()");  //이전 페이지로 이동
		script.println("</script>");
	}
	%>

</body>
</html>