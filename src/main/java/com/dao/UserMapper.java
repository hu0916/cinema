package com.dao;

import org.apache.ibatis.annotations.*;

import java.util.List;
import com.entity.User;

@Mapper
public interface UserMapper {
    int insert(@Param("user") User user);

    int insertSelective(@Param("user") User user);

    int insertList(@Param("users") List<User> users);

    int updateByPrimaryKeySelective(@Param("user") User user);

    User getUserByUsername(String username);

    int countUser();

    @Select("select * from user where status<#{status} and #{min} <status limit #{start},#{end}")
    List<User> findAllUser(@Param("start") int start,@Param("end") int end,@Param("status")int status,@Param("min")int min);

    @Select("select * from user where username=#{username} ")
    User findUserByUsername(@Param("username")String username);

    @Update("update user set password='111111' where username=#{username} ")
    int resetPassword(@Param("username") String username);

    @Update("update user set status=#{status}  where username=#{username} ")
    int banUser(@Param("username") String username,@Param("status")int status);

    @Select("select * from user where status='1'")
    int countAdmin();

    @Delete("delete user where uid=#{uid} ")
    int delAdmin(@Param("uid") int uid);

    @Insert("insert into user (status, username, password, nickname, phone, email) values (#{user.status} ,#{user.username},#{user.password} ,#{user.nickname} ,#{user.phone} ,#{user.email}  )")
    int adminInsert(@Param("user") User user);
}
