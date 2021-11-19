package com.fill.market.member.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	/**
	 * Auth : GiChang
	 * Date : 2021-11-19
	 * 로그인 처리 
	 * 
	 **/
	@RequestMapping("/member/memberLoginEnd.do")
	public String memberLogin(@RequestParam String userId, 
							  @RequestParam String password,
							  Model model) {  
		
		System.out.println("로그인 기능 접근 확인!");
		
		// 1. 아이디를 통해 회원 정보 조회
		Member result = memberService.selectOneMember(userId); // -> 서비스로 출발~!
		
		String loc = "/";
		String msg = "";
		
		if( result != null ) {
			// 아이디는 있었다!
			if( bcryptPasswordEncoder.matches(password, result.getPassword())) {
				// bcrypt에서 비교를 위한 메소드를 제공해준다!
				msg = "로그인 성공!";
				
				model.addAttribute("member", result);
				// model은 기본적으로 객체를 request 영역에 저장한다.
				// @SessionAttributes 어노테이션을 통해 세션에 저장할 수 있다!
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}			
		} else {
			msg = "존재하지 않는 아이디입니다!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	
	
}
