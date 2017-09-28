package global.sesoc.donari.dao;

import global.sesoc.donari.vo.UserInfoVO;

public interface UserInfoDAO 
{
	String selectLogin(String id);
	
	int insertUserInfo(UserInfoVO userinfo);
	
	String selectNickname(String id);
}