package com.fill.market.member.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.member.model.service.MemberService;

@SessionAttributes({ "member" })
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	/**
	 * Auth : GiChang Date : 2021-11-18 로그인 이동 처리
	 * 
	 */
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {

		return "member/memberLogin";

	}

	/**
	 * Auth : GiChang Date : 2021-11-18 이용약관 이동 처리
	 * 
	 */
	@RequestMapping("/member/agreement.do")
	public String agreement() {

		return "member/agreement";

	}

	/**
	 * Auth : GiChang Date : 2021-11-19 회원가입 이동 처리
	 * 
	 */
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {

		return "member/memberEnroll";
	}

	/**
	 * Auth : GiChang Date : 2021-11-19 회원가입 처리
	 * 
	 */
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(SessionStatus status, Member m, Model model) { // HttpServletRequest / RequestParam /
																					// CommandMap

		System.out.println("받아온 정보 확인 : " + m);

		String pass1 = m.getPassword(); // 원래 비밀번호
		String pass2 = bcryptPasswordEncoder.encode(pass1); // 비밀번호 암호화

		System.out.println(pass1 + " / " + pass2);
		m.setPassword(pass2);

		// yyyy-MM-dd 변경
		String birthCheck = m.getBirthYear() + "-" + m.getBirthMonth() + "-" + m.getBirthDay();
		m.setBirth(Date.valueOf(birthCheck));

		try {
			// 1. 서비스로 비즈니스(업무) 로직 수행하기
			int result = memberService.insertMember(m);

			// 2. 처리 결과에 따른 화면 처리
			String loc = "/"; // welcome-file
			String msg = "";

			if (result > 0) {
				msg = "회원 가입 성공!";
			} else {
				msg = "회원 가입 실패!";
			}

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("회원 가입 시 에러 발생!");
			System.out.println("Err :: " + e.getMessage());

		}

		return "common/msg";

	}

	/**
	 * Auth : GiChang Date : 2021-11-19 로그인 처리
	 * 
	 **/
	@RequestMapping("/member/memberLoginEnd.do")
	public String memberLogin(@RequestParam String userId, @RequestParam String password, Model model) {

		HttpSession session;

		System.out.println("로그인 기능 접근 확인!");

		// 1. 아이디를 통해 회원 정보 조회
		Member result = memberService.selectOneMember(userId); 

		String loc = "/";
		String msg = "";

		if (result != null) {
			// 아이디는 있었다!
			if (bcryptPasswordEncoder.matches(password, result.getPassword())) {
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

	/**
	 * Auth : GiChang Date : 2021-11-19 로그아웃 처리
	 * 
	 **/
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status, Model model) {

		String loc = "/";
		String msg = "";

		if (!status.isComplete()) {
			status.setComplete();

			msg = "로그아웃 되셨습니다!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/member/myPage.do")
	public String myPage() {

		return "member/myPage";
	}

	/**
	 * Auth : GiChang Date : 2021-11-22 정보수정 페이지 이동
	 * 
	 **/
	@RequestMapping("/member/memberView.do")
	public String memberView() {

		return "member/memberView";

	}

	/**
	 * Auth : GiChang Date : 2021-11-22 회원정보 수정
	 * 
	 **/
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {

		String pass1 = member.getPassword(); // 원래 비밀번호
		String pass2 = bcryptPasswordEncoder.encode(pass1); // 비밀번호 암호화

		System.out.println(pass1 + " / " + pass2);
		member.setPassword(pass2);

		String loc = "/";
		String msg = "";

		// yyyy-MM-dd 변경
		String birthCheck = member.getBirthYear() + "-" + member.getBirthMonth() + "-" + member.getBirthDay();
		System.out.println(birthCheck);
		member.setBirth(Date.valueOf(birthCheck));

		int result = memberService.updateMember(member);

		System.out.println("받아온 정보 확인 : " + member);

		if (result > 0) {
			msg = "정보 수정 성공!";
			model.addAttribute("member", member);
		} else {
			msg = "정보 수정 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	/**
	 * Auth : GiChang Date : 2021-11-22 회원정보 수정
	 * 
	 **/
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(Member member, SessionStatus status, Model model) {

		int result = memberService.deleteMember(member.getUserId());

		String loc = "/";
		String msg = "";

		if (result > 0) {
			msg = "회원 탈퇴 성공!";
			status.setComplete();
		} else {
			msg = "회원 탈퇴 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	/**
	 * Auth : GiChang Date : 2021-11-22 아이디 비밀번호 찾기 화면이동
	 * 
	 **/
	@RequestMapping("/member/memberFind.do")
	public String memberFind() {

		return "member/memberFind";

	}

	@RequestMapping("/member/memberFindId.do")
	public String memberFindId(@RequestParam String userName, @RequestParam String email, Model model) {
		
		Member m = new Member();
		m.setUserName(userName);
		m.setEmail(email);
		
		String msg = "";
		String loc = "";

		System.out.println("전달받은 데이터 : " + userName + "/" + email);
		
		Member member = memberService.memberFindId(m);
		System.out.println("member 데이터 : " + userName + "/" + email);

		// 해당 이름과 이메일주소를 가진 회원이 존재하는지 확인
		if (member == null) {
			msg = "일치하는 회원이 존재하지 않습니다.";
			
			loc = "/member/memberFind.do";
			
			System.out.println("조건문(if) 결과 : " + member);
			
			
		} else {
			
			loc ="/member/memberLogin.do"; 
			
		// 로그인아이디 알림창 보여주고 로그인화면으로 이동
			msg = userName + " 회원님의 아이디는 /" + member.getUserId() + "/ 입니다.";
		
		System.out.println("조건문(else) 결과 : " + member.getUserId());
		
		
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
	
	
	
	
}
