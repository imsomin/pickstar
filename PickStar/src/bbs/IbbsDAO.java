package bbs;

import java.util.ArrayList;

public interface IbbsDAO {

	//게시글 수 확인
	public int count();
		
	//게시글 목록 확인
	public ArrayList<bbsDTO> list();
		
	//게시글 추가
	public int add(bbsDTO b);
	
	//게시글 검색
	public bbsDTO search(String bbs_id);
	
}
