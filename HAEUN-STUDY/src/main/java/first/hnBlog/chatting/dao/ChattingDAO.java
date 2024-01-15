package first.hnBlog.chatting.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("chattingDAO")
public class ChattingDAO extends AbstractDAO{

	public void insertTodoList(Map<String, Object> map) throws Exception{
		insert("chatting.insertTodoList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTodoList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("chatting.selectTodoList",map);
	}

	public void updateComplete(Map<String, Object> map) {
		update("chatting.updateComplete",map);
	}

	public void deleteTodoList(Map<String, Object> map) {
		update("chatting.deleteTodoList",map);
	}

	public void insertMemo(Map<String, Object> map) {
		insert("chatting.insertMemo", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemo(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("chatting.selectMemo",map);
	}

	public void insertChattingUserList(Map<String, Object> map) {
		insert("chatting.insertChattingUserList", map);
	}

	public void updateChattingUserList(Map<String, Object> map) {
		update("chatting.updateChattingUserList",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("chatting.selectUserList",map);
	}

	public void insertChattingMessage(Map<String, Object> userMap) {
		insert("chatting.insertChattingMessage", userMap);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMsgList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("chatting.selectMsgList",map);
	}

}
