<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="bbs.bbsDAO"%>
<%@ page import="bbs.bbsDTO"%> --%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
		if (session.getAttribute("u_id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			u_id = (String) session.getAttribute("u_id");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (u_id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		//글이 유효한지 판별
		/*
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		
		bbsDTO bbs = new bbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");				
		} 
		else {
			if(request.getParameter("bbsTitle") == null 
				|| request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTitle").equals("") 
				|| request.getParameter("bbsContent").equals("")) {	
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				bbsDAO bbsDAO = new bbsDAO();
				int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			}
		}
		*/
	%>
</body>
</html>