package first.hnBlog.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface UserService {

	void insertUserInfo(Map<String, Object> map) throws Exception;

	int selectUserInfo(Map<String, Object> map, HttpServletRequest req) throws Exception;

}
