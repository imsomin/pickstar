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
	
	//(1)전체 목록 검색 메소드
	public List<BoardDTO> boardSearchAll() 
	{
		SqlSession session = sqlMapper.openSession();
		List<BoardDTO> list = null;
		list = session.selectList("boardSearchAll");
		session.close();
		return list;
	} //end boardSearchAll()
		
	
	//(2)작성한 글 등록 메소드
	public int boardInsert(BoardDTO dto) 
	{
		SqlSession session = sqlMapper.openSession();
		//alert 창을 사용할 경우에는 succ를 return 해야한다.
		//PrintWriter 이용한 script 코드로 구현한 후 페이지 전환 처리
		int succ = 0;
		succ = session.insert("boardInsert", dto);
		session.commit();
		session.close();
		return succ;
	} //end boardInsert()
		
	
	//(3)글 번호로 글 검색 메소드
	public BoardDTO boardDetail(String b_num) 
	{
		SqlSession session = sqlMapper.openSession();
		BoardDTO dto = null;
		dto = session.selectOne("boardDetail", b_num); //출력될 결과가 하나 -> selectOne, 여러 개 -> selectList
		session.close();
		return dto;
	} //end boardDetail()
		
	
	//(4)조회수 증가 메소드
	public void boardCount(String b_num) 
	{
		SqlSession session = sqlMapper.openSession();
		session.update("boardCount", b_num);
		session.commit();
		session.close();
	} //end boardCount()
		
	
	//(5)글 삭제 메소드
	public void boardDelete(String b_num) 
	{
		SqlSession session = sqlMapper.openSession();
		//alert 창을 사용하지 않을 경우에는 succ가 필요없다.
		//ActionForward를 이용한 페이지 전환
		session.delete("boardDelete", b_num);
		session.commit();
		session.close();
	} //end boardDelte()
	
	
	//(6)글 수정 메소드
	public void boardUpdate(BoardDTO dto) 
	{
		SqlSession session = sqlMapper.openSession();
		session.update("boardUpdate", dto);
		session.commit();
		session.close();
	} //end boardUpdate()
		
	
	//(7)조건 검색 메소드
	public List<BoardDTO> boardSearch(SearchDTO dto) 
	{
		SqlSession session = sqlMapper.openSession();
		List<BoardDTO> list = null;  //검색 결과 갯수를 알 수 없으니, List로 받는다.
		list = session.selectList("boardSearch", dto);
		session.close();
		return list;
	} //end boardSearch()

}
