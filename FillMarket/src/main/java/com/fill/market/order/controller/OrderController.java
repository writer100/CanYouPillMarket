package com.fill.market.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fill.market.admin.model.vo.Member;
import com.fill.market.order.model.service.OrderService;
import com.fill.market.order.model.vo.Order;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order/orderPage")
	public String orderPage() {
		
		return "order/orderPage";
		
	}

	
//	@RequestMapping(value="/order/orderInsert.do", method=RequestMethod.POST)
//	public String OrderInsert(HttpSession session, Order order) {
//		
//		String userId = ((Member)session.getAttribute("member")).getUserId();	// 세션 아이디값
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
//	
	

}
