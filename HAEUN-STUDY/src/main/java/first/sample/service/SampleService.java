package first.sample.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import first.common.common.CommandMap;

public interface SampleService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

}
