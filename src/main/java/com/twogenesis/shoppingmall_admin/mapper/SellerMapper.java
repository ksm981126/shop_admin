package com.twogenesis.shoppingmall_admin.mapper;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.SellerVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerMapper {
    List<SellerVO>selectSellerList(String keyword, Integer offset);
    Integer selectSellerCnt(String keyword);
    void insertSeller(SellerVO data);
    void updateSeller(SellerVO data);
    void deleteSeller(Integer seq);
    SellerVO selectSellerBySeq(Integer seq);
    Integer isExistSellerId(String id);
}
