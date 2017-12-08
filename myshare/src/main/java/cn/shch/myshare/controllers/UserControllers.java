package cn.shch.myshare.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import cn.shch.myshare.domain.UserCustom;
import cn.shch.myshare.service.UserService;
import cn.shch.myshare.vo.UserCustomVo;

@Controller
@SessionAttributes("loginUser")
public class UserControllers {
	@Autowired
	private UserService userService;

	@RequestMapping(value="/login")
	public ModelAndView userLogin( UserCustomVo vo,ModelMap modelMap) throws Exception {
		// System.out.println(vo.getUserCustom().getLoginname() + "----" +
		// vo.getUserCustom().getPwd());
		UserCustom loginUser = userService.login(vo);
		if (loginUser != null) {
			//ModelAndView mav = new ModelAndView();
			//session.setAttribute("loginUser", userCustom);
			//mav.setViewName("main");
			//return mav;
			loginUser.setPwd("");
			modelMap.addAttribute("loginUser",loginUser);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("main");
			return mav;
		} else {
			//session.setAttribute("loginfailed", "用户名密码输入错误！");
			//modelMap.put("loginFailed", "用户名密码输入错误！请重新输入....");
			ModelAndView mav=new ModelAndView(new RedirectView("login.jsp"));
			mav.addObject("loginFailed", "用户名密码输入错误！请重新输入....");
			return mav;
		}
		// return mav;
	}
	@RequestMapping("/logout")
	public ModelAndView logout(ModelMap modelMap,HttpSession session,SessionStatus sessionStatus)throws Exception{
		session.removeAttribute("loginUser");
		sessionStatus.setComplete();
		return new ModelAndView(new RedirectView("login.jsp"));
	}
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
