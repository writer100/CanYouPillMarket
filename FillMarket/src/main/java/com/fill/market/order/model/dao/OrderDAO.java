package com.fill.market.order.model.dao;

import java.util.List;
import java.util.Map;

import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.vo.Order;

public interface OrderDAO {
	
	List<Cart> orderPage(String userId);
	
	int sumPrice(String userId);
	
	int insertOrder(Order order);
	
	void deleteCart(String userId);
	
	List<Map<String, String>> orderList(int cPage, int numPerPage, String userId);
	
	int orderTotalContents(String userId);

}
