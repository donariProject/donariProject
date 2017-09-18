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
	
	
	//�⺻ ��� or ���ø� ���  �����ϴ� â���� �̵�
	@RequestMapping(value="making", method=RequestMethod.GET)
	public String selectMaking(){
		
		return "makingVideo/making";
	}

	//�⺻ ����������� �̵�
	@RequestMapping(value="basicVideo", method=RequestMethod.GET)
	public String basicVideo(){
		
		return "makingVideo/basicVideo";
	}

	
	//���ø� ��� �������� �̵�
	@RequestMapping(value="template", method=RequestMethod.GET)
	public String template(){
		
		return "makingVideo/template";
	}
	
	
}
	

