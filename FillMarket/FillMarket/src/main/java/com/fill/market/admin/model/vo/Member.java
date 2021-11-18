package com.fill.market.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class Member {

	private String userid;
	private int leveltype;
	private String password;
	private String username;
	private Date birth;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private Date enrollDate;
	private String status;
	
}
