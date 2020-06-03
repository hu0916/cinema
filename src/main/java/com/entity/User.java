package com.entity;

import lombok.Data;

@Data
public class User {
    private Integer Uid;
    private Integer status;//状态-1正常，0banned,123 管理员权限
    private String username;
    private String password;
    private String nickname;//昵称/员工姓名
    private String phone;//电话
    private String email;//预留
    private String avatar;//头像
}
