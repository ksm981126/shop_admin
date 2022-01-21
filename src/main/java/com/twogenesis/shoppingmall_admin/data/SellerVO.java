package com.twogenesis.shoppingmall_admin.data;

import java.util.Date;

import lombok.Data;
@Data
public class SellerVO {
    private Integer si_seq;
    private String si_id;
    private String si_pwd;
    private String si_name;
    private String si_email;
    private String si_phone;
    private String si_address;
    private Date si_reg_dt;
    private String si_img_url;
    private Integer si_status;
}
