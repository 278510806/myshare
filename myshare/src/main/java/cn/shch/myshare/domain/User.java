package cn.shch.myshare.domain;

public class User {
	private int id;
	private String truename;
	private String mininame;
	private String pwd;
	private String loginname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getMininame() {
		return mininame;
	}
	public void setMininame(String mininame) {
		this.mininame = mininame;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
}
