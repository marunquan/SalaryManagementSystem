package com.ssm.service.impl;

import com.ssm.dao.AdminMapper;
import com.ssm.entity.Admin;
import com.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin login(String name, String pwd){
        return adminMapper.login(name,pwd);
    }
}
