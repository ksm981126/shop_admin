package com.twogenesis.shoppingmall_admin.data;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewInfoVO {
    private Integer ri_seq;
    private String ri_content;
    private Integer ri_mi_seq;
    private Integer ri_pi_seq;
    private Integer ri_score;
    private Integer ri_oi_seq;
    private Date ri_reg_dt;
    private Date ri_mod_dt;
    
    private String email;
}
