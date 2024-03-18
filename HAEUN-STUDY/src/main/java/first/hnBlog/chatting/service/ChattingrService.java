package first.hnBlog.chatting.service;

import java.util.List;
import java.util.Map;

public interface ChattingrService {

	Map<String, Object> insertTodoList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectTodoList(Map<String, Object> map) throws Exception;

	void updateComplete(Map<String, Object> map) throws Exception;

	void deleteTodoList(Map<String, Object> map) throws Exception;

	void insertMemo(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemo(Map<String, Object> map) throws Exception;

	Map<String, Object> insertChattingUserList(Map<String, Object> map) throws Exception;

	void updateChattingUserList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception;

	void insertChattingMessage(Map<String, Object> userMap) throws Exception;

	List<Map<String, Object>> selectMsgList(Map<String, Object> map) throws Exception;

}
