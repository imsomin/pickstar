package com.sm.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.dao.BoardDAO;
import com.sm.dto.BoardDTO;


public class BoardDetailAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트 요청
		String b_num = request.getParameter("b_num");
		
		//비즈니스 로직
		BoardDAO dao = new BoardDAO();
		dao.boardCount(b_num);					//조회수가 먼저 증가해야 글 조회 화면에서 증가된 조회수가 보임
		BoardDTO dto = dao.boardDetail(b_num);	//글 내용 검색
		request.setAttribute("dto", dto);
		
		//프레젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
