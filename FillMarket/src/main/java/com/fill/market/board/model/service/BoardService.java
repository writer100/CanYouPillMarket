package com.fill.market.board.model.service;

import java.util.List;
import java.util.Map;


import com.fill.market.board.model.vo.Board;

public interface BoardService {
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	Board selectOneBoard(int boardNo);
	
	int insertBoard(Board board);

	Board updateView(int boardNo);
	
	int updateBoard(Board board);
	
	int deleteBoard(int boardNo);
	
}
