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
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String loginConnect(HttpSession session, String id, String password){
		System.out.println("id:"+id+", pw:"+password);
		UserInfoDAO ldao = sql.getMapper(UserInfoDAO.class);
		String loginInformation =ldao.selectLogin(id);
		
		if(loginInformation!=null && loginInformation.equals(password)){
			
			session.setAttribute("id", id);
			
			
			return "index";	
		}
		
		return "login2";
	}
	
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join(){
		
		return "join";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String insertJoin(UserInfoVO user){
		
		UserInfoDAO jdao = sql.getMapper(UserInfoDAO.class);
		jdao.insertUserInfo(user);
		
		return "login2";
	}
	
	@RequestMapping(value="making", method=RequestMethod.GET)
	public String selectMaking(){
		
		
		return "making";
	}
	
	
	@RequestMapping(value="basicVideo", method=RequestMethod.GET)
	public String basicVideo(){
		
		return "basicVideo";
	}

	
	@RequestMapping(value="template", method=RequestMethod.GET)
	public String template(){
		
		return "template";
	}
	
	@RequestMapping(value="savevideo", method=RequestMethod.GET)
	public String saveVideo(){
		
		return "savevideo";
	}

}
