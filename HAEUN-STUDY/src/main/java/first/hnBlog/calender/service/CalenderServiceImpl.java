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

	@Override
	public Map<String, Object> insertCalenderEvent(Map<String, Object> map) throws Exception {
		calenderDAO.insertCalenderEvent(map);
		return map;
	}

	@Override
	public List<Map<String, Object>> selectEventList(Map<String, Object> map) throws Exception {
		return calenderDAO.selectEventList(map);
	}

	@Override
	public void updateCalenderEvent(Map<String, Object> map) throws Exception {
		calenderDAO.updateCalenderEvent(map);
	}

	@Override
	public void deleteCalenderEvent(Map<String, Object> map) throws Exception {
		calenderDAO.deleteCalenderEvent(map);
	}

	@Override
	public void updateCategory(Map<String, Object> map) throws Exception {
		calenderDAO.updateCategory(map);
	}

	@Override
	public void deleteCategory(Map<String, Object> map) throws Exception {
		calenderDAO.deleteCategory(map);
	}

}
