package first.hnBlog.calender.service;

import java.util.List;
import java.util.Map;

public interface CalenderService {
	List<Map<String, Object>> selectCalenderCategory(Map<String,Object> map) throws Exception;

	void insertCategory(Map<String, Object> map)  throws Exception;

	Map<String, Object> insertCalenderEvent(Map<String, Object> map)  throws Exception;

	List<Map<String, Object>> selectEventList(Map<String, Object> map) throws Exception;

	void updateCalenderEvent(Map<String, Object> map) throws Exception;

	void deleteCalenderEvent(Map<String, Object> map) throws Exception;

	void updateCategory(Map<String, Object> map) throws Exception;

	void deleteCategory(Map<String, Object> map) throws Exception;
}
