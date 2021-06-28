package com.ssm.service;

import com.ssm.entity.User;

import java.util.List;

public interface UserService {
    public int insert(User user);
    public int delete(String id);
    public User find(String id);
    public int update(User user);
    public List<User> list() ;
    public User selectByPrimaryKey(String id);
    User login(String name, String pwd);
    User login1(String name, String pwd);
}
