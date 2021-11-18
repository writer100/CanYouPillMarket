package com.fill.market.member.model.service;

import com.fill.market.admin.model.vo.Member;

public interface MemberService {

	/**
	 * 회원가입 기능 구현 메소드 
	 * @param member
	 * @return
	 */
	int insertMember(Member member);

	/**
	 * 로그인 기능 구현 메소드 
	 * @param userId
	 * @return
	 */
	Member selectOneMember(String userId);

	/**
	 * 회원정보 수정 메소드 
	 * @param member
	 * @return
	 */
	int updateMember(Member member);

	/**
	 * 회원정보 삭제 메소드 
	 * @param userId
	 * @return
	 */
	int deleteMember(String userId);
	
	int checkIdDuplicate(String userId);
}
