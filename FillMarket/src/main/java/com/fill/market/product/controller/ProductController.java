package com.fill.market.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fill.market.admin.model.vo.PAttachment;
import com.fill.market.admin.model.vo.Product;
import com.fill.market.common.Utils;
import com.fill.market.product.model.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/productList.do")
	public String selectBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model
			) {
		
		// 한 페이지당 상품 수
		int numPerPage = 8;
		
		// 현재 페이지와 한 페이지당 게시글 수를 같이 가지고 DB에 조회
		// 현재  페이지의 상품 수 
		List<Map<String, String>> list = productService.selectProductList(cPage, numPerPage);
				//컬럼명  값
				// ㄴ> list에 저 둘이 담기고 담기고 담겨서 목록 생성
		
		// 전체 상품 수
		int totalContents = productService.selectProductTotalContents();
		
		// 페이지 처리 Utils 사용하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "productList.do");
		
		System.out.println("list : " + list);
		System.out.println("pageBar : " + pageBar);
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "product/productList";
	}	
	
	@RequestMapping("/product/productView.do")
	public String productView(@RequestParam int pno, Model model) {
		
		Product product = productService.selectOneProduct(pno);
		
		List<PAttachment> pattachmentList = productService.selectPAttachmentList(pno);
		
		model.addAttribute("product", product);
		model.addAttribute("pattachmentList", pattachmentList);
		
		return "product/productView";
	}

}
