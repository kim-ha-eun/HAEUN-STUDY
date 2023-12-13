package first.hnBlog.chatting.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import first.hnBlog.calender.dao.CalenderDAO;
import first.hnBlog.chatting.dao.ChattingDAO;

@Service("chattingService")
public class ChattingServiceImpl implements ChattingrService{
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="chattingDAO")
	public ChattingDAO chattingDAO;

//	@Override
//	public List<Map<String, Object>> selectCalenderCategory(Map<String, Object> map) throws Exception {
//		return calenderDAO.selectCalenderCategory(map);
//	}
//
//	@Override
//	public void insertCategory(Map<String, Object> map)  throws Exception{
//		calenderDAO.insertCategory(map);
//	}

}
