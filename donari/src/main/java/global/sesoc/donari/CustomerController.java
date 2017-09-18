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
public class CustomerController {

	@Autowired
	SqlSession sql;


	//로그인 첫 화면
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {

		return "customer/login";
	}

	//로그인 아이디 및 비밀번호 검사
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String loginConnect(HttpSession session, String id, String password){
		System.out.println("id:"+id+", pw:"+password);
		UserInfoDAO ldao = sql.getMapper(UserInfoDAO.class);
		String loginInformation =ldao.selectLogin(id);
		
		if(loginInformation!=null && loginInformation.equals(password)){
			
			session.setAttribute("id", id);
			
			
			return "mainScreen/index";	
		}
		
		return "login";
	}
	
	//회원가입  첫 화면
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join(){
		
		return "customer/join";
	}
	
	//회원가입 데이터베이스 저장
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String insertJoin(UserInfoVO user){
		
		UserInfoDAO jdao = sql.getMapper(UserInfoDAO.class);
		jdao.insertUserInfo(user);
		
		return "customer/login";
	}



}
