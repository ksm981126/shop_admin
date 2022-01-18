package com.twogenesis.shoppingmall_admin.mapper;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.DeliveryVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryMapper {
    List<DeliveryVO> selectDeliveries(String keyword);
    Integer selectDeliveryCnt(String keyword);
    void insertDelivery(DeliveryVO data);
    void updateDelivery(DeliveryVO data);
    void deleteDelivery(Integer seq);
    DeliveryVO selectDeliveryBySeq(Integer seq);
}
