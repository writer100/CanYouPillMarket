package com.fill.market.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Component
public class QNARE implements Serializable {
	private int rno;
	private int qano;
	private String qauserid;
	private String rtitle;
	private String rcontents;
	private Date rdate;
}
