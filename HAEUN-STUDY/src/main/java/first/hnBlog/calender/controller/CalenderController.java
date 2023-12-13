package first.hnBlog.calender.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		model.addAttribute("list",list);

		return "/calender/calender";
	}

	@RequestMapping(value="calender/insertCategory.do")
	public String insertCategory(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		commandMap.put("registId", "gkdms3991@naver.com");
	    calenderService.insertCategory(commandMap.getMap());

		return "jsonView";
	}

}
