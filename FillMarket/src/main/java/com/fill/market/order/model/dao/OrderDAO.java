package com.fill.market.order.model.dao;

import java.util.List;

import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.vo.Order;

public interface OrderDAO {
	
	List<Cart> orderPage(String userId);
	
	int sumPrice(String userId);
	
	int insertOrder(Order order);
	
	void deleteCart(String userId);
	
	List<Order> orderList(Order order);
	
	List<Order> orderDetail(Order order);

}
