package com.fill.market.order.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class OrderList {
	
	private int orderno;
	private String orderuserid;
	private int pno;
	private int totalprice;
	private Date orderenroll;
	private String customername;
	private String receivername;
	private String address1;
	private String address2;
	private String phone;
	private String orderid;		// 날짜와 랜덤숫자 조합한 문자열 ####_####
	
	private int pname;
	private int amount;
	private String changename;

}
