package first.hnBlog.chatting.controller;



import java.util.List;
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
import first.hnBlog.calender.service.CalenderService;
import first.hnBlog.chatting.service.ChattingrService;

@Controller
public class ChattingController {
	private Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="chattingService")
	private ChattingrService chattingService;

	@Resource(name="calenderService")
	private CalenderService calenderService;

	@RequestMapping(value="chatting/chattingForm.do")
	public String chattingForm(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();

		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");

		String name = (String)userMap.get("USER_NAME");
		logger.info("@ChatController, GET Chat / Username : " + name);

		List<Map<String, Object>> todoList = chattingService.selectTodoList(commandMap.getMap());
		//List<Map<String, Object>> userList = chattingService.selectUserList(commandMap.getMap());
		List<Map<String, Object>> msgList = chattingService.selectMsgList(commandMap.getMap());
		List<Map<String, Object>> eventList = calenderService.selectEventList(commandMap.getMap());
		List<Map<String, Object>> list = calenderService.selectCalenderCategory(commandMap.getMap());

		model.addAttribute("list",list);
		model.addAttribute("userName", name);
		model.addAttribute("todoList", todoList);
		//model.addAttribute("userList", userList);
		model.addAttribute("msgList", msgList);
		model.addAttribute("eventList",eventList);

		return "/chatting/chatting";
	}

	@RequestMapping(value="chatting/insertTodoList.do")
	public String insertTodoList(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
		Map<String, Object> map = chattingService.insertTodoList(commandMap.getMap());

		model.addAttribute("idx", (String)map.get("todoIdx"));

		return "jsonView";
	}

	@RequestMapping(value="chatting/updateComplete.do")
	public String updateComplete(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{

		chattingService.updateComplete(commandMap.getMap());

		return "jsonView";
	}

	@RequestMapping(value="chatting/userListAjax.do")
	public String userListAjax(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{

		List<Map<String, Object>> userList = chattingService.selectUserList(commandMap.getMap());
		model.addAttribute("userList", userList);

		return "jsonView";
	}


	@RequestMapping(value="chatting/deleteTodoList.do")
	public String deleteTodoList(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{

		chattingService.deleteTodoList(commandMap.getMap());

		return "jsonView";
	}

	@RequestMapping(value="chatting/insertMemo.do")
	public String insertMemo(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
		chattingService.insertMemo(commandMap.getMap());

		return "jsonView";
	}




}
