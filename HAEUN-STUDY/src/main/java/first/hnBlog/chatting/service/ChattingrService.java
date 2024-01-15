package first.hnBlog.chatting.service;

import java.util.List;
import java.util.Map;

public interface ChattingrService {

	Map<String, Object> insertTodoList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectTodoList(Map<String, Object> map) throws Exception;

	void updateComplete(Map<String, Object> map);

	void deleteTodoList(Map<String, Object> map);

	void insertMemo(Map<String, Object> map);

	Map<String, Object> selectMemo(Map<String, Object> map);

	Map<String, Object> insertChattingUserList(Map<String, Object> map);

	void updateChattingUserList(Map<String, Object> map);

	List<Map<String, Object>> selectUserList(Map<String, Object> map);

	void insertChattingMessage(Map<String, Object> userMap);

	List<Map<String, Object>> selectMsgList(Map<String, Object> map);

}
