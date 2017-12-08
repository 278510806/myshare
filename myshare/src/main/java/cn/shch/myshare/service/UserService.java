package cn.shch.myshare.service;

import cn.shch.myshare.domain.UserCustom;
import cn.shch.myshare.vo.UserCustomVo;

public interface UserService {
	public UserCustom login(UserCustomVo vo)throws Exception;
}
