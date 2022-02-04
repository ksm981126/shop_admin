package com.twogenesis.shoppingmall_admin.mapper;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.LoginVO;
import com.twogenesis.shoppingmall_admin.data.MemberVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    List<MemberVO> getMemberList(String keyword, String type, Integer offset);
    Integer getMemberCnt(String keyword, String type);
    MemberVO getMemberBySeq(Integer seq);

    void insertMember(MemberVO data);
    void updateMember(MemberVO data);
    void deleteMember(Integer seq);

    Integer isExistEmail(String email);
    MemberVO memberLogin(LoginVO login);
}
