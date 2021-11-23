package com.fill.market.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.cart.model.vo.Cart;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Cart> orderPage(String userId) {
		
		return sqlSession.selectList("orderSQL.orderPage", userId);
	}

	@Override
	public int sumPrice(String userId) {
		
		return sqlSession.selectOne("orderSQL.sumPrice", userId);
	}



}
