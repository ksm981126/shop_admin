package com.twogenesis.shoppingmall_admin.mapper;

import com.twogenesis.shoppingmall_admin.data.MemberProductHistroyVO;
import com.twogenesis.shoppingmall_admin.data.PageConnectHistoryVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HistoryMapper {
    void insertPageConnectHistory(PageConnectHistoryVO data);
    void insertMemberProductHistory(MemberProductHistroyVO data);
}
