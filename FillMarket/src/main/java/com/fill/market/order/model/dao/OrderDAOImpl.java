package com.fill.market.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.cart.model.vo.Cart;
import com.fill.market.order.model.vo.Order;

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

	@Override
	public int insertOrder(Order order) {
		
		return sqlSession.insert("orderSQL.insertOrder", order);
	}

	@Override
	public void deleteCart(String userId) {
		
		sqlSession.delete("orderSQL.deleteCart", userId);
		
	}

	@Override
	public List<Map<String, String>> orderList(int cPage, int numPerPage, String userId) {
		
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("orderSQL.orderList", null, rows);
	}

	@Override
	public int orderTotalContents(String userId) {
		
		return sqlSession.selectOne("orderSQL.orderTotalContents", userId);
	}



}
