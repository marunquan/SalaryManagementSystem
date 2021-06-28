package com.ssm.service.impl;

import com.ssm.dao.SlbMapper;
import com.ssm.entity.Slb;
import com.ssm.service.SlbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("SlbServiceImpl")
public class SlbServiceImpl implements SlbService {
    @Autowired
    private SlbMapper slbMapper;
    @Override
    public Slb find(int id){
        return slbMapper.selectByPrimaryKey(id);
    }
    @Override
    public List<Slb> list() {
        return slbMapper.list();
    }
    @Override
    public int update(Slb slb){
        return slbMapper.updateByPrimaryKey(slb);
    }
}
