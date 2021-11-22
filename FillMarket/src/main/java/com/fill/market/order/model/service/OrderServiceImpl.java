package com.fill.market.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.order.model.dao.OrderDAO;
import com.fill.market.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public void insertOrder(Order order) {
		
		return orderDAO.insertOrder(order);
		
	}

}
