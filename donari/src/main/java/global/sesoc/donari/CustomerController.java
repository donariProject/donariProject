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


	//�α��� ù ȭ��
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {

		return "customer/login";
	}

	//�α��� ���̵� �� ��й�ȣ �˻�
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
	
	//ȸ������  ù ȭ��
	@RequestMapping(value="join", method = RequestMethod.GET)
	public String join(){
		
		return "customer/join";
	}
	
	//ȸ������ �����ͺ��̽� ����
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String insertJoin(UserInfoVO user){
		
		UserInfoDAO jdao = sql.getMapper(UserInfoDAO.class);
		jdao.insertUserInfo(user);
		
		return "customer/login";
	}



}
