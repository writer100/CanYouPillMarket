package com.fill.market.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	/*
	@RequestMapping("/order/orderPage.do")
	public String orderPage(HttpSession session) {
		
		return "order/orderPage";
		
	}*/

	@RequestMapping("/order/orderPage.do")
	public ModelAndView orderPage(HttpSession session, ModelAndView mav, Cart cart) {
		
		String userId = ((Member)session.getAttribute("member")).getUserId();
		String userName = ((Member)session.getAttribute("member")).getUserName();
		String userPhone = ((Member)session.getAttribute("member")).getPhone();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("orderPage 세션 확인 : " + userId + "/" + userName + "/" + userPhone);
		
		List<Cart> list = orderService.orderPage(userId);
		int sumPrice = orderService.sumPrice(userId);
		int fee = sumPrice >= 30000 ? 0 : 2500;
		
		map.put("list", list);
		map.put("userId", userId);
		map.put("userName", userName);
		map.put("userPhone", userPhone);
		map.put("sumPrice", sumPrice);
		map.put("fee", fee);
		map.put("allSum", sumPrice+fee);
		mav.setViewName("order/orderPage");
		mav.addObject("map", map);
		
		return mav;
	}
	
//	@RequestMapping(value="/order/orderInsert.do", method=RequestMethod.POST)
//	public String OrderInsert(HttpSession session, Cart cart, Order order) {
//		
//		String userId = ((Member)session.getAttribute("member")).getUserId();	// 세션 아이디값
//		
//		System.out.println("orderController[Cart 정보] : " + cart);
//		
//		Calendar cal = Calendar.getInstance();
//		int year = cal.get(Calendar.YEAR);
//		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		String subNum = "";
//		
//		for (int i = 0; i <= 6; i ++) {
//			subNum += (int)(Math.random() * 10);
//		}
//		
//		String orderId = ymd + "_" + subNum;
//		
//		order.setOrderid(orderId);
//		order.setOrderuserid(userId);
//		
//		orderService.insertOrder(order);
//		
//		return "redirect:/order/orderFinish";
//	}
	
	@RequestMapping("order/orderFinish.do")
	public String orderFinish(HttpSession session) {
		
		return "order/orderFinish";
	}
	
	@RequestMapping("order/orderList.do")
	public String orderList(HttpSession session) {
		
		return "order/orderList";
	}
	
	@RequestMapping("order/orderDetail.do")
	public String orderDetail(HttpSession session) {
		
		return "order/orderDetail";
	}

}
