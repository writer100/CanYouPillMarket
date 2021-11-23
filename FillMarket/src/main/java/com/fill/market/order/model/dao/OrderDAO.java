package com.fill.market.order.model.dao;

import java.util.List;

import com.fill.market.cart.model.vo.Cart;

public interface OrderDAO {
	
	List<Cart> orderPage(String userId);
	
	int sumPrice(String userId);

}
