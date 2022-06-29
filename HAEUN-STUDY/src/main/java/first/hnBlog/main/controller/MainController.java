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
import first.sample.service.SampleService;

@Controller
public class MainController {
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="sampleService")
	private SampleService sampleService;

	@RequestMapping(value="/main.do")
	public String openMain(HttpServletRequest req, Model model,CommandMap commandMap) throws Exception{
		return "/main/main";
	}



}
