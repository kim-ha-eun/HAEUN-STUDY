package first.hnBlog.feeBoard.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import first.common.util.FileUtils;
import first.hnBlog.feeBoard.dao.FreeBoardDAO;
import first.sample.dao.SampleDAO;

@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="freeBoardDAO")
	public FreeBoardDAO freeBoardDAO;

	@Resource(name="fileUtils")
	private FileUtils fileUtils;


	@Override
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map) throws Exception{
		return freeBoardDAO.selectBordList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, MultipartHttpServletRequest req) throws Exception {
		freeBoardDAO.insertBoard(map);

		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, req);
		for(int i=0, size=list.size(); i<size; i++){
			freeBoardDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		freeBoardDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = freeBoardDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String,Object>> list = freeBoardDAO.selectFileList(map);
		resultMap.put("list", list);

		return resultMap;
	}


	@Override
	public void updateBoard(Map<String, Object> map, MultipartHttpServletRequest req) throws Exception{
		freeBoardDAO.updateBoard(map);

		freeBoardDAO.deleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, req);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				freeBoardDAO.insertFile(tempMap);
			}
			else{
				freeBoardDAO.updateFile(tempMap);
			}
		}
	}


	@Override
	public void deleteBoard(Map<String, Object> map)throws Exception{
		freeBoardDAO.deleteBoard(map);
	}


}
