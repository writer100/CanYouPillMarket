package com.fill.market.order.model.service;

import java.util.List;

import com.fill.market.cart.model.vo.Cart;

public interface OrderService {


	List<Cart> orderPage(String userId);

	int sumPrice(String userId);

}
