package first.hnBlog.user.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO{

	public void insertUserInfo(Map<String, Object> map) throws Exception{
		insert("user.insertUserInfo",map);
	}
}
