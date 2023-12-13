package first.hnBlog.calender.service;

import java.util.List;
import java.util.Map;

public interface CalenderService {
	List<Map<String, Object>> selectCalenderCategory(Map<String,Object> map) throws Exception;

	void insertCategory(Map<String, Object> map)  throws Exception;
}
