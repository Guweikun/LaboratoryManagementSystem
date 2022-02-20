package com.gwk.mapper;

import com.gwk.pojo.Course;
import com.gwk.pojo.User;

import java.util.List;

public interface CourseMapper {

    List<Course> selectAllCourse();

    int insertCourse(Course course);

    void deleteCourse(String course_name);

    void updateCourse(Course course);
}
