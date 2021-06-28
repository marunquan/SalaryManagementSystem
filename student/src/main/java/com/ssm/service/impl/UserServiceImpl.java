package com.ssm.service.impl;

import com.ssm.dao.UserMapper;
import com.ssm.entity.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> list() {
        return userMapper.list();
    }
    @Override
    public int insert(User user){
        return userMapper.insertSelective(user);
    }
    @Override
    public int delete(String id){
        return  userMapper.deleteByPrimaryKey(id);
    }
    @Override
    public User find(String id){
        return userMapper.selectByPrimaryKey(id);
    }
    @Override
    public int update(User user){
        return userMapper.updateByPrimaryKey(user);
    }
    @Override
    public User selectByPrimaryKey(String id){return userMapper.selectByPrimaryKey(id);}
    @Override
    public User login(String name, String pwd){
        return userMapper.login(name,pwd);
    }
    @Override
    public User login1(String name, String pwd){
        return userMapper.login1(name,pwd);
    }
}
