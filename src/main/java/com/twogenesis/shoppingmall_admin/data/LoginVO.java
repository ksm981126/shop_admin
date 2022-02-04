package com.twogenesis.shoppingmall_admin.data;

import com.twogenesis.shoppingmall_admin.util.AESAlgorithm;

public class LoginVO {
    private String user_id;
    private String user_pwd;

    public void setUser_id(String user_id){
        this.user_id = user_id;
    }
    public String getUser_id() {
        return this.user_id;
    }
    public void setUser_pwd(String user_pwd)throws Exception{
        this.user_pwd = AESAlgorithm.Encrypt(user_pwd);
    }
    public String getUser_pwd(){
        return this.user_pwd;
    }
}
