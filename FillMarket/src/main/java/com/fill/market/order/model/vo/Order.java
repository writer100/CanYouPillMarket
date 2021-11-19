package com.fill.market.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class Order implements Serializable {
	
	private static final long serialVersionUID = 22L;
	
	private int orderNo;
	private String orderUserId;
	private int pNo;
	private int totalPrice;
	private Date orderEnroll;
	private String customerName;
	private String receiverName;
	private String addRess1;
	private String addRess2;
	private String phone;

}
