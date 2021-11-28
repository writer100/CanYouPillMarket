package com.fill.market.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.product.model.dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<Map<String, String>> selectProductList(int cPage, int numPerPage, int cno) {
		
		return productDAO.selectProductList(cPage, numPerPage, cno);
	}

	@Override
	public int selectProductTotalContents(int cno) {
		
		return productDAO.selectProductTotalContents(cno);
	}


	@Override
	public Product selectOneProduct(int pno) {
		
		return productDAO.selectOneProduct(pno);
	}

	@Override
	public List<PAttachment> selectPAttachmentList(int pno) {
		
		return productDAO.selectPAttachmentList(pno);
	}


}
