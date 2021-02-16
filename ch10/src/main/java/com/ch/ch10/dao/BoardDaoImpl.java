package com.ch.ch10.dao;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.ch10.model.Board;
@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;
	public int getTotal(Board board) { // 현재 게시글이 몇건
		return sst.selectOne("boardns.getTotal", board);
	}
//	public int getTotal() { // 현재 게시글이 몇건
//		return sst.selectOne("boardns.getTotal");
//	}
//	public List<Board> list(int startRow, int endRow) {
//		// 데이터 전송은 하나만 가능
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		return sst.selectList("boardns.list", map);
//	}
	public List<Board> list(Board board) {
		return sst.selectList("boardns.list", board);
	}
	public void updateReadCount(int num) {
		sst.update("boardns.updateReadCount", num);
	}
	public Board select(int num) {
		return sst.selectOne("boardns.select", num);
	}
	public int maxNum() {
		return sst.selectOne("boardns.maxNum");
	}
	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}
	public int update(Board board) {
		return sst.update("boardns.update", board);
	}
	public int delete(int num) {
		return sst.update("boardns.delete", num);
	}
	public void updateStep(Board board) {
		sst.update("boardns.updateStep", board);
	}
}