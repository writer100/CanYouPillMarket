package com.fill.market.cart.model.dao;


import java.util.List;

import com.fill.market.cart.model.vo.Cart;

public interface CartDAO {
	
	int countCart(int pno, String userId);

	int updateCart(Cart cart);

	int insertCart(Cart cart);

	List<Cart> listCart(String userId);

	int sumPrice(Cart cart);

	void deleteCart(int pno);

	void modifyCart(Cart cart);

}
