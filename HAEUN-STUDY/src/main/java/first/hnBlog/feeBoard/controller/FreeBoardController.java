package first.hnBlog.feeBoard.controller;

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
import first.sample.service.SampleService;

@Controller
public class FreeBoardController {
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="freeBoardService")
	private FreeBoardService freeBoardService;

	@RequestMapping(value="/freeBoard/freeBordList.do")
	public String selectFreeBoardList(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		List<Map<String, Object>> list = freeBoardService.selectBoardList(commandMap.getMap());
		model.addAttribute("list",list);

		return "/freeBoard/freeBoardList";
	}

	@RequestMapping(value="/freeBoard/openFreeBoardWrite.do")
	public String openFreeBoardWrite(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{

		return "/freeBoard/freeBoardWrite";
	}

	@RequestMapping(value="/freeBoard/insertBoard.do")
	public String insertBoard(MultipartHttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		freeBoardService.insertBoard(commandMap.getMap(), req);

		return "redirect:/freeBoard/freeBordList.do";
	}

	@RequestMapping(value="/freeBoard/openFreeBoardDetail.do")
	public String openBoardDetail(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		Map<String,Object> map = freeBoardService.selectBoardDetail(commandMap.getMap());
		model.addAttribute("map",map.get("map"));
		model.addAttribute("list", map.get("list"));

		return "/freeBoard/freeBoardDetail";
	}

	@RequestMapping(value="/freeBoard/deleteBoard.do")
	public String deleteBoard(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		freeBoardService.deleteBoard(commandMap.getMap());

		return "redirect:/freeBoard/freeBordList.do";
	}

	@RequestMapping(value="/freeBoard/openBoardUpdate.do")
	public String openBoardUpdate(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		Map<String,Object> map = freeBoardService.selectBoardDetail(commandMap.getMap());
		model.addAttribute("map",map.get("map"));
		model.addAttribute("list", map.get("list"));

		return "/freeBoard/freeBoardUpdate";
	}

}
