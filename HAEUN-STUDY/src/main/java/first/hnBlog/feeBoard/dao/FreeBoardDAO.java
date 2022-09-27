package first.hnBlog.feeBoard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("freeBoardDAO")
public class FreeBoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBordList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("freeBoard.selectBoardList",map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("freeBoard.insertBoard",map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("freeBoard.updateHitCnt",map);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("freeBoard.selectBoardDetail",map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("freeBoard.updateBoard",map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("freeBoard.deleteBoard",map);
	}

	public void insertFile(Map<String, Object> map) {
		insert("freeBoard.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("freeBoard.selectFileList", map);
	}

	public void deleteFileList(Map<String, Object> map) {
		update("freeBoard.deleteFileList", map);

	}

	public void updateFile(Map<String, Object> map) {
		update("freeBoard.updateFile", map);

	}

}
