package com.twogenesis.shoppingmall_admin.data;

import java.util.List;

import lombok.Data;

@Data
public class ProductResponse {
    private ProductVO p_data;
    private List<String> p_img_list;
    private String p_desc;
    private List<String> p_desc_img_list;
}
