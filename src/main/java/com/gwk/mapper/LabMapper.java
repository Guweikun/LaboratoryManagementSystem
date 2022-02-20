package com.gwk.mapper;

import com.gwk.pojo.Lab;

import java.util.List;

public interface LabMapper {

    List<Lab> selectAllLab();

    int insertLab(Lab lab);

    void deleteLab(String address);

    void updateLab(Lab lab);
}
