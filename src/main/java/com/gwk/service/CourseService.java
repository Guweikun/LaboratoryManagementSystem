package com.gwk.service;

import com.gwk.mapper.CourseMapper;
import com.gwk.mapper.UserMapper;
import com.gwk.pojo.Course;
import com.gwk.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseMapper courseMapper;

    public List<Course> CourseList(){
        return courseMapper.selectAllCourse();
    }

    public int insertCourse(Course course){
        return courseMapper.insertCourse(course);
    }

    public void deleteCourse(String CourseName){
        courseMapper.deleteCourse(CourseName);
    }

    public void updateCourse(Course course){
        courseMapper.updateCourse(course);
    }
}
