package com.ssm.service.impl;

import com.ssm.dao.StudentMapper;
import com.ssm.entity.Student;
import com.ssm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lenovo on 2019-10-6.
 */
@Service("studentServiceImpl")
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public List<Student> list() {
        return studentMapper.list();
    }
    @Override
    public int insert(Student student){
        return studentMapper.insertSelective(student);
    }
    @Override
    public int delete(int id){
        return  studentMapper.deleteByPrimaryKey(id);
    }
    @Override
    public Student find(int id){
        return studentMapper.selectByPrimaryKey(id);
    }
    @Override
    public int update(Student student){
        return studentMapper.updateByPrimaryKey(student);
    }
    @Override
    public Student login(String name,String pwd){
        return studentMapper.login(name,pwd);
    }
}