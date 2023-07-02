package movieVO;

import java.util.Date;

public class UserVO {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date joinDate;
	
	public UserVO() {
		
	}
	public UserVO(String id, String pwd) {
		this.id=id;
		this.pwd = pwd;
	}
	public UserVO(String id, String pwd, String name, String email) {
		this.id=id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
	}
	public UserVO(String id, String pwd, String name, String email, Date joinDate) {
		this.id=id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.joinDate = joinDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
}
