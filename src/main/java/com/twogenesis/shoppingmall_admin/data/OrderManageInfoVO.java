package com.twogenesis.shoppingmall_admin.data;

import java.util.Date;

import lombok.Data;

@Data
public class OrderManageInfoVO {
    private Integer oi_seq;
    private Integer pi_seq;
    private Double oi_price;
    private Integer oi_count;
    private Double order_amount;
    private String oi_shipping_name;
    private String oi_shipping_phone;
    private String oi_shipping_request;
    private String oi_shipping_address;
    private String oi_pay_type;
    private Integer oi_delivery_status;
    private String oi_delivery_number;
    private Integer oi_status;
    private Date oi_reg_dt;
    private Date oi_mod_dt;
    private String pi_name;
    private String di_name;
    private Integer di_price;
    private String si_name;
    private Integer si_seq;
}
