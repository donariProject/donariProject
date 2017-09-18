package global.sesoc.donari;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MakingController {

	@Autowired
    SqlSession sql;
	
	
	//기본 기능 or 템플릿 기능  선택하는 창으로 이동
	@RequestMapping(value="making", method=RequestMethod.GET)
	public String selectMaking(){
		
		return "makingVideo/making";
	}

	//기본 기능페이지로 이동
	@RequestMapping(value="basicVideo", method=RequestMethod.GET)
	public String basicVideo(){
		
		return "makingVideo/basicVideo";
	}

	
	//템플릿 기능 페이지로 이동
	@RequestMapping(value="template", method=RequestMethod.GET)
	public String template(){
		
		return "makingVideo/template";
	}
	
	
}
	

