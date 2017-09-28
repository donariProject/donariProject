package global.sesoc.donari;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.donari.dao.UserInfoDAO;
import global.sesoc.donari.vo.UserInfoVO;

@Controller
public class CustomerController 
{
	@Autowired
	SqlSession sql;

	//로그인 처리
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() 
	{
		return "customer/login";
	}

	@RequestMapping(value="login", method = RequestMethod.POST)
	public String loginConnect(HttpSession session, String id, String password)
	{
		System.out.println("사용자가 입력한 id : "+id+", 사용자가 입력한  pw : "+password);
		UserInfoDAO ldao = sql.getMapper(UserInfoDAO.class);
		String loginInformation =ldao.selectLogin(id);
		String nickname=ldao.selectNickname(id);
		if(loginInformation!=null && loginInformation.equals(password))
		{
			session.setAttribute("id", id);
			session.setAttribute("nickname", nickname);
			return "mainScreen/index";	
		}
		return "login";
	}
	//로그인 처리 끝
	
	//Join처리
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join()
	{
		return "customer/join";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String insertJoin(UserInfoVO user)
	{
		UserInfoDAO jdao = sql.getMapper(UserInfoDAO.class);
		jdao.insertUserInfo(user);
		return "mainScreen/index";
	}
	//Join 처리 끝
	
	/**
	 * 로그 아웃 처리
	 * @param session HttpSession객체
	 */
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) 
	{
		session.invalidate();
		return "mainScreen/index";
	}
	//로그 아웃 처리 끝
	
	//Contact 처리
	@RequestMapping(value="contact",method=RequestMethod.GET)
	public String contact()
	{
		return "contact/contact";
	}
	//Contact 처리 끝
}