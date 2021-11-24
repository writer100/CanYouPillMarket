package com.fill.market.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.dao.OrderDAO;
import com.fill.market.order.model.vo.Order;

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

	@Override
	public int insertOrder(Order order) {
		
		return orderDAO.insertOrder(order);
	}

	@Override
	public void deleteCart(String userId) {

		orderDAO.deleteCart(userId);
		
	}

	@Override
	public List<Order> orderList(Order order) {
		
		return orderDAO.orderList(order);
	}

	@Override
	public List<Order> orderDetail(Order order) {
		
		return orderDAO.orderDetail(order);
	}
	

}
