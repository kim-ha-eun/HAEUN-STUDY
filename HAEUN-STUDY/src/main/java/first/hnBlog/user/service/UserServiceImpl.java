package first.hnBlog.user.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		map.put("val-passwordSalt", salt);

		userDAO.insertUserInfo(map);
	}

	@Override
	public int selectUserInfo(Map<String, Object> map, HttpServletRequest req) throws Exception {
		Map<String, Object> userMap = userDAO.selectUserInfo(map);

		if(userMap == null){
			return 0;
		}

		String password = CommonUtils.encryptSHA512((String)map.get("val-password"), (String)userMap.get("USER_PASSWORD_SALT"));
		if(!password.equals(userMap.get("USER_PASSWORD"))){
			return -1;
		}

		req.getSession().setAttribute("sessionInfo", userMap);

		return 1;

	}


}
