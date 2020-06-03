package com.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.entity.User;
import com.dao.UserMapper;
import com.service.UserService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Override
    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }

    @Override
    public int countUser() {
        return userMapper.countUser();
    }

    @Override
    public List<User> findAllUser(int start, int end,int status,int min) {
        return userMapper.findAllUser(start,end,status,min);
    }

    @Override
    public User findUserByUsername(String username) {
        return userMapper.findUserByUsername(username);
    }

    @Override
    public int resetPassword(String username) {
        return userMapper.resetPassword(username);
    }

    @Override
    public int banUser(String username,int status) {
        return userMapper.banUser(username,status);
    }

    @Override
    public int countAdmin() {
        return userMapper.countAdmin();
    }

    @Override
    public int delAdmin(int uid) {
        return userMapper.delAdmin(uid);
    }

    @Override
    public int adminInsert(User user) {
        return userMapper.adminInsert(user);
    }

    @Resource
    private UserMapper userMapper;

    @Override
    public int insert(User user){
        return userMapper.insert(user);
    }

    @Override
    public int insertSelective(User user){
        return userMapper.insertSelective(user);
    }

    @Override
    public int insertList(List<User> users){
        return userMapper.insertList(users);
    }

    @Override
    public int updateByPrimaryKeySelective(User user){
        return userMapper.updateByPrimaryKeySelective(user);
    }


}
