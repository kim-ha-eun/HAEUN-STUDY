package first.hnBlog.calender.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("calenderDAO")
public class CalenderDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCalenderCategory(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("calender.selectCalenderCategory",map);
	}

	public void insertCategory(Map<String, Object> map) throws Exception{
		insert("calender.insertCategory", map);
	}

	public void insertCalenderEvent(Map<String, Object> map) {
		insert("calender.insertCalenderEvent", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("calender.selectEventList",map);
	}

	public void updateCalenderEvent(Map<String, Object> map) {
		update("calender.updateCalenderEvent",map);
	}

	public void deleteCalenderEvent(Map<String, Object> map) {
		update("calender.deleteCalenderEvent",map);
	}

	public void updateCategory(Map<String, Object> map) {
		update("calender.updateCategory",map);
	}

	public void deleteCategory(Map<String, Object> map) {
		delete("calender.deleteCategory",map);
	}

}
