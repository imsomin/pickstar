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
		//Ŭ���̾�Ʈ ��û
		//�Ű� ���� ������ ������
		request.setCharacterEncoding("utf-8");
		String b_writer = request.getParameter("b_writer");
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content");
		String b_pwd = request.getParameter("b_pwd");
		
		
		//������ �Է� 
		//�Է��� �����͸� �Ű� ������ �޴� �����ڸ� DTO�� ���� (�޼��� ���� �ε�)
		BoardDTO dto = new BoardDTO(b_subject, b_pwd, b_content, b_writer);
		
		//����Ͻ� ���� : DAO ����(DB ����, ���� ����)
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);
		
		//���������̼� ���� : alert â Ȱ��
		response.setContentType("text/html; charset = utf-8"); 
		PrintWriter out =response.getWriter(); 
		if(succ > 0) {
			out.println("<script> alert('��� �Ϸ�Ǿ����ϴ�.');");
			out.println("location.href = 'boardList.do';</script>");
		} else {
			out.println("<script> alert('��� �����߽��ϴ�.');");
			out.println("location.href = 'boardList.do';</script>");
		}
		return null; 	//ActionForward�� �ʿ����� ���� , null�� ������
	}

}
