package com.sm.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sm.dto.BoardDTO;
import com.sm.dto.SearchDTO;

public class BoardDAO 
{
	private static SqlSessionFactory sqlMapper;
	static {
		String resource = "com/sm/mybatis/SqlMapConfig.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception");
		}
	}
	
	//(1)��ü ��� �˻� �޼ҵ�
	public List<BoardDTO> boardSearchAll() 
	{
		SqlSession session = sqlMapper.openSession();
		List<BoardDTO> list = null;
		list = session.selectList("boardSearchAll");
		session.close();
		return list;
	} //end boardSearchAll()
		
	
	//(2)�ۼ��� �� ��� �޼ҵ�
	public int boardInsert(BoardDTO dto) 
	{
		SqlSession session = sqlMapper.openSession();
		//alert â�� ����� ��쿡�� succ�� return �ؾ��Ѵ�.
		//PrintWriter �̿��� script �ڵ�� ������ �� ������ ��ȯ ó��
		int succ = 0;
		succ = session.insert("boardInsert", dto);
		session.commit();
		session.close();
		return succ;
	} //end boardInsert()
		
	
	//(3)�� ��ȣ�� �� �˻� �޼ҵ�
	public BoardDTO boardDetail(String b_num) 
	{
		SqlSession session = sqlMapper.openSession();
		BoardDTO dto = null;
		dto = session.selectOne("boardDetail", b_num); //��µ� ����� �ϳ� -> selectOne, ���� �� -> selectList
		session.close();
		return dto;
	} //end boardDetail()
		
	
	//(4)��ȸ�� ���� �޼ҵ�
	public void boardCount(String b_num) 
	{
		SqlSession session = sqlMapper.openSession();
		session.update("boardCount", b_num);
		session.commit();
		session.close();
	} //end boardCount()
		
	
	//(5)�� ���� �޼ҵ�
	public void boardDelete(String b_num) 
	{
		SqlSession session = sqlMapper.openSession();
		//alert â�� ������� ���� ��쿡�� succ�� �ʿ����.
		//ActionForward�� �̿��� ������ ��ȯ
		session.delete("boardDelete", b_num);
		session.commit();
		session.close();
	} //end boardDelte()
	
	
	//(6)�� ���� �޼ҵ�
	public void boardUpdate(BoardDTO dto) 
	{
		SqlSession session = sqlMapper.openSession();
		session.update("boardUpdate", dto);
		session.commit();
		session.close();
	} //end boardUpdate()
		
	
	//(7)���� �˻� �޼ҵ�
	public List<BoardDTO> boardSearch(SearchDTO dto) 
	{
		SqlSession session = sqlMapper.openSession();
		List<BoardDTO> list = null;  //�˻� ��� ������ �� �� ������, List�� �޴´�.
		list = session.selectList("boardSearch", dto);
		session.close();
		return list;
	} //end boardSearch()

}
