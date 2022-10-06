package com.sm.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.dao.BoardDAO;
import com.sm.dto.BoardDTO;

public class BoardInsertAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트 요청
		//매개 변수 정보를 가져옴
		request.setCharacterEncoding("utf-8");
		String b_writer = request.getParameter("b_writer");
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content");
		String b_pwd = request.getParameter("b_pwd");
		
		
		//데이터 입력 
		//입력할 데이터만 매개 변수로 받는 생성자를 DTO에 생성 (메서드 오버 로딩)
		BoardDTO dto = new BoardDTO(b_subject, b_pwd, b_content, b_writer);
		
		//비즈니스 로직 : DAO 연동(DB 접속, 쿼리 수행)
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);
		
		//프레젠테이션 로직 : alert 창 활용
		response.setContentType("text/html; charset = utf-8"); 
		PrintWriter out =response.getWriter(); 
		if(succ > 0) {
			out.println("<script> alert('등록 완료되었습니다.');");
			out.println("location.href = 'boardList.do';</script>");
		} else {
			out.println("<script> alert('등록 실패했습니다.');");
			out.println("location.href = 'boardList.do';</script>");
		}
		return null; 	//ActionForward가 필요하지 않음 , null을 리턴함
	}

}
