package com.fill.market.cart.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class Cart implements Serializable {
	
	private static final long serialVersionUID = 23231L;
	
	private int cartNo;
	private String cartUserId;
	private int pNo;
	private int amount;
	private String pName;
	private int pPrice;
	private int orderPrice;

}
