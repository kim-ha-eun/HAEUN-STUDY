package first.sample.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {
	Logger logger  = LogManager.getLogger(this.getClass());
	@RequestMapping(value="/sample/openSampleList.do")
	public String openSampleList(HttpServletRequest req, Model model) throws Exception{
		logger.debug("인터셉터 테스트");
		return "";
	}


}
