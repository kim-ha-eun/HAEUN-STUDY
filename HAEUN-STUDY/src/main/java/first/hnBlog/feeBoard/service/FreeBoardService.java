package first.hnBlog.feeBoard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import first.common.common.CommandMap;

public interface FreeBoardService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map, MultipartHttpServletRequest req) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map, MultipartHttpServletRequest req) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

}
