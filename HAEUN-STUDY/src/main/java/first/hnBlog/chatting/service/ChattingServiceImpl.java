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

	@Override
	public Map<String, Object> insertTodoList(Map<String, Object> map) throws Exception {
		chattingDAO.insertTodoList(map);

		return map;
	}

	@Override
	public List<Map<String, Object>> selectTodoList(Map<String, Object> map) throws Exception {
		return chattingDAO.selectTodoList(map);
	}

	@Override
	public void updateComplete(Map<String, Object> map) {
		chattingDAO.updateComplete(map);
	}

	@Override
	public void deleteTodoList(Map<String, Object> map) {
		chattingDAO.deleteTodoList(map);
	}

	@Override
	public void insertMemo(Map<String, Object> map) {
		chattingDAO.insertMemo(map);
	}

	@Override
	public Map<String, Object> selectMemo(Map<String, Object> map) {
		return chattingDAO.selectMemo(map);
	}

	@Override
	public Map<String, Object> insertChattingUserList(Map<String, Object> map) {
		chattingDAO.insertChattingUserList(map);

		return map;
	}

	@Override
	public void updateChattingUserList(Map<String, Object> map) {
		chattingDAO.updateChattingUserList(map);
	}

	@Override
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) {
		return chattingDAO.selectUserList(map);
	}

	@Override
	public void insertChattingMessage(Map<String, Object> userMap) {
		chattingDAO.insertChattingMessage(userMap);
	}

	@Override
	public List<Map<String, Object>> selectMsgList(Map<String, Object> map) {
		return chattingDAO.selectMsgList(map);
	}


}
