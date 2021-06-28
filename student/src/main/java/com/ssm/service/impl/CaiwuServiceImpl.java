package com.ssm.service.impl;

import com.ssm.dao.CaiwuMapper;
import com.ssm.entity.Caiwu;
import com.ssm.service.CaiwuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("CaiwuServiceImpl")
public class CaiwuServiceImpl implements CaiwuService {
    @Autowired
    private CaiwuMapper caiwuMapper;
    @Override
    public Caiwu login(String name, String pwd){
        return caiwuMapper.login(name,pwd);
    }
}
