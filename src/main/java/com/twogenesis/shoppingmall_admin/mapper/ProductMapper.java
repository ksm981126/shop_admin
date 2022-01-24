package com.twogenesis.shoppingmall_admin.mapper;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.ProductVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
    List<ProductVO> selectProductList(String keyword, Integer offset);
}
