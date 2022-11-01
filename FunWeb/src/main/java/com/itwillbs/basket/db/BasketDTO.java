package com.itwillbs.basket.db;

import java.sql.Timestamp;

import lombok.Data;

//@Data
//@Setter
//@Getter
//@ToString

@Data
public class BasketDTO {
	private int b_num;
	private String b_m_id;
	private int b_g_num;
	private int b_g_amount;
	private String b_g_size;
	private String b_g_color;
	private Timestamp b_date;
}
