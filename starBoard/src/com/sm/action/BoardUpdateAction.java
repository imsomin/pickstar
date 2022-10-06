package com.sm.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.dao.BoardDAO;
import com.sm.dto.BoardDTO;


public class BoardUpdateAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//Ŭ���̾�Ʈ ��û
		BoardDTO dto = new BoardDTO();
		dto.setB_num(Integer.parseInt(request.getParameter("b_num")));
		dto.setB_writer(request.getParameter("b_writer"));
		dto.setB_subject(request.getParameter("b_subject"));
		dto.setB_content(request.getParameter("b_content"));
		dto.setB_pwd(request.getParameter("b_pwd"));
		
		//����Ͻ� ����
		BoardDAO dao = new BoardDAO();
		dao.boardUpdate(dto);
		
		//���������̼� ����
		ActionForward forward = new ActionForward();
		forward.setPath("boardList.do");
		forward.setRedirect(true);
		return forward;
	}

}
