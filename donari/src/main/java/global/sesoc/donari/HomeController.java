package global.sesoc.donari;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value="index", method= RequestMethod.GET)
	public String index(){
		
		return "index";
	}
		
		
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("들어왔도다");
		
		return "start";
	}
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login(){
		
		return "login2";
	}
	
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join(){
		
		return "join";
	}
	
	@RequestMapping(value="making", method=RequestMethod.GET)
	public String selectMaking(){
		
		
		return "making";
	}
	
	
	@RequestMapping(value="basicVideo", method=RequestMethod.GET)
	public String basicVideo(){
		
		return "basicVideo";
	}

	@RequestMapping(value="savevideo", method=RequestMethod.GET)
	public String saveVideo(){
		
		return "savevideo";
	}

}
