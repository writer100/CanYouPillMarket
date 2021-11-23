package com.fill.market.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;

	@Override
	public List<Cart> orderPage(String userId) {
		
		return orderDAO.orderPage(userId);
	}

	@Override
	public int sumPrice(String userId) {
		
		return orderDAO.sumPrice(userId);
	}
	

}
