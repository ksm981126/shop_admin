package com.twogenesis.shoppingmall_admin.api;

import java.util.LinkedHashMap;
import java.util.Map;

import com.twogenesis.shoppingmall_admin.data.MemberVO;
import com.twogenesis.shoppingmall_admin.mapper.MemberMapper;
import com.twogenesis.shoppingmall_admin.util.AESAlgorithm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member")
public class MemberAPIController {
    @Autowired MemberMapper mapper;
    @GetMapping("/select_one")
    public MemberVO getSelectOne(@RequestParam Integer seq){
        return mapper.getMemberBySeq(seq);
    }
    @PostMapping("/add")
    public Map<String,Object> postAddMember(@RequestBody MemberVO data)throws Exception{
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();
        if(mapper.isExistEmail(data.getMi_email()) ==1 ){
            resultMap.put("status", false);
            resultMap.put("message", data.getMi_email()+"은 이미 등록된 이메일입니다.");
            return resultMap;
        }
        data.setMi_pwd(AESAlgorithm.Encrypt(data.getMi_pwd()));
        mapper.insertMember(data);
        resultMap.put("status", true);
        resultMap.put("message", "회원이 등록되었습니다.");
        return resultMap;
    }
    @PatchMapping("/update")
    public String patchMember(@RequestBody MemberVO data){
        mapper.updateMember(data);
        return "회원정보가 수정되었습니다";
    }
    @DeleteMapping("/delete")
    public String deleteMember(@RequestParam Integer seq){
        mapper.deleteMember(seq);
        return "회원이 삭제되었습니다.";
    }
}
