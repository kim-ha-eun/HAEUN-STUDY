package first.hnBlog.calender.controller;


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

@Controller
public class CalenderController {
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="calenderService")
	private CalenderService calenderService;

	@RequestMapping(value="calender/calenderForm.do")
	public String selectCalenderForm(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		List<Map<String, Object>> list = calenderService.selectCalenderCategory(commandMap.getMap());
		List<Map<String, Object>> eventList = calenderService.selectEventList(commandMap.getMap());
		model.addAttribute("list",list);
		model.addAttribute("eventList",eventList);
		return "/calender/calender";
	}

	@RequestMapping(value="calender/insertCategory.do")
	public String insertCategory(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
	    calenderService.insertCategory(commandMap.getMap());

		return "jsonView";
	}

	@RequestMapping(value="calender/updateCategory.do")
	public String updateCategory(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
	    calenderService.updateCategory(commandMap.getMap());

		return "jsonView";
	}

	@RequestMapping(value="calender/deleteCategory.do")
	public String deleteCategory(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
	    calenderService.deleteCategory(commandMap.getMap());

		return "jsonView";
	}

	@RequestMapping(value="calender/insertCalenderEvent.do")
	public String insertCalenderEvent(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
		Map<String, Object> map = calenderService.insertCalenderEvent(commandMap.getMap());

		model.addAttribute("idx", map.get("calenderIdx"));

		return "jsonView";
	}

	@RequestMapping(value="calender/updateCalenderEvent.do")
	public String updateCalenderEvent(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
	    calenderService.updateCalenderEvent(commandMap.getMap());

		return "jsonView";
	}

	@RequestMapping(value="calender/deleteCalenderEvent.do")
	public String deleteCalenderEvent(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("sessionInfo");
		String id = (String)userMap.get("USER_EMAIL");

		commandMap.put("registId", id);
	    calenderService.deleteCalenderEvent(commandMap.getMap());

		return "jsonView";
	}

}
