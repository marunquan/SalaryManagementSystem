package com.ssm.service.impl;
import com.ssm.dao.CourseMapper;
import com.ssm.entity.Course;
import com.ssm.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lenovo on 10/29/2019.
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> list(){
        return courseMapper.list();
    }
}