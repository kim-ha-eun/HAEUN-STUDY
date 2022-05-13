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
	public String openSampleList(HttpServletRequest req, Model model,Map<String,Object> commandMap) throws Exception{
		List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
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




}
