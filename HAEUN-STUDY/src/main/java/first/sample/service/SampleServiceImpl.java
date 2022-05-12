package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

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
}
