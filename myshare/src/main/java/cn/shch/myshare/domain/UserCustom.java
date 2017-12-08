package cn.shch.myshare.domain;

public class UserCustom extends User{

	@Override
	public String toString() {
		return "UserCustom [getId()=" + getId() + ", getTruename()=" + getTruename() + ", getMininame()="
				+ getMininame() + ", getPwd()=" + getPwd() + ", getLoginname()=" + getLoginname() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}
