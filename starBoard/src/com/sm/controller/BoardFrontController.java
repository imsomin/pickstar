package com.sm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.action.Action;
import com.sm.action.ActionForward;
import com.sm.action.BoardDeleteAction;
import com.sm.action.BoardDetailAction;
import com.sm.action.BoardInsertAction;
import com.sm.action.BoardListAction;
import com.sm.action.BoardSearchAction;
import com.sm.action.BoardUpdateAction;
import com.sm.action.BoardUpdateFormAction;

@WebServlet("/BoardFrontController.do")
public class BoardFrontController extends HttpServlet
{
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		//(1)Ŭ���̾�Ʈ�� � ��û�� �ߴ��� �ľ�
		request.setCharacterEncoding("utf-8");
		//http://localhost:8090/starBoard/boardList.do
		//--starBoard : context root(path)
		//--starBoard/boardList.do : uri-pattern
		
		String uri = request.getRequestURI();		//uri-pattern ��	 : /starBoard/boardList.do
		String ctx = request.getContextPath();		//context root ��  : /starBoard
		String command = uri.substring(ctx.length());  //���� ��û�� ������ : /boardList.do
		//System.out.println("uri : " + uri);
		//System.out.println("ctx : " + ctx);
		//System.out.println("command : " + command);
		
		
		//(2)Ŭ���̾�Ʈ�� ��û(*.do �� command)�� ���� ó���� ����Ͻ� ����(Action Class) ����
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/boardList.do")) 
		{
			action = new BoardListAction();		
			forward = action.execute(request, response);
		}
		else if(command.equals("/boardInsertForm.do"))
		{	
			forward = new ActionForward();
			forward.setPath("board/boardInsertForm.jsp");
			forward.setRedirect(false);
		} 
		else if(command.equals("/boardInsert.do")) 
		{
			action = new BoardInsertAction();
			forward = action.execute(request, response);
		} 
		else if(command.equals("/boardDetail.do")) 
		{
			action = new BoardDetailAction();
			forward = action.execute(request, response);
		} 
		else if(command.equals("/boardDelete.do")) 
		{
			action = new BoardDeleteAction();
			forward = action.execute(request, response);
		} 
		else if(command.equals("/boardUpdateForm.do")) 
		{
			action = new BoardUpdateFormAction();
			forward = action.execute(request, response);
		} 
		else if(command.equals("/boardUpdate.do"))
		{
			action = new BoardUpdateAction();
			forward = action.execute(request, response);
		} 
		else if(command.equals("/boardSearch.do")) 
		{
			action = new BoardSearchAction();
			forward = action.execute(request, response);
		}
		
	
		//(3)������ ��ȯ(���������̼� ����) : sendRedirect(), forward()
		if(forward != null) 
		{	
			if(forward.isRedirect()) 
			{	//true : sendRedirect() ������ ��ȯ
				response.sendRedirect(forward.getPath());
			} 
			else
			{	//false : forward() ������ ��ȯ
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}	
		}
	
	}
	
}
