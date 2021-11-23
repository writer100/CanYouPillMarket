package com.fill.market.order.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, String>> orderList(int cPage, int numPerPage, String userId) {
		
		return orderDAO.orderList(cPage, numPerPage, userId);
	}

	@Override
	public int orderTotalContents(String userId) {
		
		return orderDAO.orderTotalContents(userId);
	}
	

}
