package com.fill.market.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fill.market.board.model.service.BoardService;
import com.fill.market.board.model.vo.Board;
import com.fill.market.admin.model.vo.Member;

public class WriterInterceptor extends HandlerInterceptorAdapter  {
	@Resource
	private BoardService boardService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("member");
		
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = boardService.selectOneBoard(no);
		
		
		if(!loginMember.equals(board.getQauserid())) {
			System.out.println("비 로그인 상태에서 접근 시도 : " + request.getRequestURI());
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "작성자 본인만 수정할 수 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	
	}
}