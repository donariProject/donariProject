package global.sesoc.donari.vo;

public class UserInfoVO {

	String nickname;
	String id;
	String pw;
	String email;
	
	public UserInfoVO() {
		// TODO Auto-generated constructor stub
	}

	public UserInfoVO(String nickname, String id, String pw, String email) {
		super();
		this.nickname = nickname;
		this.id = id;
		this.pw = pw;
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "UserInfoVO [nickname=" + nickname + ", id=" + id + ", pw=" + pw + ", email=" + email + "]";
	}
	
	
}
