package first.sample.controller;

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

import first.common.common.CommandMap;
import first.sample.service.SampleService;

@Controller
public class SampleController {
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="sampleService")
	private SampleService sampleService;

	@RequestMapping(value="/sample/openSampleBoardList.do")
	public String openSampleList(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		List<Map<String, Object>> list = sampleService.selectBoardList(commandMap.getMap());
		model.addAttribute("list",list);

		return "/sample/boardList";
	}

	@RequestMapping(value="/sample/testMapArgumentResolver.do")
	public String testMapArgumentResolver(CommandMap commandMap) throws Exception{

		if(commandMap.isEmpty() == false){
			Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String,Object> entry = null;
			while(iterator.hasNext()){
				entry = iterator.next();
				logger.debug("key : "+entry.getKey()+", value : "+entry.getValue());
			}
		}
		return "";
	}

	@RequestMapping(value="/sample/openBoardWrite.do")
	public String openBoardWrite(CommandMap commandMap) throws Exception{

		return "/sample/boardWrite";
	}

	@RequestMapping(value="/sample/insertBoard.do")
	public String insertBoard(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		sampleService.insertBoard(commandMap.getMap());

		return "redirect:/sample/openSampleBoardList.do";
	}


	@RequestMapping(value="/sample/openBoardDetail.do")
	public String openBoardDetail(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		model.addAttribute("map",map);

		return "/sample/openBoardDetail";
	}






}
