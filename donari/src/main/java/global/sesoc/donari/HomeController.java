package global.sesoc.donari;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "mainScreen/index";
	}
	
	@RequestMapping(value="index", method= RequestMethod.GET)
	public String index(){
		return "mainScreen/index";
	}
		
	@RequestMapping(value="make", method=RequestMethod.GET)
	public String making(){
		
		return "makingVideo/make";
	}
	
	@RequestMapping(value="basicVideo", method=RequestMethod.GET)
	public String basicVideo(){
		
		return "makingVideo/basicVideo";
	}
	
	@RequestMapping(value="selectTemplate", method=RequestMethod.GET)
	public String selectTemplate(){
		
		return "makingVideo/selectTemplate";
	}
	
	@RequestMapping(value="aboutUs", method=RequestMethod.GET)
	public String aboutUs(){
		
		return "aboutUs";
	}
}

	
	
	
