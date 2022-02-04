package com.twogenesis.shoppingmall_admin.data;

import java.util.List;

import lombok.Data;

@Data
public class ProductRequest {
    private ProductDataVO p_data;
    private List<ProductImageVO> p_img_list;
    private  ProductDescVO p_desc;
    private List<ProductDescImageVO> p_desc_img_list;
}
