package first.hnBlog.user.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import first.common.common.CommandMap;
import first.hnBlog.feeBoard.service.FreeBoardService;
import first.hnBlog.user.service.UserService;
import first.sample.service.SampleService;

@Controller
public class UserController {
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="userService")
	private UserService userService;

	@RequestMapping(value="/user/userRegForm.do")
	public String openMain(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		return "/user/userRegForm.lgn";
	}

	@RequestMapping(value="/user/loginForm.do")
	public String loginForm(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		return "/user/loginForm.lgn";
	}

	@RequestMapping(value="/user/insertUserInfo.do")
	public String login(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		userService.insertUserInfo(commandMap.getMap());

		return "/user/loginForm.lgn";
	}




}
