package bbs;

import java.util.ArrayList;

public interface IbbsDAO {

	//�Խñ� �� Ȯ��
	public int count();
		
	//�Խñ� ��� Ȯ��
	public ArrayList<bbsDTO> list();
		
	//�Խñ� �߰�
	public int add(bbsDTO b);
	
	//�Խñ� �˻�
	public bbsDTO search(String bbs_id);
	
}
