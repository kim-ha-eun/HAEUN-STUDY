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

}
