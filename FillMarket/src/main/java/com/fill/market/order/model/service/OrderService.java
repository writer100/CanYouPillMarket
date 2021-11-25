package com.fill.market.order.model.service;

import java.util.List;

import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.vo.Order;
import com.fill.market.order.model.vo.OrderDetail;
import com.fill.market.order.model.vo.OrderList;

public interface OrderService {


	List<Cart> orderPage(String userId);

	int sumPrice(String userId);

	void insertOrder(Order order);

	void deleteCart(String userId);

	List<OrderList> orderList(OrderList orderList);

	List<OrderList> orderDetail(OrderList orderList);

	void insertOrderDetail(OrderDetail orderDetail);


}
