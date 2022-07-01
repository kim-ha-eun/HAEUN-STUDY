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

	@RequestMapping(value="/board/openFreeBoardWrite.do")
	public String openFreeBoardWrite(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{

		return "/freeBoard/freeBoardWrite";
	}



}
