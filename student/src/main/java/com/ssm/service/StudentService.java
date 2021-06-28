package com.ssm.service;

import com.ssm.entity.Student;

import java.util.List;

public interface StudentService {
    public int insert(Student student);
    public int delete(int id);
    public Student find(int id);
    public int update(Student student);
    public List<Student> list() ;
    Student login(String name,String pwd);
}
