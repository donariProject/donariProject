package global.sesoc.donari;

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
	
	@RequestMapping(value="mrv", method=RequestMethod.GET)
	public String mrv(){
		
		return "makingVideo/mrv";
	}
	
	@RequestMapping(value="selectTemplate", method=RequestMethod.GET)
	public String selectTemplate(){
		
		return "template/selectTemplate";
	}
	
	@RequestMapping(value="aboutUs", method=RequestMethod.GET)
	public String aboutUs(){
		
		return "aboutUs";
	}
	
	@RequestMapping(value="templatePageTest", method=RequestMethod.GET)
	public String templatePageTest(){
		
		return "makingVideo/templatePageTest";
	}
	
	@RequestMapping(value="myPage", method=RequestMethod.GET)
	public String myPage(){
		
		return "savedVideo/savevideo";
	}
}

	
	
	
