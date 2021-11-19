package com.fill.market.member.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fill.market.admin.model.vo.Member;
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
	 * Auth : GiChang
	 * Date : 2021-11-19
	 * 회원가입 이동 처리 
	 * 
	 * */
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
	
	/**
	 * Auth : GiChang
	 * Date : 2021-11-19
	 * 회원가입 처리 
	 * 
	 * */
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, Model model) { // HttpServletRequest / RequestParam / CommandMap
		
		System.out.println("받아온 정보 확인 : " + m);
		
		String pass1 = m.getPassword(); // 원래 비밀번호
		String pass2 = bcryptPasswordEncoder.encode(pass1); // 비밀번호 암호화
		// yyyy-MM-dd 변경
		String birthCheck = m.getBirthYear()+"-" + m.getBirthMonth() + "-" + m.getBirthDay();
		m.setBirth(Date.valueOf(birthCheck));
		System.out.println(pass1 + " / " + pass2);
		
		m.setPassword(pass2);
		try {
			// 1. 서비스로 비즈니스(업무) 로직 수행하기
			int result = memberService.insertMember(m);
			
			// 2. 처리 결과에 따른 화면 처리
			String loc = "/"; // welcome-file
			String msg = "";
			
			if( result > 0 ) {
				msg = "회원 가입 성공!";
			} else {
				msg = "회원 가입 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch( Exception e ) {
			System.out.println("회원 가입 시 에러 발생!");
			System.out.println("Err :: " + e.getMessage());
			
		}
		
		return "common/msg";
		
	}
	
	
	
}
