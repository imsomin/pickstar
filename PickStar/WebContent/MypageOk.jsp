<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	//※수정 필요함 참고
	if(email != null && email.equals(password)){
		//로그인에 성공 시 사용자 이메일을 세션 변수에 저장한다.
		session.setAttribute("email", email);
		
	}
	
	//Login_Main.jsp으로 보낸다.
	response.sendRedirect("Login_Mypage.jsp");
	


%>
