package com.service;

import java.util.List;
import com.entity.User;
public interface UserService{

    int insert(User user);

    int insertSelective(User user);

    int insertList(List<User> users);

    int updateByPrimaryKeySelective(User user);

    User getUserByUsername(String username);

    int countUser();

    List<User> findAllUser(int start,int end,int status,int min);

    User findUserByUsername(String username);

    int resetPassword(String username);

    int banUser(String username,int status);

    int countAdmin();

    int delAdmin(int uid);

    int adminInsert(User user);

}
