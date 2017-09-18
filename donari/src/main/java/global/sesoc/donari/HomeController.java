package global.sesoc.donari;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.donari.dao.UserInfoDAO;
import global.sesoc.donari.vo.UserInfoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired
    SqlSession sql;
	
	
		
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("들어왔도다");
		
		return "mainScreen/start";
	}
	
	
	
	@RequestMapping(value="index", method= RequestMethod.GET)
	public String index(){
		
		return "mainScreen/index";
	}
		
}

	
	
	
