package com.fill.market.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fill.market.member.model.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * Auth : GiChang
	 * Date : 2021-11-18
	 * 로그인 이동 처리
	 * 
	 * */
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";

	}
	
	/**
	 * Auth : GiChang
	 * Date : 2021-11-18
	 * 이용약관 이동 처리 
	 * 
	 * */
	@RequestMapping("/member/agreement.do")
	public String agreement() {
		
		return "member/agreement";

	}
	
	/**
	 * 회원가입 접근 확인
	 * @return
	 */
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
}
