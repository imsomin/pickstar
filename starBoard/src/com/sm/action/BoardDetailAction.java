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
		//Ŭ���̾�Ʈ ��û
		String b_num = request.getParameter("b_num");
		
		//����Ͻ� ����
		BoardDAO dao = new BoardDAO();
		dao.boardCount(b_num);					//��ȸ���� ���� �����ؾ� �� ��ȸ ȭ�鿡�� ������ ��ȸ���� ����
		BoardDTO dto = dao.boardDetail(b_num);	//�� ���� �˻�
		request.setAttribute("dto", dto);
		
		//���������̼� ����
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
