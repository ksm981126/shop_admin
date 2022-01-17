package com.twogenesis.shoppingmall_admin.data;

import lombok.Data;

@Data
public class CategoryVO {
    private Integer cate_seq;
    private String cate_name;
    private Integer cate_parent;
    private Integer count;
    private String parent_name;
}
