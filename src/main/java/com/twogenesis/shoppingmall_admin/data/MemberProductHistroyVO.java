package com.twogenesis.shoppingmall_admin.data;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberProductHistroyVO {
    private Integer mph_seq;
    private Integer mph_mi_seq;
    private Integer mph_pi_seq;
    private Double mph_interval;
    private Date mph_reg_dt;
}
