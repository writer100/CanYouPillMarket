package com.fill.market.board.controller;


import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fill.market.board.model.service.BoardService;
import com.fill.market.board.model.vo.Board;
import com.fill.market.common.Utils;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/qna/qnaList.do")
	public String selectBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		// 한 페이지당 게시글 수
		int numPerPage = 10;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = boardService.selectBoardList(cPage, numPerPage);
		
		// 전체 게시글 수
		int totalContents = boardService.selectBoardTotalContents();
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
		
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "qna/qnaList";
	}
	
	@RequestMapping("/qna/qnaWrite.do")
	public String boardForm() { // 글쓰기 메소드!
		
		return "qna/qnaWrite";
	}
	
	@RequestMapping("/qna/qnaWriteEnd.do")
	public String insertBoard(Board board, Model model, HttpServletRequest req) {
		
		System.out.println("board : " + board);

		// 게시글 DB에 등록
		int result = boardService.insertBoard(board);
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if( result > 0) {
			msg = "게시글 등록 성공!";
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/board/boardView.do")
	public String boardView(@RequestParam int no, Model model) {
		
		Board board = boardService.selectOneBoard(no);
		
		model.addAttribute("board", board);
		
		return "board/boardView";
	}
	
	
	@RequestMapping("/board/boardUpdateView.do")
	public String boardUpdateView(@RequestParam int boardNo, Model model) {
		
		Board board = boardService.updateView(boardNo);

		
		model.addAttribute("board", board);

		return "board/boardUpdateView";		
	}
	
	@RequestMapping("/board/boardUpdate.do")
	public String boardUpdate(Board board, HttpServletRequest request, Model model, 
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		// 1. 원본 게시글 불러와 수정하기
		int boardNo = board.getQaNo();
		
		Board originBoard = boardService.updateView(boardNo);
		
		originBoard.setQaTitle( board.getQaTitle() );
		originBoard.setQaContent( board.getQaContent() );
		
		
		int result = boardService.updateBoard(originBoard);  // 서비스 찾아가서 마저 구현해주기
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "게시글 수정 성공!";
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam int boardNo,
							  HttpServletRequest request,
							  Model model) {
		
		String savePath = request.getServletContext().getRealPath("/resources/boardUpload");
		
		
		// 게시글 삭제
		int result = boardService.deleteBoard(boardNo); // 서비스 이동~!
		
		String loc = "/board/boardList.do";
		String msg = "";

		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
}













