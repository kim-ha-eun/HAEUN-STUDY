package first.hnBlog.main.controller;

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
import first.hnBlog.chatting.service.ChattingrService;
import first.hnBlog.feeBoard.service.FreeBoardService;
import first.sample.service.SampleService;

@Controller
public class MainController {
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name = "freeBoardService")
	public FreeBoardService freeBoardService;

	@Resource(name = "chattingService")
	public ChattingrService chattingService;

	@RequestMapping(value="/main.do")
	public String openMain(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		return "/main/main";

	}

	@RequestMapping(value="/editor.do")
	public String openEditor(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		return "/include/editor";
	}

	@RequestMapping(value="/editorUpdate.do")
	public String openEditorUpdate(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		Map<String,Object> map = freeBoardService.selectBoardDetail(commandMap.getMap());
		model.addAttribute("map",map.get("map"));

		return "/include/editor";
	}

	@RequestMapping(value="/editorView.do")
	public String openEditorView(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		Map<String,Object> map = freeBoardService.selectBoardDetail(commandMap.getMap());
		model.addAttribute("map",map.get("map"));

		return "/include/editorView";
	}

	@RequestMapping(value="/editorForChatting.do")
	public String openEditorForChatting(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		Map<String, Object> map = chattingService.selectMemo(commandMap.getMap());
		model.addAttribute("map",map);
		return "/include/editorForChatting";
	}

	@RequestMapping(value="/profile.do")
	public String profile(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		return "/main/profile";

	}



}
