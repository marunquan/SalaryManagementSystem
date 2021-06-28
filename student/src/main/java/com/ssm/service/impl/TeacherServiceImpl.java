package com.ssm.service.impl;

import com.ssm.dao.TeacherMapper;
import com.ssm.entity.Teacher;
import com.ssm.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lenovo on 2019-10-8.
 */
@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> list() {
        return teacherMapper.list();
    }

}