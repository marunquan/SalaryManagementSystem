package com.ssm.service;

import com.ssm.entity.Slb;

import java.util.List;

public interface SlbService {
    public List<Slb> list() ;
    public int update(Slb slb);
    public Slb find(int id);
}
