package com.twogenesis.shoppingmall_admin.controller;

import javax.servlet.http.HttpSession;

import com.twogenesis.shoppingmall_admin.data.LoginVO;
import com.twogenesis.shoppingmall_admin.data.MemberVO;
import com.twogenesis.shoppingmall_admin.data.SellerVO;
import com.twogenesis.shoppingmall_admin.mapper.MemberMapper;
import com.twogenesis.shoppingmall_admin.mapper.SellerMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {
    @Autowired MemberMapper member_mapper;
    @Autowired SellerMapper seller_mapper;
    @GetMapping("/")
    public String getMain(HttpSession session) {
        //로그인 시도 여부를 검사하기 위해서 session에 저장된 값 try_login을 가져온다
        Boolean try_login = (Boolean)session.getAttribute("try_login");
        //가져온 값이 null 또는 false 라면, 로그인 시도 없이 F5를 누른 동작
        if(try_login == null || try_login == false){
            //status와 msg를 제거
            session.setAttribute("login_status", null);
            session.setAttribute("login_msg", null);
        }
        //로그인 하지 않은 상태로 초기화
        session.setAttribute("try_login", false);
        return "/index";
    }
    // RestController - RequestBody 입력 데이터를 같이 실어 보낸다.
    // Controller - FormData로 전송 (Payload) - RequestBody 쓰지 않음.
    // Model은 해당 페이지 내에서만 사용할 수 있는 Local(지역)변수
    // Session은 해당 서비스 전체에서 사용할 수 있는 Global(전역)변수
    @PostMapping("/login")
    public String getLogin(LoginVO data, HttpSession session){
        session.setAttribute("try_login", true);
        SellerVO seller =seller_mapper.loginSeller(data);
        if(seller != null ){
            if(seller.getSi_status() == 2){
                session.setAttribute("login_status", "stopped");
                session.setAttribute("login_msg", "사용 정지된 계정입니다. 관리자에게 문의하세요");
                return "redirect:/";
            }
            if(seller.getSi_status() == 3){
                session.setAttribute("login_status", "blocked");
                session.setAttribute("login_msg", "영구 정지된 계정입니다. (사유 :인가되지 않은 상품 판매)");
                return "redirect:/";
            }
            session.setAttribute("login_seller", seller);
            session.setAttribute("login_status", "normal");
            return "redirect:/summary";
        }
        session.setAttribute("login_status", "failed");
        session.setAttribute("login_msg", "아이디 혹은 비밀번호 오류입니다.");
        System.out.println(data.getUser_id());
        System.out.println(data.getUser_pwd());
        return "redirect:/";
    }
    @GetMapping("/logout")
    public String getLogout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/admin")
    public String getAdmin(HttpSession session){
        Boolean try_login = (Boolean)session.getAttribute("try_admin_login");
        //가져온 값이 null 또는 false 라면, 로그인 시도 없이 F5를 누른 동작
        if(try_login == null || try_login == false){
            //status와 msg를 제거
            session.setAttribute("admin_status", null);
            session.setAttribute("admin_msg", null);
        }
        //로그인 시도하지 않은 상태로 초기화
        session.setAttribute("try_admin_login", false);
        return "/admin/login";
    }
    
    @PostMapping("/admin/login")
    public String postAdminLogin(LoginVO admin, HttpSession session){
        MemberVO member = member_mapper.memberLogin(admin);
        if(member != null){
            if(member.getMi_role() == 1){
                session.setAttribute("admin_status", "failed");
                session.setAttribute("admin_msg", "관리자 전용 로그인 입니다.");
                return "redirect:/admin";
            }
            session.setAttribute("adminuser", member);
            session.setAttribute("admin_status", "success");
            session.setAttribute("admin_msg", null);
            return "redirect:/summary";
        
        }
        session.setAttribute("admin_status", "failed");
        session.setAttribute("admin_msg", "아이디 또는 비밀번호 오류입니다.");
        return "redirect:/admin";
    }
    @GetMapping("/admin/logout")
    public String getAdminLogout(HttpSession session){
        session.invalidate();
        return "redirect:/admin";
    }
}
