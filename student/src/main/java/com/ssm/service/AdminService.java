package com.ssm.service;

import com.ssm.entity.Admin;

import java.util.List;

public interface AdminService {
    Admin login(String name, String pwd);
}
