package first.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoggerInterceptor extends HandlerInterceptorAdapter{

	private Logger logger = LogManager.getLogger(LoggerInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("====================================== START ====================================================================================");
			logger.debug(" Request URI \t: " + request.getRequestURI());
		}

		return super.preHandle(request, response, handler);
	}

	@Override public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("====================================== END ======================================================================================\n");
		}
	}


}
