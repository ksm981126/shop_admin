package com.twogenesis.shoppingmall_admin.data;

import lombok.Data;

@Data
public class ProductDataVO {
    private Integer pi_seq;
    private String pi_name;
    private Integer pi_price;
    private String pi_sub_title;
    private Double pi_discount_rate;
    private Double pi_point_rate;
    private Integer pi_stock;
    private Integer pi_cate_seq;
    private Integer pi_seller_seq;
    private Integer pi_delivery_seq;
    private Integer pi_mfi_seq;
    private Integer pi_status;
}
