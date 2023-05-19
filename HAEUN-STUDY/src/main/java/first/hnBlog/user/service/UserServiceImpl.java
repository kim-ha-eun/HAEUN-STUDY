package first.hnBlog.user.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.CommonUtils;
import first.hnBlog.user.dao.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService{
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="userDAO")
	public UserDAO userDAO;

	@Override
	public void insertUserInfo(Map<String, Object> map) throws Exception {
		String salt = CommonUtils.createSaltKey();
		String password = CommonUtils.encryptSHA512((String)map.get("val-password"), salt);

		map.put("val-password", password);
		userDAO.insertUserInfo(map);
	}

}
