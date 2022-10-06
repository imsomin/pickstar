package com.sm.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.dao.BoardDAO;
import com.sm.dto.BoardDTO;

public class BoardListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//비즈니스 로직
		//DAO 연동
		//게시판 테이블의 전체 목록을 가져오는 작업을 수행
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardSearchAll();
		request.setAttribute("list", list);
		
		//프레젠테이션 로직
		//페이지 전환 수행
		//isRedirect가 true일 경우 -> 리다이렉트 방식
		//isRedirect가 false일 경우 -> 포워드 방식
		ActionForward forward = new ActionForward(); //BoardListAction.java 에서의 작업 마무리 -(이동)-> ActionForward.java
		forward.setPath("board/boardList.jsp");  // View Page(path)
		forward.setRedirect(false); 
		return forward;
	}

}
