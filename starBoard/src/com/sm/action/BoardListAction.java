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
		
		//����Ͻ� ����
		//DAO ����
		//�Խ��� ���̺��� ��ü ����� �������� �۾��� ����
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardSearchAll();
		request.setAttribute("list", list);
		
		//���������̼� ����
		//������ ��ȯ ����
		//isRedirect�� true�� ��� -> �����̷�Ʈ ���
		//isRedirect�� false�� ��� -> ������ ���
		ActionForward forward = new ActionForward(); //BoardListAction.java ������ �۾� ������ -(�̵�)-> ActionForward.java
		forward.setPath("board/boardList.jsp");  // View Page(path)
		forward.setRedirect(false); 
		return forward;
	}

}
