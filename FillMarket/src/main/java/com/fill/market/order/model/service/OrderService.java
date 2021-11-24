package com.fill.market.order.model.service;

import java.util.List;

import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.vo.Order;

public interface OrderService {


	List<Cart> orderPage(String userId);

	int sumPrice(String userId);

	int insertOrder(Order order);

	void deleteCart(String userId);

	List<Order> orderList(Order order);

	List<Order> orderDetail(Order order);


}
