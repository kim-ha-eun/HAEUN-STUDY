package first.sample.service;

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

import first.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger logger  = LogManager.getLogger(this.getClass());

	@Resource(name="sampleDAO")
	public SampleDAO sampleDAO;


	@Override
	public List<Map<String,Object>> selectBoardList(Map<String,Object> map) throws Exception{
		return sampleDAO.selectBordList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, MultipartHttpServletRequest req) throws Exception {
		sampleDAO.insertBoard(map);

		Iterator<String> iterator = req.getFileNames();
		MultipartFile multipartFile = null;
		while(iterator.hasNext()){
			multipartFile = req.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				 logger.debug("------------- file start -------------");
				 logger.debug("name : "+multipartFile.getName());
				 logger.debug("filename : "+multipartFile.getOriginalFilename());
				 logger.debug("size : "+multipartFile.getSize());
				 logger.debug("-------------- file end --------------\n");
			}
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		sampleDAO.updateHitCnt(map);
		Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map);
		return resultMap;
	}


	@Override
	public void updateBoard(Map<String, Object> map) throws Exception{
		sampleDAO.updateBoard(map);
	}


	@Override
	public void deleteBoard(Map<String, Object> map)throws Exception{
		sampleDAO.deleteBoard(map);
	}


}
