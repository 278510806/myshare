package cn.shch.myshare.mapper;

import cn.shch.myshare.domain.UserCustom;
import cn.shch.myshare.vo.UserCustomVo;

public interface UserCustomMapper {
	public UserCustom login(UserCustomVo vo)throws Exception;
}
