package bbs;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class bbsController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/bbslist.action", method=RequestMethod.GET)
	public String storeList(Model model)
	{
		String result = null;
		//String result = "WEB-INF/view/";
		
		IbbsDAO dao = sqlSession.getMapper(IbbsDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "/Login_Community.jsp";
		
		return result;
	
	
	}
	

	@RequestMapping(value = "/bbsinsertform.action", method=RequestMethod.GET)
	public String facilityInsertForm()
	{
		
		String result = null;
		//String result = "WEB-INF/view/";
		
		result = "/Login_Community.jsp";
		
		return result;
	}
		
	
	
	@RequestMapping(value = "/facilityinsert.action", method=RequestMethod.POST)
	public String facilityInsert(bbsDTO b)
	{
		String result = null;
		
		IbbsDAO dao = sqlSession.getMapper(IbbsDAO.class);
		
		dao.add(b);
		result += "redirect:bbslist.action";
		
		return result;
	}	
	
	

	
}
