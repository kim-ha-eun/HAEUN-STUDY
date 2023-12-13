package first.hnBlog.calender.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import first.hnBlog.calender.dao.CalenderDAO;

@Service("calenderService")
public class CalenderServiceImpl implements CalenderService{
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="calenderDAO")
	public CalenderDAO calenderDAO;

	@Override
	public List<Map<String, Object>> selectCalenderCategory(Map<String, Object> map) throws Exception {
		return calenderDAO.selectCalenderCategory(map);
	}

	@Override
	public void insertCategory(Map<String, Object> map)  throws Exception{
		calenderDAO.insertCategory(map);
	}

}
