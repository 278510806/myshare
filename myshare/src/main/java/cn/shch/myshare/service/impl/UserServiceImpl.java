package cn.shch.myshare.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.shch.myshare.domain.UserCustom;
import cn.shch.myshare.mapper.UserCustomMapper;
import cn.shch.myshare.service.UserService;
import cn.shch.myshare.vo.UserCustomVo;

public class UserServiceImpl implements UserService{
	@Autowired
	private UserCustomMapper userCustomMapper;
	@Override
	public UserCustom login(UserCustomVo vo)throws Exception {
		return userCustomMapper.login(vo);
	}
	public UserCustomMapper getUserCustomMapper() {
		return userCustomMapper;
	}
	public void setUserCustomMapper(UserCustomMapper userCustomMapper) {
		this.userCustomMapper = userCustomMapper;
	}

}
