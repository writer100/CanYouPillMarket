package com.fill.market.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fill.market.cart.model.service.CartService;
import com.fill.market.cart.model.vo.Cart;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@RequestMapping("/cart/cartInsert.do")
	public String cartInsert(@ModelAttribute Cart cart, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		cart.setCartuserid(userId);
		
		// 장바구니에 기존 상품이 있는지 확인
		int count = cartService.countCart(cart.getPno(), userId);
		count = count == 0 ? cartService.insertCart(cart) : cartService.updateCart(cart);
		
		if(count == 0) {
			// 없으면 insert
			cart.setAmount(1);
			cartService.insertCart(cart);
			cart.setOrderprice(cart.getAmount() * cart.getPprice());
	
			System.out.println("insert : " + cart);
		} else { 
			cartService.updateCart(cart);
		}
		
		return "cart/cartList";
	}
	
	@RequestMapping("/cart/cartList.do")
	public ModelAndView cartList(HttpSession session, ModelAndView mav) {
		String userId = (String)session.getAttribute("userId");	// 세션에 저장된 userId
		Map<String, Object> map = new HashMap<String, Object>();
		
			
			List<Cart> list = cartService.listCart(userId);	//장바구니 정보
			int sumPrice = cartService.sumPrice(userId);
			int fee = sumPrice >= 100000 ? 0 : 3000;
						
			System.out.println("장바구니 정보 : " + list);
			System.out.println("총 가격 : " + sumPrice);
			System.out.println("배송비 : " + fee);
			// 장바구니 전체 금액에 따라 배송비 구분
			// 10만원 이상 => 무료, 미만 => 3,000원
			
			map.put("list", list);				// 장바구니 정보를 map에 저장
			map.put("count", list.size());		// 장바구니 안 상품의 유무
			map.put("sumPrice", sumPrice);		// 장바구니 전체 금액
			map.put("fee", fee);				// 배송비
			map.put("allSum", sumPrice+fee);	// 전체 주문 금액
			mav.setViewName("cart/cartList"); 	// view(jsp)의 이름 저장
			mav.addObject("map", map);			// map의 변수 저장
			
			return mav;
	
	}
	
	@RequestMapping("/cart/cartDelete.do")
	public String cartDelete(@RequestParam int cNo) {
		cartService.deleteCart(cNo);
		
		return "cart/cartList";
	}
	
	@RequestMapping("/cart/cartUpdate.do")
	public String cartUpdate(@RequestParam int[] amount, @RequestParam int[] pno, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		// 레코드의 갯수만큼 반복문 실행
		for(int i = 0; i < pno.length; i++) {
			Cart cart = new Cart();
			cart.setCartuserid(userId);
			cart.setAmount(amount[i]);
			cart.setPno(pno[i]);
			cartService.modifyCart(cart);
		}
		
		return "cart/cartList"; 
	}
	

}











