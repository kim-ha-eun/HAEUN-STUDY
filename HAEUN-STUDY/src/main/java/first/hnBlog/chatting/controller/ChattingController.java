package first.hnBlog.chatting.controller;



import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.common.common.CommandMap;
import first.hnBlog.chatting.service.ChattingrService;

@Controller
public class ChattingController {
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="chattingService")
	private ChattingrService chattingService;

	@RequestMapping(value="chatting/chattingForm.do")
	public String chattingForm(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();

		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");

		String name = (String)userMap.get("USER_NAME");
		logger.info("@ChatController, GET Chat / Username : " + name);

		model.addAttribute("userName", name);

		return "/chatting/chatting";
	}


}
