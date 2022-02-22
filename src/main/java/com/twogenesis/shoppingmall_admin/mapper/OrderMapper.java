package com.twogenesis.shoppingmall_admin.mapper;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.OrderManageInfoVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
    List<OrderManageInfoVO> selectOrderManageInfo(Integer seq,Integer offset);
    Integer selectOrderManageInfoCount(Integer seq);
    void updateOrderStatus(Integer seq, String delivery_no);
}
