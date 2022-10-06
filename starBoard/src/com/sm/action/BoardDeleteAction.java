package com.sm.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.dao.BoardDAO;


public class BoardDeleteAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//Ŭ���̾�Ʈ ��û
		String b_num = request.getParameter("b_num");
		
		//����Ͻ� ����
		BoardDAO dao = new BoardDAO();
		dao.boardDelete(b_num);
		
		//���������̼� ����
		ActionForward forward = new ActionForward();
		forward.setPath("boardList.do");
		forward.setRedirect(true);
		return forward;
	}
}
